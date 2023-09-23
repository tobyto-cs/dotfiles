-- delimitMate config
vim.g.delimitMate_expand_cr = 2
-- au FileType c,cpp,h,hpp let b:delimitMate_matchpairs = "(:),[:],{:}"
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp" },
  callback = function ()
    vim.b.delimitMate_matchpairs = "(:),[:],{:}"
  end
})
