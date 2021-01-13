-- originally from github.com/Th3Whit3Wolf
local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree', 'vista', 'dbui'}


local vimode = require('mood.providers.vimode')
local i = require('mood.wolf_icons')
local c = require('mood.wolf_colors')
local u = require('mood.wolf_utils')
local diagnostic = require('mood.providers.diagnostic')
local vcs = require('mood.providers.vcs')
local buffer = require('mood.providers.buffer')
local fileinfo = require('mood.providers.fileinfo')
local extension = require('mood.providers.extension')

-- local colors = {
--     bg = "#282c34",
--     bg2 = "#212026",
--     base = "#b2b2b2",
--     comp = "#c56ec3",
--     act1 = "#222226",
--     DarkGoldenrod2 = "#eead0e", -- normal / unmodified
--     chartreuse3 = "#66cd00", --insert
--     SkyBlue2 = "#7ec0ee", -- modified
--     chocolate = "#d2691e", -- replace
--     gray = "#bebebe", -- visual
--     plum3 = "#cd96cd", -- read-only / motion
--     yellow = "#fabd2f",
--     cyan = "#008080",
--     darkblue = "#081633",
--     green = "#afd700",
--     orange = "#FF8800",
--     purple = "#5d4d7a", --act2
--     magenta = "#d16d9e",
--     grey = "#c0c0c0",
--     blue = "#0087d7",
--     red = "#ec5f67",
--     comments = "#2aa1ae",
--     head1 = "#4f97d7",
--     error = "#FC5C94",
--     warning = "#F3EA98",
--     info = "#8DE6F7"
--   }
-- local c = colors


BufferIcon = buffer.get_buffer_type_icon
BufferNumber = buffer.get_buffer_number
DiagnosticError = diagnostic.get_diagnostic_error
DiagnosticWarn = diagnostic.get_diagnostic_warn
DiagnosticInfo = diagnostic.get_diagnostic_info
DiagnosticEndSpace = diagnostic.end_space
DiagnosticSeperator = diagnostic.seperator
DiffAdd = vcs.diff_add
DiffModified = vcs.diff_modified
DiffRemove = vcs.diff_remove
FileFormat = fileinfo.get_file_format
FileEncode = fileinfo.get_file_encode
FileSize = fileinfo.get_file_size
FileIcon = fileinfo.get_file_icon
FileName = fileinfo.get_current_file_name
FileType = fileinfo.get_file_type
FileTypeName = buffer.get_buffer_filetype
FileTypeSeperator = fileinfo.filetype_seperator
GitBranch = vcs.get_git_branch_formatted
GitSeperator = vcs.seperator
LineColumn = fileinfo.line_column
LinePercent = fileinfo.current_line_percent
ScrollBar = extension.scrollbar_instance
Space = u.space
ViMode = vimode.get_mode
ViModeSeperator = vimode.seperator

gls.left[1] = {
  ViMode = {
    provider = ViMode,
    highlight = {c.color('act1'), c.color('DarkGoldenrod2')}
  }
}

gls.left[2] = {
  ViModeSeperator = {
    provider = ViModeSeperator,
    highlight = {
      c.color('comments'),
      function()
        if not u.buffer_not_empty() or vim.bo.filetype == 'dashboard' then
          return c.color('purple')
        end
        return c.color('bg2')
      end
    }
  }
}

gls.left[3] = {
  FileSize = {
    provider = FileSize,
    condition = u.buffer_not_empty,
    highlight = {c.color('white'), c.color('bg2')}
  }
}

gls.left[4] = {
  FileName = {
    provider = FileName,
    condition = u.buffer_not_empty,
    separator = i.slant.Left,
    separator_highlight = {c.color('purple'), c.color('bg2')},
    highlight = {c.color('comp'), c.color('bg2'), "bold"}
  }
}

gls.left[5] = {
  FileType = {
    provider = FileType,
    condition = u.buffer_not_empty,
    highlight = {c.color('white'), c.color('purple')}
  }
}

gls.left[6] = {
  FileTypeSeperator = {
    provider = FileTypeSeperator
  }
}

gls.left[7] = {
  DiagnosticError = {
    provider = DiagnosticError,
    icon = " " .. i.bullet,
    highlight = {c.color('error'), c.color('bg2')}
  }
}

gls.left[9] = {
  DiagnosticWarn = {
    provider = DiagnosticWarn,
    icon = " " .. i.bullet,
    highlight = {c.color('warning'), c.color('bg2')}
  }
}

gls.left[10] = {
  DiagnosticInfo = {
    provider = DiagnosticInfo,
    icon = " " .. i.bullet,
    highlight = {c.color('info'), c.color('bg2')}
  }
}

gls.left[11] = {
  DiagnosticEndSpace = {
    provider = DiagnosticEndSpace,
    highlight = {c.color('bg2'), c.color('bg2')}
  }
}

gls.left[12] = {
  DiagnosticSeperator = {
    provider = DiagnosticSeperator,
    highlight = {c.color('purple'), c.color('bg2')}
  }
}

gls.left[13] = {
  GitBranch = {
    provider = GitBranch,
    icon = " " .. i.git .. " ",
    condition = u.buffer_not_empty,
    highlight = {c.color('base'), c.color('purple')}
  }
}

gls.left[14] = {
  DiffAdd = {
    provider = DiffAdd,
    condition = u.checkwidth,
    icon = i.diff.Add,
    highlight = {c.color('green'), c.color('purple')}
  }
}
gls.left[15] = {
  DiffModified = {
    provider = DiffModified,
    condition = u.checkwidth,
    icon = i.diff.Modified,
    highlight = {c.color('orange'), c.color('purple')}
  }
}
gls.left[16] = {
  DiffRemove = {
    provider = DiffRemove,
    condition = u.checkwidth,
    icon = i.diff.Remove,
    highlight = {c.color('red'), c.color('purple')}
  }
}

gls.left[17] = {
  GitSeperator = {
    provider = GitSeperator,
    condition = u.buffer_not_empty,
    highlight = {c.color('purple'), c.color('bg2')}
  }
}

gls.left[18] = {
  Space = {
    provider = Space,
    highlight = {c.color('blue'), c.color('purple')}
  }
}

gls.right[1] = {
  FileFormat = {
    provider = FileFormat,
    highlight = {c.color('base'), c.color('purple')}
  }
}
gls.right[2] = {
  LineColumn = {
    provider = LineColumn,
    separator = " | ",
    separator_highlight = {c.color('base'), c.color('purple')},
    highlight = {c.color('base'), c.color('purple')}
  }
}
gls.right[3] = {
  numln = {
    provider = function() return vim.fn.line('$') end,
    separator = i.slant.Right,
    separator_highlight = {c.color('bg2'), c.color('purple')},
    highlight = {c.color('base'), c.color('bg2')}
  }
}
gls.right[4] = {
  ScrollBar = {
    provider = ScrollBar,
    highlight = {c.color('yellow'), c.color('purple')}
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = FileTypeName,
    separator = i.slant.Right,
    separator_highlight = {c.color('purple'), c.color('bg')},
    highlight = {c.color('base'), c.color('purple')}
  }
}

gls.short_line_right[1] = {
  BufferIcon  = {
    provider = BufferIcon,
    separator = i.slant.Left,
    separator_highlight = {c.color('purple'), c.color('bg')},
    highlight = {c.color('base'), c.color('purple')}
  }
}
-- gls.right[3] = {
--     PerCent = {
--         provider = LinePercent,
--         separator = i.slant.Left,
--         separator_highlight = {c.color('bg2'), c.color('purple')},
--         highlight = {c.color('base'), c.color('bg2')}
--     }
-- }
