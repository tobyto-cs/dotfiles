if vim.fn.filereadable(vim.fn.expand("~/.conig/nvim/theme/base16.vim")) then
  vim.opt.background="dark"
  vim.opt.termguicolors=true
  vim.g.base12colorspace=256
  vim.cmd('source ~/.config/nvim/theme/base16.vim')
end


require("base16-colorscheme").setup({
	-- cbase16::start
    base00 = '#1e1e1e', base01 = '#323537', base02 = '#464b50', base03 = '#5f5a60',
    base04 = '#838184', base05 = '#a7a7a7', base06 = '#c3c3c3', base07 = '#ffffff',
    base08 = '#cf6a4c', base09 = '#cda869', base0A = '#f9ee98', base0B = '#8f9d6a',
    base0C = '#afc4db', base0D = '#7587a6', base0E = '#9b859d', base0F = '#9b703f',
	-- cbase16::end
})
