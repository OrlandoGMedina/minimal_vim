set encoding=utf-8
scriptencoding utf-8

"{ vim-plug plugins
" Activate vim-plug plugin

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'vimwiki/vimwiki'
" Plug 'tbabej/taskwiki'

" Markdown editing
" When we are editing Markdown files, it is nice to have some code snippets
" to improve efficiency. Fortunately, UltiSnips combined with vim-snippets
" provides a lot of useful snippets for Markdown files.
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Distraction-free writing
" When we are writing Markdown files, we may wish to focus on the task and
" temporarily disable the distraction elements in Neovim.
" The plugin goyo is designed specifically for this purpose.
Plug 'junegunn/goyo.vim'
" After installing this plugin, we can use Goyo command to toggle between
" the normal mode and distraction-free mode.

" I suggest installing limelight, which will dim all lines except
" the current line when turned on.
Plug 'junegunn/limelight.vim'
" Markdown syntax highlighting
" Code highlighting is also important, which helps us to see the structure
" of the source code more clearly. The first plugin we should install
" is vim-markdown.
"
" tabular plugin is used to format tables
Plug 'godlygeek/tabular'
" JSON front matter highlight plugin
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
" Another good Markdown syntax plugin I recommend is vim-pandoc-syntax.
" It provides more syntax highlight and better conceal features.
Plug 'vim-pandoc/vim-pandoc-syntax'
" Markdown previewing
" There are several Markdown previewer for Neovim on GitHub. I have tried
" previm and markdown-preview.nvim, both of which have cross-platform
" support for Nvim (Windows, Linux and macOS are supported). After some
" trail, I think markdown-preview is superior in terms of speed,
" functionality provided and rendering result.
"
" if you don't have node and yarn, use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
"
" Plug 'tomasr/molokai'
" from Luke
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'jreybert/vimagit'
Plug 'lukesmithxyz/vimling'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
call plug#end()

if has("autocmd")
  filetype plugin indent on
endif
"}

"{ Builtin optional plugins
" Activate matchit plugin
runtime! macros/matchit.vim

" Activate man page plugin
runtime! ftplugin/man.vim
"}

"{ Builtin options and settings
set nocompatible
set smarttab
set cindent

syntax on
" colorscheme molokai

hi Normal guibg=NONE ctermbg=NONE
set termguicolors

if !has('nvim')
    " Change cursor shapes based on whether we are in insert mode,
    " see https://vi.stackexchange.com/questions/9131/i-cant-switch-to-cursor-in-insert-mode
    let &t_SI = "\<esc>[6 q"
    let &t_EI = "\<esc>[2 q"
    if exists('&t_SR')
        let &t_SR = "\<esc>[4 q"
    endif

    " The number of color to use
    set t_Co=256
endif

filetype plugin indent on
syntax enable

set go=a
set mouse=a
set nohlsearch

" Set height of status line
set laststatus=2

" Changing fillchars for folding, so there is no garbage charactes
set fillchars=fold:\ ,vert:\|

" Paste mode toggle, it seems that Neovim's bracketed paste mode
" does not work very well for nvim-qt, so we use good-old paste mode
set pastetoggle=<F12>

" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

" Time in milliseconds to wait for a mapped sequence to complete,
" see https://unix.stackexchange.com/q/36882/221410 for more info
set timeoutlen=500

" For CursorHold events
set updatetime=800

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://stackoverflow.com/q/30691466/6064933
set clipboard+=unnamed
set clipboard+=unnamedplus

" Disable creating swapfiles, see https://stackoverflow.com/q/821902/6064933
set noswapfile

" General tab settings
set tabstop=4       " number of visual spaces per TAB
" set tabstop=2
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
" set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab       " expand tab to spaces so that tabs are spaces

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」

" Show line number and relative line number
set number relativenumber

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" File and script encoding settings for vim
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Break line at predefined characters
set linebreak
" Character to show before the lines that have been soft-wrapped
set showbreak=↪

" List all items and start selecting matches in cmd completion
" set wildmode=list:full
" Enable autocompletion:
set wildmode=longest,list,full

" Show current line where the cursor is
set cursorline

" Set a ruler at column 80, see https://stackoverflow.com/q/2447109/6064933
" set colorcolumn=80

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3

" Use mouse to select and resize windows, etc.
if has('mouse')
    set mouse=nv  " Enable mouse in several mode
    set mousemodel=popup  " Set the behaviour of mouse
endif

" Do not show mode on command line since vim-airline can show it
set noshowmode

" Fileformats to use for new files
set fileformats=unix,dos

" The mode in which cursorline text can be concealed
set concealcursor=nc

" The way to show the result of substitution in real time for preview
if exists('&inccommand')
    set inccommand=nosplit
endif

" Ignore certain files and folders when globbing
set wildignore+=*.o,*.obj,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.pyc
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf

" Ask for confirmation when handling unsaved or read-only files
set confirm

" Do not use visual and error bells
set novisualbell noerrorbells

" The level we start to fold
set foldlevel=0

" The number of command and search history to keep
set history=500

" Use list mode and customized listchars
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:+

" Auto-write the file based on some condition
set autowrite

" Show hostname, full path of file and last-mod time on the window title. The
" meaning of the format str for strftime can be found in
" http://man7.org/linux/man-pages/man3/strftime.3.html. The function to get
" lastmod time is drawn from https://stackoverflow.com/q/8426736/6064933
set title
set titlestring=
set titlestring+=%(%{hostname()}\ \ %)
set titlestring+=%(%{expand('%:p')}\ \ %)
set titlestring+=%{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}

" Persistent undo even after you close a file and re-open it.
" For vim, we need to set up an undodir so that $HOME is not cluttered with
" undo files.
if !has('nvim')
    if !isdirectory($HOME . '/.local/vim/undo')
        call mkdir($HOME . '/.local/vim/undo', 'p', 0700)
    endif
    set undodir=~/.local/vim/undo
endif
set undofile

" Completion behaviour
set completeopt+=menuone  " Show menu even if there is only one item
set completeopt-=preview  " Disable the preview window

" Settings for popup menu
set pumheight=15  " Maximum number of items to show in popup menu
if exists('&pumblend')
    set pumblend=5  " Pesudo blend effect for popup menu
endif

" Scan files given by `dictionary` option
set complete+=k,kspell complete-=w complete-=b complete-=u complete-=t

set spelllang=en,cjk  " Spell languages

" Align indent to next multiple value of shiftwidth. For its meaning,
" see http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
set shiftround

" Virtual edit is useful for visual block edit
set virtualedit=block

" Correctly break multi-byte characters such as CJK,
" see https://stackoverflow.com/q/32669814/6064933
set formatoptions+=mM

" Tilde (~) is an operator, thus must be followed by motions like `e` or `w`.
set tildeop

" Do not add two spaces after a period when joining lines or formatting texts,
" see https://stackoverflow.com/q/4760428/6064933
set nojoinspaces

" Text after this column is not highlighted
set synmaxcol=500

" Increment search
set incsearch

set wildmenu

" Do not use corsorcolumn
set nocursorcolumn

set backspace=indent,eol,start  " Use backsapce to delete
"}

"{ Functions
" Remove trailing white space, see https://vi.stackexchange.com/a/456/15292
function! StripTrailingWhitespaces() abort
    let l:save = winsaveview()
    keeppatterns %s/\v\s+$//e
    call winrestview(l:save)
endfunction

" Custom fold expr, adapted from https://vi.stackexchange.com/a/9094/15292
function! VimFolds(lnum)
    " get content of current line and the line below
    let l:cur_line = getline(a:lnum)
    let l:next_line = getline(a:lnum+1)

    if l:cur_line =~# '^"{'
        return '>' . (matchend(l:cur_line, '"{*') - 1)
    else
        if l:cur_line ==# '' && (matchend(l:next_line, '"{*') - 1) == 1
            return 0
        else
            return '='
        endif
    endif
endfunction

" Custom fold text, adapted from https://vi.stackexchange.com/a/3818/15292
" and https://vi.stackexchange.com/a/6608/15292
function! MyFoldText()
    let line = getline(v:foldstart)
    let folded_line_num = v:foldend - v:foldstart
    let line_text = substitute(line, '^"{\+', '', 'g')
    let fillcharcount = &textwidth - len(line_text) - len(folded_line_num) - 10
    return '+'. repeat('-', 4) . line_text . repeat('.', fillcharcount) . ' ('. folded_line_num . ' L)'
endfunction

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>


"}

"{ Variables
let mapleader = ','

" Do not load netrw by default since I do not use it, see
" https://github.com/bling/dotvim/issues/4
let g:loaded_netrwPlugin = 1

" Do not load tohtml.vim
let g:loaded_2html_plugin = 1
"}

"{ Variables Plugins

" VimWiki
" vimwiki normal behavior
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_diary_index': 1}]

" vimwiki config markdown
let g:vimwiki_list = [{'path':'~/Documents/vimwikiMD', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Makes vimwiki markdown links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1

let g:taskwiki_markup_syntax = 'markdown'
let g:markdown_folding = 1

" Ensure files are read as what I want:
map <leader>v :VimwikiIndex
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

"
" Nerd tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
if has('nvim')
    let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
else
    let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
endif
"
" vimling:
nm <leader><leader>d :call ToggleDeadKeys()<CR>
imap <leader><leader>d <esc>:call ToggleDeadKeys()<CR>a
nm <leader><leader>i :call ToggleIPA()<CR>
imap <leader><leader>i <esc>:call ToggleIPA()<CR>a
nm <leader><leader>q :call ToggleProse()<CR>

" Open my bibliography file in split
map <leader>b :vsp<space>$BIB<CR>
map <leader>r :vsp<space>$REFER<CR>

" Goyo
" Enable Goyo by default for mutt writing
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" After install, we can use Limelight to activate it. To deactivate,
" use Limelight!.
" We can also integrate goyo and limelight together with the following setting:
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" when you turn on/off goyo, limelight will also be turn on/off.

" UltiSnips
" We need to set up UltiSnips to use it. The following is an example setting:
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" In the above setting, we use Tab to trigger snippet expansion, which means
" that after entering the snippet keyword for a particular snippet, using
" <Tab> will expand the keyword to the full snippet template. If you have
" used Tab for other mappings, you can set other snippet trigger,
" e.g., Ctrl + J:
let g:UltiSnipsExpandTrigger="<C-J>"

" For example, if we type link and then press <Tab>, it will be expanded
" to the following text:
"
" [Text](http://www.url.com)
"
" Your cursor will be placed at Text, with Text being in selection mode
" and waiting for you to enter the real link text. The setting
" UltiSnipsJumpForwardTrigger and UltiSnipsJumpBackTrigger set up the
" shortcut key to go to next and previous text area of a snippet, making
" the snippet editing more convenient. Take the above inline link snippet
" for an example. Suppose we want to add an inline link to Neovim official
" website (the address is https://neovim.io/), we can follow the steps below:

" 1-Enter link and press <Tab> to get the link template.
" 2-Start typing Neovim and Text will be replaced by Neovim.
" 3-Press <Ctrl-F>. www.url.com will be selected.
" 4-Start typing https://neovim.io/.
"
" Vim-markdown provides a lot of functionalities such as folding,
" conceal etc. Here, we mainly use its syntax highlighting feature.
" Below are some settings for vim-markdown:

" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" his plugin also provides a few shortcuts and commands:
"
" Shortcut:
" ]]: go to next header
" [[: go to previous header
" Command:
" Toc: create a vertical window of table of contents
" TableFormat: format the table under current cursor
" For more settings about these plugins, please consult their documentations.
" Here is my setting for this plugin:
" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0
"}

"{ Auto commands
" Do not use smart case in command line mode,
" extracted from https://vi.stackexchange.com/q/16509/15292
if exists('##CmdLineEnter')
    augroup dynamic_smartcase
        autocmd!
        autocmd CmdLineEnter : set nosmartcase
        autocmd CmdLineLeave : set smartcase
    augroup END
endif

" Set textwidth for text file types
augroup text_file_width
    autocmd!
    " Sometimes, automatic filetype detection is not right, so we need to
    " detect the filetype based on the file extensions
    autocmd BufNewFile,BufRead *.md,*.MD,*.markdown setlocal textwidth=79
augroup END

if exists('##TermOpen')
    augroup term_settings
        autocmd!
        " Do not use number and relative number for terminal inside nvim
        autocmd TermOpen * setlocal norelativenumber nonumber
        " Go to insert mode by default to start typing command
        autocmd TermOpen * startinsert
    augroup END
endif

" More accurate syntax highlighting? (see `:h syn-sync`)
augroup accurate_syn_highlight
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

" Return to last edit position when opening a file
augroup resume_edit_position
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ | execute "normal! g`\"zvzz"
        \ | endif
augroup END

" Display a message when the current file is not in utf-8 format.
" Note that we need to use `unsilent` command here because of this issue:
" https://github.com/vim/vim/issues/4379. For older Vim (version 7.4), the
" help file are in gzip format, do not warn this.
augroup non_utf8_file_warn
    autocmd!
    autocmd BufRead * if &fileencoding != 'utf-8' && expand('%:e') != 'gz'
                \ | unsilent echomsg 'File not in UTF-8 format!' | endif
augroup END

augroup vimfile_setting
    autocmd!
    autocmd FileType vim setlocal foldmethod=expr foldlevel=0 foldlevelstart=-1
    \ foldexpr=VimFolds(v:lnum) foldtext=MyFoldText()
    \ keywordprg=:help formatoptions-=o formatoptions-=r
augroup END

augroup number_toggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &number | set relativenumber | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &number | set norelativenumber | endif
augroup END

" It is designed to work with vim-pandoc. To use it as a standalone plugin,
" we should add the following settings in our Neovim configuration file:
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"}

"{ Custom key mappings
" Save key strokes (now we do not need to press shift to enter command mode).
" Vim-sneak has also mapped `;`, so using the below mapping will break the map
" used by vim-sneak
nnoremap ; :
xnoremap ; :

" Quicker way to open command window
nnoremap q; q:

" Quicker <Esc> in insert mode
inoremap <silent> jk <Esc>

" Turn the word under cursor to upper case
inoremap <silent> <c-u> <Esc>viwUea

" Turn the current word into title case
inoremap <silent> <c-t> <Esc>b~lea

" Paste non-linewise text above or below current cursor,
" see https://stackoverflow.com/a/1346777/6064933
nnoremap <leader>p m`o<ESC>p``
nnoremap <leader>P m`O<ESC>p``

" Shortcut for faster save and quit
nnoremap <silent> <leader>w :update<CR>
" Saves the file if modified and quit
nnoremap <silent> <leader>q :x<CR>
" Quit all opened buffers
nnoremap <silent> <leader>Q :qa<CR>

" Navigation in the location and quickfix list
nnoremap [l :lprevious<CR>zv
nnoremap ]l :lnext<CR>zv
nnoremap [L :lfirst<CR>zv
nnoremap ]L :llast<CR>zv
nnoremap [q :cprevious<CR>zv
nnoremap ]q :cnext<CR>zv
nnoremap [Q :cfirst<CR>zv
nnoremap ]Q :clast<CR>zv

" Close location list or quickfix list if they are present,
" see https://superuser.com/q/355325/736190
nnoremap<silent> \x :windo lclose <bar> cclose<CR>

" Close a buffer and switching to another buffer, do not close the
" window, see https://stackoverflow.com/q/4465095/6064933
nnoremap <silent> \d :bprevious <bar> bdelete #<CR>

" Toggle search highlight, see https://stackoverflow.com/q/9054780/6064933
nnoremap <silent><expr> <Leader>hl (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" Insert a blank line below or above current line (do not move the cursor),
" see https://stackoverflow.com/a/16136133/6064933
nnoremap <expr> oo 'm`' . v:count1 . 'o<Esc>``'
nnoremap <expr> OO 'm`' . v:count1 . 'O<Esc>``'

" nnoremap oo @='m`o<c-v><Esc>``'<cr>
" nnoremap OO @='m`O<c-v><Esc>``'<cr>

" the following two mappings work, but if you change double quote to single, it
" will not work
" nnoremap oo @="m`o\<lt>Esc>``"<cr>
" nnoremap oo @="m`o\e``"<cr>

" Insert a space after current character
nnoremap <silent> <Space><Space> a<Space><ESC>h

" Yank from current cursor position to the end of the line (make it
" consistent with the behavior of D, C)
nnoremap Y y$

" Move the cursor based on physical lines, not the actual lines.
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> ^ g^
nnoremap <silent> 0 g0

" Do not include white space characters when using $ in visual mode,
" see https://vi.stackexchange.com/a/18571/15292
xnoremap $ g_

" Jump to matching pairs easily in normal mode
nnoremap <Tab> %

" Go to start or end of line easier
nnoremap H ^
xnoremap H ^
nnoremap L g_
xnoremap L g_

" Resize windows using <Alt> and h,j,k,l, inspiration from
" https://vim.fandom.com/wiki/Fast_window_resizing_with_plus/minus_keys (bottom page).
" If you enable mouse support, shorcuts below may not be necessary.
nnoremap <silent> <M-h> <C-w><
nnoremap <silent> <M-l> <C-w>>
nnoremap <silent> <M-j> <C-W>-
nnoremap <silent> <M-k> <C-W>+

" Fast window switching, inspiration from
" https://stackoverflow.com/a/4373470/6064933
nnoremap <silent> <M-left> <C-w>h
nnoremap <silent> <M-right> <C-w>l
nnoremap <silent> <M-down> <C-w>j
nnoremap <silent> <M-up> <C-w>k

" Continuous visual shifting (does not exit Visual mode), `gv` means
" to reselect previous visual area, see https://superuser.com/q/310417/736190
xnoremap < <gv
xnoremap > >gv

" When completion menu is shown, use <cr> to select an item
" and do not add an annoying newline. Otherwise, <enter> is what it is.
" For more info , see https://superuser.com/q/246641/736190 and
" https://unix.stackexchange.com/q/162528/221410
inoremap <expr> <cr> ((pumvisible())?("\<C-Y>"):("\<cr>"))
" Use <esc> to close auto-completion menu
inoremap <expr> <esc> ((pumvisible())?("\<C-e>"):("\<esc>"))

" Use <tab> to navigate down the completion menu.
inoremap <expr> <tab>  pumvisible()?"\<C-n>":"\<tab>"

" Edit and reload init.vim quickly
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :silent update $MYVIMRC <bar> source $MYVIMRC <bar>
    \ echomsg "Nvim config successfully reloaded!"<cr>

" Reselect the text that has just been pasted
nnoremap <leader>v `[V`]

" Search in selected region
vnoremap / :<C-U>call feedkeys('/\%>'.(line("'<")-1).'l\%<'.(line("'>")+1)."l")<CR>

" Find and replace (like Sublime Text 3)
nnoremap <C-H> :%s/
xnoremap <C-H> :s/

" Change current working directory locally and print cwd after that,
" see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
nnoremap <silent> <leader>cd :lcd %:p:h<CR>:pwd<CR>

" Use Esc to quit builtin terminal
if exists(':tnoremap')
    tnoremap <ESC>   <C-\><C-n>
endif

" Toggle spell checking
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

" Decrease indent level in insert mode with shift+tab
inoremap <S-Tab> <ESC><<i

" Change text without putting the text into register,
" see https://stackoverflow.com/q/54255/6064933
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc

" Remove trailing whitespace characters
nnoremap <silent> <leader><Space> :call StripTrailingWhitespaces()<CR>

" Clear highlighting
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

nnoremap <up> :echoerr "Don't use arrow keys, use H, J, K, L instead!"<CR>
nnoremap <down> :echoerr "Don't use arrow keys, use H, J, K, L instead!"<CR>
nnoremap <right> :echoerr "Don't use arrow keys, use H, J, K, L instead!"<CR>
nnoremap <left> :echoerr "Don't use arrow keys, use H, J, K, L instead!"<CR>

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Replace ex mode with gq
map Q gq

" Check file in shellcheck:
map <leader>s :!clear && shellcheck -x %<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" To start previewing a markdown file, use MarkdowPreview command. Your
" default browser will be opened automatically. You can also add a custom
" key mapping for this command:
nnoremap <M-m> :MarkdownPreview<CR>
"}

"{ UI settings
if !has('gui_running')
    augroup MyColors
        autocmd!
        autocmd ColorScheme * call MyHighlights()
    augroup END
else
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L
endif

function! MyHighlights() abort
    highlight clear

    " The following colors are taken from ayu_mirage vim-airline theme,
    " link: https://github.com/vim-airline/vim-airline-themes/
    hi User1 ctermfg=0 ctermbg=114
    hi User2 ctermfg=114 ctermbg=0

    " The following colors are taken from vim-gruvbox8,
    " link: https://github.com/lifepillar/vim-gruvbox8
    hi Normal ctermfg=187 ctermbg=NONE cterm=NONE
    hi CursorLineNr ctermfg=214 ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=102 ctermbg=NONE cterm=NONE
    hi SignColumn ctermfg=187 ctermbg=NONE cterm=NONE
    hi VertSplit ctermfg=59 ctermbg=NONE cterm=NONE

    hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE
    hi Comment ctermfg=102 ctermbg=NONE cterm=italic
    hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE
    hi Error ctermfg=203 ctermbg=234 cterm=bold,reverse
    hi ErrorMsg ctermfg=234 ctermbg=203 cterm=bold
    hi Folded ctermfg=102 ctermbg=237 cterm=italic
    hi LineNr ctermfg=243 ctermbg=NONE cterm=NONE
    hi MatchParen ctermfg=NONE ctermbg=59 cterm=bold
    hi NonText ctermfg=239 ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=187 ctermbg=239 cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=239 cterm=NONE
    hi PmenuSel ctermfg=239 ctermbg=109 cterm=bold
    hi PmenuThumb ctermfg=NONE ctermbg=243 cterm=NONE
    hi SpecialKey ctermfg=102 ctermbg=NONE cterm=NONE
    hi StatusLine ctermfg=239 ctermbg=187 cterm=reverse
    hi StatusLineNC ctermfg=237 ctermbg=137 cterm=reverse
    hi TabLine ctermfg=243 ctermbg=237 cterm=NONE
    hi TabLineFill ctermfg=243 ctermbg=237 cterm=NONE
    hi TabLineSel ctermfg=142 ctermbg=237 cterm=NONE
    hi ToolbarButton ctermfg=230 ctermbg=59 cterm=bold
    hi ToolbarLine ctermfg=NONE ctermbg=59 cterm=NONE
    hi Visual ctermfg=NONE ctermbg=59 cterm=NONE
    hi WildMenu ctermfg=109 ctermbg=239 cterm=bold
    hi Conceal ctermfg=109 ctermbg=NONE cterm=NONE
    hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
    hi DiffAdd ctermfg=142 ctermbg=234 cterm=reverse
    hi DiffChange ctermfg=107 ctermbg=234 cterm=reverse
    hi DiffDelete ctermfg=203 ctermbg=234 cterm=reverse
    hi DiffText ctermfg=214 ctermbg=234 cterm=reverse
    hi Directory ctermfg=142 ctermbg=NONE cterm=bold
    hi EndOfBuffer ctermfg=234 ctermbg=NONE cterm=NONE
    hi IncSearch ctermfg=208 ctermbg=234 cterm=reverse
    hi ModeMsg ctermfg=214 ctermbg=NONE cterm=bold
    hi MoreMsg ctermfg=214 ctermbg=NONE cterm=bold
    hi Question ctermfg=208 ctermbg=NONE cterm=bold
    hi Search ctermfg=214 ctermbg=234 cterm=reverse
    hi SpellBad ctermfg=203 ctermbg=NONE cterm=italic,underline
    hi SpellCap ctermfg=109 ctermbg=NONE cterm=italic,underline
    hi SpellLocal ctermfg=107 ctermbg=NONE cterm=italic,underline
    hi SpellRare ctermfg=175 ctermbg=NONE cterm=italic,underline
    hi Title ctermfg=142 ctermbg=NONE cterm=bold
    hi WarningMsg ctermfg=203 ctermbg=NONE cterm=bold
    hi Boolean ctermfg=175 ctermbg=NONE cterm=NONE
    hi Character ctermfg=175 ctermbg=NONE cterm=NONE
    hi Conditional ctermfg=203 ctermbg=NONE cterm=NONE
    hi Constant ctermfg=175 ctermbg=NONE cterm=NONE
    hi Define ctermfg=107 ctermbg=NONE cterm=NONE
    hi Debug ctermfg=203 ctermbg=NONE cterm=NONE
    hi Delimiter ctermfg=208 ctermbg=NONE cterm=NONE
    hi Error ctermfg=203 ctermbg=234 cterm=bold,reverse
    hi Exception ctermfg=203 ctermbg=NONE cterm=NONE
    hi Float ctermfg=175 ctermbg=NONE cterm=NONE
    hi Function ctermfg=142 ctermbg=NONE cterm=bold
    hi Identifier ctermfg=109 ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=fg ctermbg=NONE cterm=NONE
    hi Include ctermfg=107 ctermbg=NONE cterm=NONE
    hi Keyword ctermfg=203 ctermbg=NONE cterm=NONE
    hi Label ctermfg=203 ctermbg=NONE cterm=NONE
    hi Macro ctermfg=107 ctermbg=NONE cterm=NONE
    hi Number ctermfg=175 ctermbg=NONE cterm=NONE
    hi Operator ctermfg=107 ctermbg=NONE cterm=NONE
    hi PreCondit ctermfg=107 ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=107 ctermbg=NONE cterm=NONE
    hi Repeat ctermfg=203 ctermbg=NONE cterm=NONE
    hi SpecialChar ctermfg=203 ctermbg=NONE cterm=NONE
    hi SpecialComment ctermfg=203 ctermbg=NONE cterm=NONE
    hi Statement ctermfg=203 ctermbg=NONE cterm=NONE
    hi StorageClass ctermfg=208 ctermbg=NONE cterm=NONE
    hi Special ctermfg=208 ctermbg=NONE cterm=italic
    hi String ctermfg=142 ctermbg=NONE cterm=italic
    hi Structure ctermfg=107 ctermbg=NONE cterm=NONE
    hi Todo ctermfg=fg ctermbg=234 cterm=bold,italic
    hi Type ctermfg=214 ctermbg=NONE cterm=NONE
    hi Typedef ctermfg=214 ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=109 ctermbg=NONE cterm=underline
    hi CursorIM ctermfg=NONE ctermbg=NONE cterm=reverse

    hi Comment cterm=NONE
    hi Folded cterm=NONE
    hi SpellBad cterm=underline
    hi SpellCap cterm=underline
    hi SpellLocal cterm=underline
    hi SpellRare cterm=underline
    hi Special cterm=NONE
    hi String cterm=NONE
    hi Todo cterm=bold

    hi NormalMode ctermfg=137 ctermbg=234 cterm=reverse
    hi InsertMode ctermfg=109 ctermbg=234 cterm=reverse
    hi ReplaceMode ctermfg=107 ctermbg=234 cterm=reverse
    hi VisualMode ctermfg=208 ctermbg=234 cterm=reverse
    hi CommandMode ctermfg=175 ctermbg=234 cterm=reverse
    hi Warnings ctermfg=208 ctermbg=234 cterm=reverse
endfunction

if exists('&termguicolors')
    " If we want to use true colors, we must a color scheme which support true
    " colors, for example, https://github.com/sickill/vim-monokai
    set notermguicolors
endif
set background=dark
colorscheme desert

" Highlight trailing spaces and leading tabs
call matchadd('WarningMsg', '\s\+$')
call matchadd('WarningMsg', '^\t\+')

" statusline settings
let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}

set statusline=
set statusline+=%1*
" Show current mode
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%{&spell?'[SPELL]':''}

set statusline+=%#WarningMsg#
set statusline+=%{&paste?'[PASTE]':''}

set statusline+=%2*
" File path, as typed or relative to current directory
set statusline+=\ %F

set statusline+=%{&modified?'\ [+]':''}
set statusline+=%{&readonly?'\ []':''}

" Truncate line here
set statusline+=%<

" Separation point between left and right aligned items.
set statusline+=%=

set statusline+=%{&filetype!=#''?&filetype.'\ ':'none\ '}

" Encoding & Fileformat
set statusline+=%#WarningMsg#
set statusline+=%{&fileencoding!='utf-8'?'['.&fileencoding.']':''}

set statusline+=%2*
set statusline+=%-7([%{&fileformat}]%)

" Warning about byte order
set statusline+=%#WarningMsg#
set statusline+=%{&bomb?'[BOM]':''}

set statusline+=%1*
" Location of cursor line
set statusline+=[%l/%L]

" Column number
set statusline+=\ col:%2c

" Warning about trailing spaces.
set statusline+=%#WarningMsg#
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%{StatuslineTabWarning()}

" Recalculate the trailing whitespace warning when idle, and after saving.
augroup check_trailing_space
    autocmd!
    autocmd CursorHold,BufWritePost * unlet! b:statusline_trailing_space_warning
        \ | let &statusline=&statusline
augroup END

augroup check_mixed_tabs
    autocmd!
    autocmd CursorHold,BufWritePost * unlet! b:statusline_tab_warning
        \ | let &statusline=&statusline
augroup END

" Find if trailing spaces exist.
function! StatuslineTrailingSpaceWarning()
    if !exists('b:statusline_trailing_space_warning')
        " If the file is unmodifiable, do not warn this.
        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        let l:line_num = search('\s\+$', 'nw')
        if l:line_num != 0
            let b:statusline_trailing_space_warning = ' [' . l:line_num . ']' . 'trailing space'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

" Find if they are mixed indentings.
function! StatuslineTabWarning()
    if !exists('b:statusline_tab_warning')
        " If the file is unmodifiable, do not warn this.
        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        let has_leading_tabs = search('^\t\+', 'nw') != 0
        let has_leading_spaces = search('^ \+', 'nw') != 0

        if has_leading_tabs && has_leading_spaces
            let b:statusline_tab_warning = ' [mixed-indenting]'
        elseif has_leading_tabs
            let b:statusline_tab_warning = ' [tabbed-indenting]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif

    return b:statusline_tab_warning
endfunction
"}

"{ Some good references
" 1. https://gist.github.com/suderman/1243665
" 2. https://gist.github.com/autrimpo/f40e4eda233977dd3a619c6083d9bebd
" 3. https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
"}
