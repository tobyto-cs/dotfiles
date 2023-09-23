let s:core_conf_files = ['options.vim', 'colortheme.vim', 'autocmds.vim']

let g:mapleader = ','

for s:fname in s:core_conf_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor

lua require('keymaps.general')
lua require('plugins')
