autocmd Signal SIGUSR1 source $HOME/.config/nvim/core/colortheme.vim

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

autocmd FileType javascript let b:delimitMate_matchpairs = "(:),[:],{:}"

autocmd FileType cpp set makeprg=cd\ build\ &&\ cmake\ -DCMAKE_BUILD_TYPE=debug\ ..\ &&\ cmake\ --build\ .
