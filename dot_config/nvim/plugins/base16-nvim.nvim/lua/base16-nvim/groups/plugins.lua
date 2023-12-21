
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
  hi("BufferCurrentIcon",   nil,  "b0")
  hi("BufferCurrentMod",    "b8", "b0", { "bold" })

  hi("BufferVisible",       "b5", "b0")
  hi("BufferVisibleSign",   "b5", "b0")
  hi("BufferVisibleMod",    "b8", "b0")
  hi("BufferVisibleIcon",   nil,  "b0")
  hi("BufferVisibleSign",   nil,  "b0")

  hi("BufferInactive",      "b3", "b1", { "italic" })
  hi("BufferInactiveSign",  "b3", "b1")
  hi("BufferInactiveMod",   "b8", "b1", { "italic" })

  -- neo-tree Highlighting
  hi("NeoTreeCursorLine", nil, "b0", { "default", "italic" })
  hi("NeoTreeGitModified", nil, "b0")
  hi("NeoTreeGitRenamed", nil, "b0")
  hi("NeoTreeGitDeleted", nil, "b0")
  hi("NeoTreeGitStaged", nil, "b0")
  hi("NeoTreeGitAdded", nil, "b0")

  -- heirline StatusLine Highlighting
  hi("heirlineModeNormal", "b0", "b7")
  hi("heirlineModeInsert", "b0", "bD")
  hi("heirlineModeReplace", "b0", "b8")
  hi("heirlineModeCommand", "b0", "bB")
  hi("heirlineModeVisual", "b0", "bA")

  -- dap
  hi("DapSign", "b8", nil)
  -- dap-ui
  hi("DapUIStop", "b8", nil)
  hi("DapUIStopNC", "b8", nil)
  hi("DapUIWatchesError", "b8", nil)
  hi("DapUIWatchesEmpty", "b8", nil)
  hi("DapUIBreakpointsCurrentLine", "bB", nil, { "bold" })
  hi("DapUICurrentFrameName", "bB", nil, { "bold" })
  hi("DapUIBreakpointsInfo", "bB", nil)
  hi("DapUIWatchesValue", "bB", nil)
  hi("DapUIPlayPauseNC", "bB", nil)
  hi("DapUIPlayPause", "bB", nil)
  hi("DapUIRestartNC", "bB", nil)
  hi("DapUIRestart", "bB", nil)
  hi("DapUIThread", "bB", nil)
  hi("DapUIBreakpointsPath", "bC", nil)
  hi("DapUIBreakpointsLine", "bC", nil)
  hi("DapUIStoppedThread", "bC", nil)
  hi("DapUIModifiedValue", "bC", nil, { "bold" })
  hi("DapUIFloatBorder", "bC", nil)
  hi("DapUIStepOverNC", "bC", nil)
  hi("DapUIStepOver", "bC", nil)
  hi("DapUIStepIntoNC", "bC", nil)
  hi("DapUIStepInto", "bC", nil)
  hi("DapUIStepBackNC", "bC", nil)
  hi("DapUIStepBack", "bC", nil)
  hi("DapUIStepOutNC", "bC", nil)
  hi("DapUIStepOut", "bC", nil)
  hi("DapUILineNumber", "bC", nil)
  hi("DapUIDecoration", "bC", nil)
  hi("DapUIWinSelect", "bC", nil, { "bold" })
  hi("DapUIScope", "bC", nil)
  hi("DapUISource", "bE", nil)
  hi("DapUIType", "bE", nil)



  -- hydra Highlighting
  hi("HydraRed", "b8", nil)
  hi("HydraBlue", "bC", nil)
  hi("HydraAmaranth", "b9", nil)
  hi("HydraTeal", "bD", nil)
  hi("HydraPink", "bE", nil)

end

return M
