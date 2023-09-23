
local M = {}

local function cond(str, opts)
  local bool = false

  if str == "bold" then bool = opts.useBold
  elseif str == "underline" then bool = opts.useUnderline
  elseif str == "undercurl" then bool = opts.useUndercurl
  elseif str == "underdouble" then bool = opts.useUnderdouble
  elseif str == "underdotted" then bool = opts.useUnderdotted
  elseif str == "underdashed" then bool = opts.useUnderdashed
  elseif str == "strikethrough" then bool = opts.useStrikethrough
  elseif str == "reverse" then bool = opts.useReverse
  elseif str == "italic" then bool = opts.useItalic
  elseif str == "standout" then bool = opts.useStandout
  elseif str == "Altfont" then bool = opts.useAltfont end

  if bool then return str else return nil end
end

function M.link(group, link)
  local attribs = { link = link }
  vim.api.nvim_set_hl(0, group, attribs)
end

function M.hi(group, fg, bg, attr, sp)
  -- Used to "update" instead of "replace" 
  -- local attribs = vim.api.nvim_get_hl(0, { name = group })
  local attribs = {}
  local c = vim.g.base16_color_table

  if fg then
    attribs["fg"] = c.gc[fg]
    attribs["ctermfg"] = c.tc[fg]
  end
  if bg then
    attribs["bg"] = c.gc[bg]
    attribs["ctermbg"] = c.tc[bg]
  end
  -- attr is assumed to be a list
  if attr then
    for i, v in ipairs(attr) do
      if v and cond(v, c.opts) then
        attribs[v] = true
      end
    end
  end
  if sp then attribs["sp"] = c.gc[fg] end
  vim.api.nvim_set_hl(0, group, attribs)
end


return M
