require('nvim-web-devicons').setup {
  default = true;
}

local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'NvimTree','dbui'}
local background = vim.o.bg
local colors

if background == 'light' then
  local palette = {
    bg_main         = '#ffffff',
    bg_active       = '#d7d7d7',
    fg_active       = '#0a0a0a',
    bg_inactive     = '#efefef',
    fg_inactive     = '#404148',

    red_active      = '#930000',
    green_active    = '#005300',
    yellow_active   = '#703700',
    blue_active     = '#0033c0',
    magenta_active  = '#6320a0',
    cyan_active     = '#004882',
  }
  colors = palette
elseif background == 'dark' then
  local palette = {
    bg_main = '#430419',
    bg_active = '#630419',
    bg_inactive = '#230419',
    fg_active   = '#f5f5f5',
    fg_inactive = '#bebebe',
    red_active = '#FD4949',
    green_active = '#608B4E',
    yellow_active = '#fabd2f',
    cyan_active = '#00C0C0',
    blue_active = '#5A9CD6',
    magenta_active = '#7d4d7a',
    orange = '#FF8800',
    purple = '#7d4d7a',
    darkblue = '#0817A7',
  }
  colors = palette
end
local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  FirstElement = {
    provider = function() return ' ' end,
    highlight = {colors.bg_active, colors.bg_active}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local mode_color = {n = colors.purple,
      i = colors.green_active,
      v = colors.blue_active,
      [''] = colors.blue_active,
      V = colors.blue_active,
      c = colors.purple,
      no = colors.magenta_active,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow_active,
      R = colors.red_active,
      Rv = colors.red_active,
      cv = colors.red_active,
      ce=colors.red_active,
      r = colors.cyan_active,
      rm = colors.cyan_active,
      ['r?'] = colors.cyan_active,
      ['!']  = colors.red_active,
      t = colors.red_active}
      vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim.fn.mode()])
      return ':::klooj:::'
    end,
    separator = '⎞',
    separator_highlight = {colors.blue_active,colors.bg_active},
    highlight = {colors.fg_active,colors.bg_active,'bold'},
  },
}
gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg_main},
  },
}
gls.left[4] = {
  FileName = {
    provider = {'FileName','FileSize'},
    condition = buffer_not_empty,
    separator = '⎞',
    separator_highlight = {colors.blue_active,colors.bg_active},
    highlight = {colors.fg_active,colors.bg_main,'bold'}
  }
}

gls.left[5] = {
  GitIcon = {
    provider = function() return ' ' end,
    condition = buffer_not_empty,
    highlight = {colors.orange,colors.bg_active},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = buffer_not_empty,
    highlight = {colors.fg_active,colors.bg_active},
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.green_active,colors.bg_active},
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = '  ',
    highlight = {colors.yellow_active,colors.bg_active},
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = '  ',
    highlight = {colors.red_active,colors.bg_active},
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function() return '⎞' end,
    condition = buffer_not_empty,
    highlight = {colors.bg_main, colors.bg_active}
  }
}
gls.right[1] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red_active,colors.bg_main}
  }
}
gls.right[2] = {
  Space = {
    provider = function () return '' end
  }
}
gls.right[3] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow_active,colors.bg_main},
  }
}
gls.right[4] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '   ',
    highlight = {colors.blue_active,colors.bg_active},
  }
}

-- gls.right[1]= {
--   FileFormat = {
--     provider = 'FileFormat',
--     highlight = {colors.fg_active,colors.bg_active},
--   }
-- }
gls.right[5] = {
  LineInfo = {
    provider = function() return vim.fn.line('$') end,
    -- provider = 'LineColumn',
    separator = '⎛',
    separator_highlight = {colors.blue_active,colors.bg_active},
    highlight = {colors.fg_active,colors.bg_active},
  },
}
gls.right[6] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.yellow_active,colors.purple},
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = { 'FileName' },
    highlight = {colors.fg_active,colors.bg_active}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg_active,colors.bg_active}
  }
}
