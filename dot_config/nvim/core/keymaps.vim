lua require('keymaps')


" Save key strokes (now we do not need to press shift to enter command mode).
" Vim-sneak has also mapped `;`, so using the below mapping will break the map
" used by vim-sneak
nnoremap ; :
xnoremap ; :

" Quicker way to open command window
nnoremap q; q:

" Turn the word under cursor to upper case
inoremap <c-u> <Esc>viwUea

" Turn the current word into title case
inoremap <c-t> <Esc>b~lea


" Shortcut for faster save and quit
nnoremap <silent> <leader>w :<C-U>update<CR>
" Saves the file if modified and quit
nnoremap <silent> <leader>q :<C-U>x<CR>
" Quit all opened buffers
nnoremap <silent> <leader>Q :<C-U>qa!<CR>

" Navigation in the location and quickfix list
nnoremap <silent> [l :<C-U>lprevious<CR>zv
nnoremap <silent> ]l :<C-U>lnext<CR>zv
nnoremap <silent> [L :<C-U>lfirst<CR>zv
nnoremap <silent> ]L :<C-U>llast<CR>zv
nnoremap <silent> [q :<C-U>cprevious<CR>zv
nnoremap <silent> ]q :<C-U>cnext<CR>zv
nnoremap <silent> [Q :<C-U>cfirst<CR>zv
nnoremap <silent> ]Q :<C-U>clast<CR>zv

" Close location list or quickfix list if they are present,
" see https://superuser.com/q/355325/736190
nnoremap<silent> \x :<C-U>windo lclose <bar> cclose<CR>

" Close a buffer and switching to another buffer, do not close the
" window, see https://stackoverflow.com/q/4465095/6064933
nnoremap <silent> \d :<C-U>bprevious <bar> bdelete #<CR>

" Insert a blank line below or above current line (do not move the cursor),
" see https://stackoverflow.com/a/16136133/6064933
nnoremap <expr> <Space>o printf('m`%so<ESC>``', v:count1)
nnoremap <expr> <Space>O printf('m`%sO<ESC>``', v:count1)

" Move the cursor based on physical lines, not the actual lines.
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap ^ g^
nnoremap 0 g0

" Do not include white space characters when using $ in visual mode,
" see https://vi.stackexchange.com/q/12607/15292
xnoremap $ g_

" Jump to matching pairs easily in normal mode
nnoremap <Tab> %

" Go to start or end of line easier
nnoremap H ^
xnoremap H ^
nnoremap L g_
xnoremap L g_

" Continuous visual shifting (does not exit Visual mode), `gv` means
" to reselect previous visual area, see https://superuser.com/q/310417/736190
xnoremap < <gv
xnoremap > >gv

" Tab-complete, see https://vi.stackexchange.com/q/19675/15292.
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Reselect the text that has just been pasted, see also https://stackoverflow.com/a/4317090/6064933.
nnoremap <expr> <leader>v printf('`[%s`]', getregtype()[0])

" Always use very magic mode for searching
nnoremap / /\v

" Search in selected region
xnoremap / :<C-U>call feedkeys('/\%>'.(line("'<")-1).'l\%<'.(line("'>")+1)."l")<CR>

" Find and replace (like Sublime Text 3)
nnoremap <C-H> :%s/
xnoremap <C-H> :s/

" Change current working directory locally and print cwd after that,
" see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
nnoremap <silent> <leader>cd :<C-U>lcd %:p:h<CR>:pwd<CR>

" Use Esc to quit builtin terminal
tnoremap <ESC>   <C-\><C-n>

" Toggle spell checking (autosave does not play well with z=, so we disable it
" when we are doing spell checking)
nnoremap <silent> <F11> :<C-U>set spell!<cr>
inoremap <silent> <F11> <C-O>:<C-U>set spell!<cr>

" Change text without putting it into the vim register,
" see https://stackoverflow.com/q/54255/6064933
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
xnoremap c "_c

" Remove trailing whitespace characters
nnoremap <silent> <leader><Space> :<C-U>StripTrailingWhitespace<CR>

" Clear highlighting
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :<C-U>nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Copy entire buffer.
nnoremap <silent> <leader>y :<C-U>%y<CR>

" Replace visual selection with text in register, but not contaminate the
" register, see also https://stackoverflow.com/q/10723700/6064933.
xnoremap p "_c<ESC>p

nnoremap <Left> <C-W>h
nnoremap <Right> <C-W>l
nnoremap <Up> <C-W>k
nnoremap <Down> <C-W>j

" Do not move my cursor when joining lines.
nnoremap J mzJ`z

" Break inserted text into smaller undo units.
for ch in [',', '.', '!', '?', ';', ':']
  execute printf('inoremap %s %s<C-g>u', ch, ch)
endfor

" insert semicolon in the end
inoremap <A-;> <ESC>miA;<ESC>`ii

" Keep cursor position after yanking
" nnoremap y myy
" xnoremap y myy

" augroup restore_after_yank
"   autocmd!
"   autocmd TextYankPost *  call s:restore_cursor()
" augroup END

" Tab keybinds, see tabline.lua config for extras
nnoremap <leader>tn <Cmd>:tabnext<Cr>
nnoremap <leader>tp <Cmd>:tabprevious<Cr>
nnoremap <leader>tt <Cmd>:tabnew<Cr>
nnoremap <space><up> <Cmd>:tabnext<Cr>
nnoremap <space><down> <Cmd>:tabnext<Cr>

" Buffer / Window mappings
nnoremap <space>w <C-w>
nnoremap <leader>bd <Cmd>:bdelete<Cr>

"" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"" Easy Align mappings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
