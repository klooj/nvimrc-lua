require('nvim-web-devicons').setup {
  default = true
}

local gl         = require('galaxyline')
local fi         = require('galaxyline.provider_fileinfo')
local gls        = gl.section
local background = vim.o.bg
local colors
local dg         = require('galaxyline.provider_diagnostic')

gl.short_line_list = {'NvimTree'}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local icn = {
  sl = {
    r = " ",
    l = " ",
  },
}

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
    bg_main        = '#630419',
    bg_active      = '#280419',
    blue_active    = '#5A9CD6',
    cyan_active    = '#00C0C0',
    darkblue       = '#0817A7',
    fg_active      = '#f5f5f5',
    fg_inactive    = '#bebebe',
    green_active   = '#608B4E',
    magenta_active = '#7d4d7a',
    orange         = '#FF8800',
    purple         = '#7d4d7a',
    red_active     = '#FD4949',
    yellow_active  = '#fabd2f',
  }
  colors = palette
end

local mode_color = {
  n = colors.purple,
  i = colors.green_active,
  v = colors.blue_active,
  V = colors.blue_active,
  [''] = colors.blue_active,
  c  = colors.purple,
  no = colors.magenta_active,
  s  = colors.orange,
  S  = colors.orange,
  [''] = colors.orange,
  ic = colors.yellow_active,
  R  = colors.red_active,
  Rv = colors.red_active,
  cv = colors.red_active,
  ce = colors.red_active,
  r  = colors.cyan_active,
  rm = colors.cyan_active,
  t  = colors.red_active,
  ['r?'] = colors.cyan_active,
  ['!']  = colors.red_active,
}

gls.left[1] = {
  FirstElement = {
    provider = function() return ' ' end,
    highlight = {colors.bg_inactive, colors.bg_inactive}
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      local fname = fi.get_current_file_name()
      local ficn  = fi.get_file_icon()
      vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim.fn.mode()])
      return string.format("%s%s ", ficn, fname)
    end,
    condition = buffer_not_empty,
  },
}

gls.left[3] = {
  FileSep = {
    provider = function() return icn.sl.r end,
    highlight = {colors.purple, colors.blue_active},
    condition = function()
      if dg.get_diagnostic_error() or dg.get_diagnostic_warn() or dg.get_diagnostic_hint() or dg.get_diagnostic_info() then
        return true
      else
        return false
      end
    end
  }
}

gls.left[4] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red_active,colors.blue_active}
  }
}

gls.left[5] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow_active,colors.blue_active},
  }
}

gls.left[6] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '   ',
    highlight = {colors.green_active,colors.blue_active},
    condition = buffer_not_empty,
  }
}

gls.left[7] = {
  DiagSep = {
    provider = function() return icn.sl.r end,
    highlight = {colors.blue_active, colors.bg_active},
    condition = function()
      if dg.get_diagnostic_error() or dg.get_diagnostic_warn() or dg.get_diagnostic_hint() or dg.get_diagnostic_info() then
        return true
      else
        return false
      end
    end
  }
}

gls.left[8] = {
  GitIcon = {
    provider = function() return ' ' end,
    condition = buffer_not_empty,
    highlight = {colors.orange,colors.bg_active},
  }
}

gls.left[9] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = buffer_not_empty,
    highlight = {colors.fg_active,colors.bg_active},
  }
}

gls.left[10] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.cyan_active,colors.bg_active},
  }
}

gls.left[11] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = '  ',
    highlight = {colors.yellow_active,colors.bg_active},
  }
}

gls.left[12] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = '  ',
    highlight = {colors.red_active,colors.bg_active},
  }
}

gls.left[13] = {
  LeftEnd = {
    provider = function() return icn.sl.r end,
    condition = buffer_not_empty,
    highlight = {colors.bg_active, colors.bg_main,}
  }
}

-- RIGHT SIDE

gls.right[1] = {
  LineInfo = {
    provider = function()
      vim.api.nvim_command('hi GalaxyLineInfo guibg='..mode_color[vim.fn.mode()])
      local fsize = fi.get_file_size()
      local lcol = fi.line_column()
      local ltot = vim.fn.line('$')
      return string.format("%s/%s %s", lcol, ltot, fsize)
    end,
    condition = buffer_not_empty,
  },
}
gls.right[2] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.yellow_active,colors.purple},
    condition = buffer_not_empty,
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileName',
    highlight = {colors.fg_active,colors.bg_active}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg_active,colors.bg_active}
  }
}
