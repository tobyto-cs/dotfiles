" General options
set termguicolors

set timeoutlen=500
set updatetime=500

set clipboard+=unnamedplus

set noswapfile

" Ignore certain files and folders when globing
set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.pyc,*.pkl
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase  " ignore file and dir name cases in cmd-completion

" Backup Stuff
let g:backupdir=expand(stdpath('data') . '/backup//')
let &backupdir=g:backupdir

let &backupskip=&wildignore
set backup
set backupcopy=yes " copy original file to backupdir and overwrite it

" Tab stuff
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

set ignorecase smartcase

set linebreak

" List all matched and complete till longest common string
set wildmode=list:longest

" Min lines to keep above and below cursor
set scrolloff=4

set number relativenumber

set mousemodel=popup

set noshowmode " for when I have a statusline plugin

" ask for confirmation when handling unsaved/readonly files
set confirm

set visualbell noerrorbells
set history=500

" Use list mode and customized listchars
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣

set autowrite

set undofile

" Don't show auto-completion messages
set shortmess+=c

" Do not show search match count on bottom right (seriously, I would strain my
" neck looking at it). Using plugins like vim-anzu or nvim-hlslens is a better
" choice, IMHO.
set shortmess+=S

" Completion stuff
set completeopt+=menuone
set completeopt-=preview

set pumheight=10

" pseudo transparency
set pumblend=10
set winblend=5

set shiftround

set virtualedit=block

set tildeop

set synmaxcol=200
set nostartofline


set signcolumn=auto:2

set nowrap

set undolevels=1001

lua vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
set sessionoptions+=winpos,terminal,folds,globals

" Seperators for splits
set fillchars+=horiz:━,horizup:┻,horizdown:┳
set fillchars+=vert:┃,vertleft:┫,vertright:┣,verthoriz:╋
