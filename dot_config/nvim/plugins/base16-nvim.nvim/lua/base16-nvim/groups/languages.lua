
local utils = require('base16-nvim.utils')
local hi = utils.hi
local cond = utils.cond
local M = {}

function M.setup()
  -- C highlighting
  hi("cOperator",   "bC", nil)
  hi("cPreCondit",  "bE", nil)

  -- C# highlighting
  hi("csClass",                 "bA", nil)
  hi("csAttribute",             "bA", nil)
  hi("csModifier",              "bE", nil)
  hi("csType",                  "b8", nil)
  hi("csUnspecifiedStatement",  "bD", nil)
  hi("csContextualStatement",   "bE", nil)
  hi("csNewDecleration",        "b8", nil)

  -- CSS highlighting
  hi("cssBraces",      "b5", nil)
  hi("cssClassName",   "bE", nil)
  hi("cssColor",       "bC", nil)

  -- Diff highlighting
  hi("DiffAdd",      "bB", "b1")
  hi("DiffChange",   "b3", "b1")
  hi("DiffDelete",   "b8", "b1")
  hi("DiffText",     "bD", "b1")
  hi("DiffAdded",    "bB", "b0")
  hi("DiffFile",     "b8", "b0")
  hi("DiffNewFile",  "bB", "b0")
  hi("DiffLine",     "bD", "b0")
  hi("DiffRemoved",  "b8", "b0")

  -- Git highlighting
  hi("gitcommitOverflow",       "b8", nil)
  hi("gitcommitSummary",        "bB", nil)
  hi("gitcommitComment",        "b3", nil)
  hi("gitcommitUntracked",      "b3", nil)
  hi("gitcommitDiscarded",      "b3", nil)
  hi("gitcommitSelected",       "b3", nil)
  hi("gitcommitHeader",         "bE", nil)
  hi("gitcommitSelectedType",   "bD", nil)
  hi("gitcommitUnmergedType",   "bD", nil)
  hi("gitcommitDiscardedType",  "bD", nil)
  hi("gitcommitBranch",         "b9", nil, { "bold" })
  hi("gitcommitUntrackedFile",  "bA", nil)
  hi("gitcommitUnmergedFile",   "b8", nil, { "bold" })
  hi("gitcommitDiscardedFile",  "b8", nil, { "bold" })
  hi("gitcommitSelectedFile",   "bB", nil, { "bold" })

  -- HTML highlighting
  hi("htmlBold",    "bA", nil)
  hi("htmlItalic",  "bE", nil)
  hi("htmlEndTag",  "b5", nil)
  hi("htmlTag",     "b5", nil)

  -- JavaScript highlighting
  hi("javaScript",        "b5", nil)
  hi("javaScriptBraces",  "b5", nil)
  hi("javaScriptNumber",  "b9", nil)

  -- Java highlighting
  hi("javaOperator",     "bD", nil)

  -- Markdown highlighting
  hi("markdownCode",              "bB", nil)
  hi("markdownError",             "b5", "b0")
  hi("markdownCodeBlock",         "bB", nil)
  hi("markdownHeadingDelimiter",  "bD", nil)

  -- PHP highlighting
  hi("phpMemberSelector",  "b5", nil)
  hi("phpComparison",      "b5", nil)
  hi("phpParent",          "b5", nil)
  hi("phpMethodsVar",      "bC", nil)

  -- Python highlighting
  hi("pythonOperator",  "bE", nil)
  hi("pythonRepeat",    "bE", nil)
  hi("pythonInclude",   "bE", nil)
  hi("pythonStatement", "bE", nil)

  -- Ruby highlighting
  hi("rubyAttribute",               "bD", nil)
  hi("rubyConstant",                "bA", nil)
  hi("rubyInterpolationDelimiter",  "bF", nil)
  hi("rubyRegexp",                  "bC", nil)
  hi("rubySymbol",                  "bB", nil)
  hi("rubyStringDelimiter",         "bB", nil)

  -- SASS highlighting
  hi("sassidChar",     "b8", nil)
  hi("sassClassChar",  "b9", nil)
  hi("sassInclude",    "bE", nil)
  hi("sassMixing",     "bE", nil)
  hi("sassMixinName",  "bD", nil)
end

return M
