local ft = vim.bo.filetype
local vim = vim
local i = require("mood.wolf_icons")
local c = require("mood.wolf_colors")
local u = require("mood.wolf_utils")
local diagnostic = require("mood.providers.diagnostic")
local git =  {}
local M = {}

function M.exists(file)
    if file == '' or file == nil then return false end
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end

function M.isdir(path)
    if path == '' or path == nil then return false end
    -- "/" works on both Unix and Windows
    return M.exists(path .. "/")
end

function M.get_root_dir(path)
    -- return parent path for specified entry (either file or directory)
    local function pathname(path)
        local prefix = ""
        local i = path:find("[\\/:][^\\/:]*$")
        if i then
            prefix = path:sub(1, i - 1)
        end

        return prefix
    end

    -- Checks if provided directory contains git directory
    local function has_git_dir(dir)
        local git_dir = dir .. "/.git"
        if M.isdir(git_dir) then
            return git_dir
        end
    end

    local function has_git_file(dir)
        local gitfile = io.open(dir .. "/.git")
        if not gitfile then
            return false
        end

        local git_dir = gitfile:read():match("gitdir: (.*)")
        gitfile:close()

        return git_dir and dir .. "/" .. git_dir
    end

    -- Set default path to current directory
    if not path or path == "." then
        path = io.popen "cd":read "*l"
    end

    -- Calculate parent path now otherwise we won't be able to do that inside of logical operator
    local parent_path = pathname(path)

    return has_git_dir(path)
        or has_git_file(path)
        -- Otherwise go up one level and make a recursive call
        or (parent_path ~= path and M.get_root_dir(parent_path) or nil)
end
function M.check_workspace()
    local current_file = vim.fn.expand("%:p")
    if current_file == '' or current_file == nil then return false end
    local current_dir
    -- if file is a symlinks
    if vim.fn.getftype(current_file) == "link" then
        local real_file = vim.fn.resolve(current_file)
        current_dir = vim.fn.fnamemodify(real_file, ":h")
    else
        current_dir = vim.fn.expand("%:p:h")
    end
    local result = M.get_root_dir(current_dir)
    if not result then
        return false
    end
    return true
end

function M.get_branch()
    if ft == "help" then
        return
    end
    local current_file = vim.fn.expand("%:p")
    local current_dir

    -- if file is a symlinks
    if vim.fn.getftype(current_file) == "link" then
        local real_file = vim.fn.resolve(current_file)
        current_dir = vim.fn.fnamemodify(real_file, ":h")
    else
        current_dir = vim.fn.expand("%:p:h")
    end

    local _, gitbranch_pwd = pcall(vim.api.nvim_buf_get_var, 0, "gitbranch_pwd")
    local _, gitbranch_path = pcall(vim.api.nvim_buf_get_var, 0, "gitbranch_path")
    if gitbranch_path and gitbranch_pwd then
        if gitbranch_path:find(current_dir) and string.len(gitbranch_pwd) ~= 0 then
            return gitbranch_pwd
        end
    end
    local git_dir = M.get_root_dir(current_dir)
    if not git_dir then
        return
    end
    local git_root
    if not git_dir:find("/.git") then
        git_root = git_dir
    end
    git_root = git_dir:gsub("/.git", "")

    -- If git directory not found then we're probably outside of repo or something went wrong. The same is when head_file is nil
    local head_file = git_dir and io.open(git_dir .. "/HEAD")
    if not head_file then
        return
    end

    local HEAD = head_file:read()
    head_file:close()

    -- if HEAD matches branch expression, then we're on named branch otherwise it is a detached commit
    local branch_name = HEAD:match("ref: refs/heads/(.+)")
    if branch_name == nil then
        return
    end

    vim.api.nvim_buf_set_var(0, "gitbranch_pwd", branch_name)
    vim.api.nvim_buf_set_var(0, "gitbranch_path", git_root)

    return branch_name .. " "
end


-- get diff datas
-- support plugins: vim-gitgutter vim-signify coc-git
local function get_hunks_data()
  -- diff data 1:add 2:modified 3:remove
  local diff_data = {0, 0, 0}
  if vim.fn.exists("*GitGutterGetHunkSummary") == 1 then
    for idx, v in pairs(vim.fn.GitGutterGetHunkSummary()) do
      diff_data[idx] = v
    end
    return diff_data
  elseif vim.fn.exists("*sy#repo#get_stats") == 1 then
    diff_data[1] = vim.fn["sy#repo#get_stats"]()[1]
    diff_data[2] = vim.fn["sy#repo#get_stats"]()[2]
    diff_data[3] = vim.fn["sy#repo#get_stats"]()[3]
    return diff_data
  elseif vim.fn.exists("b:gitsigns_status_dict") == 1 then
    local gitsigns_dict = vim.api.nvim_buf_get_var(0, "gitsigns_status_dict")
    diff_data[1] = gitsigns_dict["added"]
    diff_data[2] = gitsigns_dict["changed"]
    diff_data[3] = gitsigns_dict["removed"]
  end
  return diff_data
end

function M.diff_add()
  local add = get_hunks_data()[1]
  if add > 0 then
    return add .. " "
  end
end

function M.diff_modified()
  local modified = get_hunks_data()[2]
  if modified > 0 then
    return modified .. " "
  end
end

function M.diff_remove()
  local removed = get_hunks_data()[3]
  if removed > 0 then
    return removed .. " "
  end
end

function M.get_git_branch_formatted()
  if diagnostic.has_diagnostics() then
    u.GalaxyBG("GitBranch", c.purple)
  else
    u.GalaxyBG("GitBranch", c.bg2)
  end
  return M.get_branch()
end

function M.seperator()
  if diagnostic.has_diagnostics() and not M.check_workspace() then
    return i.slant.Left
  elseif not diagnostic.has_diagnostics() and M.check_workspace() then
    return i.slant.Left
  else
    return ""
  end
end

return M, git
