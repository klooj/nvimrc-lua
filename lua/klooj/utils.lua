local M = {}

--[[ lots of help from lua-users.org/wiki
# iterate over all non-empty lines
for line in str:gmatch("[^\r\n]+") do ... end

# check if string is a repition of a pattern
str:gsub(pat, "") == "
## ... and satisfies a condition
str:gsub(pat, function(s) return ok(s) and "" or "*" end) == ""
## .. or of a pattern seperated by whitespace
not str:gsub(pat, ""):find"%S"

]]

M.starts_with = function(str, start)
	return str:sub(1, #start) == start
end

M.ends_with = function(str, ending)
	return ending == "" or str:sub(-#ending) == ending
end

-- KJ.from_file("foo.md")
M.from_file = function(fname)
	return function()
		local file = io.open(fname)
		local data = "FAILED TO LOAD " .. fname
		if file then
			data = file:read "*a"
			file:close()
		end
		return data
	end
end


--[[ |> SORT TABLES
example usage:
for key, val in KJ.sorted_pairs(someTable) do
print(key .. " : " .. val)
end
]]

local __sortedx = function(t)
	local orderedx = {}
	for k in pairs(t) do
		table.insert(orderedx, k)
	end
	table.sort(orderedx) -- change this to change the sorting algo used
	return orderedx
end

local sorted_next = function(t, state)
	local key = nil
	if state == nil then
		t.__ordered = __sortedx(t)
		key = t.__ordered[1]
	else
		for i = 1, #t.__ordered do
			if t.__ordered[i] == state then
				key = t.__ordered[i+1]
			end
		end
	end
	if key then
		return key, t[key]
	end
	t.__ordered = nil
	return
end

M.sorted_pairs = function(t)
	return sorted_next, t, nil
end
-- <|

-- Count the number of times a value occurs in a table
M.table_count = function(t, item)
  local count = 0
  for _, x in pairs(t) do
    if item == x then count = count + 1 end
  end
  return count
end

-- remove duplicates from list-style table; not for key=value
M.table_unique = function(t)
  local newtable = {}
  for _, x in ipairs(t) do
    if(M.table_count(newtable, x) == 0) then
      newtable[#newtable+1] = x
    end
  end
  return newtable
end

return setmetatable({}, {
	__index = function(_, k)
		if M[k] then
			return M[k]
		end
	end
})

----------------
--[[
M.filter_files = function(file_list)
local filtered_list = {}
local unique_strings = {}
local index = 1
for _, v in pairs(file_list) do
if unique_strings[v] == nil then
unique_strings[v] = index
filtered_list[index] = v
index = index + 1
end
end
return filtered_list
end

M.filename_extension = function(file_path)
return file_path:match('%.(%w+)$') or ''
end
]]
