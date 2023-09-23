
local utils = require('base16-nvim.utils')
local hi = utils.hi
local cond = utils.cond
local M = {}

function M.setup()
  -- GitGutter highlighting
  hi("GitGutterAdd",     "bB", "b1")
  hi("GitGutterChange",  "bD", "b1")
  hi("GitGutterDelete",  "b8", "b1")
  hi("GitGutterChangeDelete",  "bE", "b1")

  -- pangloss/vim-javascript highlighting
  hi("jsOperator",          "bD", nil)
  hi("jsStatement",         "bE", nil)
  hi("jsReturn",            "bE", nil)
  hi("jsThis",              "b8", nil)
  hi("jsClassDefinition",   "bA", nil)
  hi("jsFunction",          "bE", nil)
  hi("jsFuncName",          "bD", nil)
  hi("jsFuncCall",          "bD", nil)
  hi("jsClassFuncName",     "bD", nil)
  hi("jsClassMethodType",   "bE", nil)
  hi("jsRegexpString",      "bC", nil)
  hi("jsGlobalObjects",     "bA", nil)
  hi("jsGlobalNodeObjects", "bA", nil)
  hi("jsExceptions",        "bA", nil)
  hi("jsBuiltins",          "bA", nil)

  -- Mail highlighting
  hi("mailQuoted1",  "bA", nil)
  hi("mailQuoted2",  "bB", nil)
  hi("mailQuoted3",  "bE", nil)
  hi("mailQuoted4",  "bC", nil)
  hi("mailQuoted5",  "bD", nil)
  hi("mailQuoted6",  "bA", nil)
  hi("mailURL",      "bD", nil)
  hi("mailEmail",    "bD", nil)

  -- NERDTree highlighting
  hi("NERDTreeDirSlash",  "bD", nil)
  hi("NERDTreeExecFile",  "b5", nil)

  -- Signify highlighting
  hi("SignifySignAdd",     "bB", "b1")
  hi("SignifySignChange",  "bD", "b1")
  hi("SignifySignDelete",  "b8", "b1")

  -- Startify highlighting
  hi("StartifyBracket",  "b3", nil)
  hi("StartifyFile",     "b7", nil)
  hi("StartifyFooter",   "b3", nil)
  hi("StartifyHeader",   "bB", nil)
  hi("StartifyNumber",   "b9", nil)
  hi("StartifyPath",     "b3", nil)
  hi("StartifySection",  "bE", nil)
  hi("StartifySelect",   "bC", nil)
  hi("StartifySlash",    "b3", nil)
  hi("StartifySpecial",  "b3", nil)

  -- Floating Window highlighting
  hi("FloatBorder", "b5", "b1" )

  -- cxx Lsp highlighting
  hi("LspCxxHlGroupNamespace", "b8", nil)

  -- GitGutters
  hi("SignColumn", "b5", "b0")
  hi("GitSignsAdd", "bB", "b0")
  hi("GitSignsDelete", "b8", "b0")
  hi("GitSignsChange", "bE", "b0")
  hi("GitSignsChangedelete", "bE", "b0")

  -- barbar Tabline Highlighting
  hi("BufferCurrent",       "b5", "b0", { "bold" })
  hi("BufferCurrentSign",   "b5", "b0")
  hi("BufferCurrentMod",    "b8", "b0", { "bold" })

  hi("BufferVisible",       "b5", "b1")
  hi("BufferVisibleSign",   "b5", "b1")
  hi("BufferVisibleMod",    "b8", "b0")

  hi("BufferInactive",      "b3", "b1", { "italic" })
  hi("BufferInactiveSign",  "b3", "b1")
  hi("BufferInactiveMod",   "b8", "b1", { "italic" })

  -- neo-tree Highlighting
  hi("NeoTreeCursorLine", nil, "b0", { "default", "italic" })

  -- heirline StatusLine Highlighting
  hi("heirlineModeNormal", "b0", "b7")
  hi("heirlineModeInsert", "b0", "bD")
  hi("heirlineModeReplace", "b0", "b8")
  hi("heirlineModeCommand", "b0", "bB")
  hi("heirlineModeVisual", "b0", "bA")
end

return M