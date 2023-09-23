
local utils = require('heirline.utils')
local conds = require('heirline.conditions')

-- utils.get_highlight(hl_name) gets { fg, bg, sp }
local colors = {
    bright_bg = utils.get_highlight("Folded").bg,
    bright_fg = utils.get_highlight("Folded").fg,
    red = utils.get_highlight("DiagnosticError").fg,
    dark_red = utils.get_highlight("DiffDelete").bg,
    green = utils.get_highlight("String").fg,
    blue = utils.get_highlight("Function").fg,
    gray = utils.get_highlight("NonText").fg,
    orange = utils.get_highlight("Constant").fg,
    purple = utils.get_highlight("Statement").fg,
    cyan = utils.get_highlight("Special").fg,
    diag_warn = utils.get_highlight("DiagnosticWarn").fg,
    diag_error = utils.get_highlight("DiagnosticError").fg,
    diag_hint = utils.get_highlight("DiagnosticHint").fg,
    diag_info = utils.get_highlight("DiagnosticInfo").fg,
    git_del = utils.get_highlight("diffDeleted").fg,
    git_add = utils.get_highlight("diffAdded").fg,
    git_change = utils.get_highlight("diffChanged").fg,
    mode_normal = utils.get_highlight("heirlineModeNormal"),
    mode_insert = utils.get_highlight("heirlineModeInsert"),
    mode_replace = utils.get_highlight("heirlineModeReplace"),
    mode_visual = utils.get_highlight("heirlineModeVisual"),
    mode_command = utils.get_highlight("heirlineModeCommand"),
}

local viMode = {
  init = function(self)
    self.mode = vim.fn.mode(1)
  end,
  static = {
    mode_names = {
      n = "NORMAL",
      no = "NORMAL",
      nov = "NORMAL",
      noV = "NORMAL",
      ["no\22"] = "NORMAL",
      niI = "I-NORMAL",
      niR = "R-NORMAL",
      niV = "V-NORMAL",
      nt = "NORMAL",
      ntT = "T-NORMAL",
      v = "VISUAL",
      vs = "S-VISUAL",
      V = "V-LINE",
      Vs = "V-LINE",
      ["\22"] = "V-BLOCK",
      ["\22s"] = "V-BLOCK",
      s = "CHAR-SEL",
      S = "LINE-SEL",
      ["\19s"] = "BLOCK-SEL",
      i = "INSERT",
      ic = "C-INSERT",
      ix = "X-INSERT",
      R = "REPLACE",
      Rc = "C-REPLACE",
      Rx = "X-REPLACE",
      Rv = "V-REPLACE",
      Rvc = "VC-REPALCE",
      Rvx = "VX-REPLACE",
      c = "COMMAND",
      cv = "EXECUTE",
      r = "RET-PROMPT",
      rm = "MORE-PROMPT",
      ["r?"] = "CONF-PROMPT",
      ["!"] = "SHELL",
      t = "TERMINAL"
    },
    mode_colors = {
      n = "mode_normal",
      i = "mode_insert",
      v = "mode_visual",
      V = "mode_visual",
      ["\22"] = "mode_visual",
      c = "mode_command",
      s = "mode_visual",
      S = "mode_visual",
      ["\19"] = "mode_visual",
      R = "mode_replace",
      r = "mode_replace",
      ["!"] = "mode_command",
      t = "mode_command"
    }
  },
  provider = function(self)
    return self.mode_names[self.mode]
  end,
}

local function dividerL()
end

local statusline = {}

require('heirline').setup({
  statusline = statusline,
  opts = {
    colors = colors
  }
})
