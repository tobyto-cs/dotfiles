
local utils = require('heirline.utils')
local conditions = require('heirline.conditions')
local hydra_sl = require('hydra.statusline')

-- utils.get_highlight(hl_name) gets { fg, bg, sp }
local function setup_colors()
    return {
      bright_bg = utils.get_highlight("Folded").bg,
      bright_fg = utils.get_highlight("Folded").fg,
      normal_bg = utils.get_highlight("Normal").bg,
      normal_fg = utils.get_highlight("Normal").fg,
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
      mode_normal = utils.get_highlight("heirlineModeNormal").bg,
      mode_insert = utils.get_highlight("heirlineModeInsert").bg,
      mode_replace = utils.get_highlight("heirlineModeReplace").bg,
      mode_visual = utils.get_highlight("heirlineModeVisual").bg,
      mode_command = utils.get_highlight("heirlineModeCommand").bg,
    }
end

vim.api.nvim_create_augroup("Heirline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    utils.on_colorscheme(setup_colors)
  end,
  group = "Heirline"
})


local ViMode = {
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
  },

  -- Returns formatted statusline component
  provider = function(self)
    if hydra_sl.is_active() then
      return string.format("%s", hydra_sl.get_name())
    end
    return string.format("%s", self.mode_names[vim.fn.mode()])
  end,

  -- Will only update on "ModeChanged"
  -- update = {
  --   "ModeChanged",
  --   callback = vim.schedule_wrap(function()
  --     vim.cmd("redrawstatus")
  --   end),
  -- }
}

local Ruler = {
  provider = "%l:%c %P"
}

local ScrollBar = {
  static = {
    sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
  },
  provider = function(self)
    local cur_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = math.floor((cur_line - 1) / lines * #self.sbar) + 1
    return string.rep(self.sbar[i], 2);
  end
}

local NeoTree = {
  condition = function() 
    return vim.bo.filetype == "neo-tree"
  end
}

local LSPActive = {
  conditions = conditions.lsp_attached(),
  update = { "LspAttach", "LspDetach", "BufEnter" },
  provider = function()
    local names = {}
    for i, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      table.insert(names, server.name)
    end
    return string.format(" [%s]", table.concat(names, " "))
  end
}

local Diagnostics = {

  condition = conditions.has_diagnostics,

  static = {
    error_icon = "",
    warn_icon = "",
    info_icon = "",
    hint_icon = "󰌶"
  },

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,

  update = { "DiagnosticChanged", "BufEnter" },

  {
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and (self.error_icon .. self.errors .. " ")
    end,
    hl = { fg = "diag_error" },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
    end,
    hl = { fg = "diag_warn" },
  },
  {
    provider = function(self)
      return self.info > 0 and (self.info_icon .. self.info .. " ")
    end,
    hl = { fg = "diag_info" },
  },
  {
    provider = function(self)
      return self.hints > 0 and (self.hint_icon .. self.hints)
    end,
    hl = { fg = "diag_hint" },
  },
}

local GitBranchName = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
  end,

  provider = function(self)
    return " " .. self.status_dict.head
  end,
  hl = { bold = true }
}

local DAPStatus = {
  provider = function()
    return " " .. require("dap").status() .. " "
  end,
  on_click = {
    callback = function()
      local session = require("dap").session()
      if session ~= nil then
        require("dap").terminate()
      end
      require("dapui").toggle()
    end,
    name = "toggle_dap"
  }
}

local VistaTag = {
  provider = function(self)
    local tag = vim.b.vista_nearest_method_or_function
    if tag == nil or tag == "" then
      return string.format(" [%s]", vim.fn.expand('%:t'))
    end
    return string.format("󰊕 [%s]", tag)
  end,
}

local Align = { provider = "%=" }
local Space = { provider = " " }

local LuaLineEmulation = {
  -- Left Side
  {
    -- Using mode colors
    {
      Space, ViMode, Space,
      hl = function(self)
        return {
          fg = "normal_bg",
          bg = self:mode_color(),
          bold = true, force = true
        }
      end
    },
    -- Seperator
    {
      provider = "",
      hl = function(self)
        return {
          fg = self:mode_color(),
          bg = (conditions.is_git_repo() and "bright_bg" or "normal_bg")
        }
      end
    },

    -- Uses "light" background
    {
      condition = conditions.is_git_repo,
      Space, GitBranchName, Space,
      hl = { fg = "normal_fg", bg = "bright_bg" }
    },

    {
      condition = conditions.is_git_repo,
      provider = "",
      hl = { fg = "bright_bg", bg = "normal_bg" }
    },
    -- Uses "dark" background (same as buf bg)
    {
      Space, VistaTag,
      hl = { fg = "normal_fg", bg = "normal_bg" }
    }
  },
  Align,
  -- Right Side
  {
    -- Uses "dark" background (same as buf bg)
    {
      LSPActive, Space, Diagnostics, Space,
      hl = { fg = "normal_fg" }
    },

    {
      provider = "",
      hl = { fg = "bright_bg", bg = "normal_bg" }
    },
    -- Uses "light" background
    {
      Space, DAPStatus, Space,
      hl = { fg = "normal_fg", bg = "bright_bg" }
    },

    {
      provider = "",
      hl = function(self)
        return {
          fg = self:mode_color(),
          bg = "bright_bg"
        }
      end
    },

    -- Using mode colors
    {
      Space, Ruler, Space, ScrollBar, Space,
      hl = function(self)
        return { fg = "normal_bg", bg = self:mode_color(), bold = true, force = true }
      end,
    },
  }
}

local StatusLines = {
  static = {
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
      t = "mode_command",
    },
    mode_color = function(self)
      if hydra_sl.is_active() then
        return hydra_sl.get_color()
      end
      return self.mode_colors[vim.fn.mode()]
    end,
  },
  LuaLineEmulation
}


require('heirline').setup({
  statusline = StatusLines,
  opts = {
    colors = setup_colors()
  }
})
