"
" .vimrc File
" Maintained by: alawatthe
" Inspired by: Jeffrey Way, Drew Neil, Rupert Giles
"

" Forget compatibility with Vi
set nocompatible

" Enable filetypes
if has("autocmd")
  filetype plugin indent on
endif


" Want a different map leader than \
let mapleader = ","

" Map escape key to jj
imap jj <esc>

" Map the space bar to colon
nmap <space> :


"========================================
" Editor look and feel
"========================================

set ruler									" Display current cursor position in lower right corner.
set number								" Show lines numbers (relativenumber for relative numbering)
set showcmd								" Show command in bottom right portion of the screen
set mousehide             " Hide mouse when typing
set showmatch             " show matching brackets
set cursorline            " Highlights the current line
set linespace=3					  " Setting the line space
set scrolloff=3           " Scroll 3 lines before top/bottom
set laststatus=2          " Always show the status line
set numberwidth=1         " using only 1 column (and 1 space) while possible

if &t_Co > 2 || has("gui_running")
  syntax on               " Turn syntax highlighting on
endif

colorscheme eternity  		" Color scheme
set guifont=Menlo:h12			" Set font type and size. Depends on the resolution.
"set guifont="Meslo LG M DZ":h13

"Hide MacVim toolbar by default
set go-=T


"Tab stuff      (TODO: test what's the best)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

"Indent stuff   (TODO: test what's the best)
set smartindent
set autoindent
"set copyindent

"Better line wrapping   (TODO: test what's the best)
set wrap
set linebreak
set textwidth=79
set formatoptions=w1rn

"Hard-wrap paragraphs of text
nnoremap <leader>q gwip


"========================================
" Technical stuff
"========================================

set encoding=utf-8                " set the encoding to utf-8
set vb t_vb=                      " switch off the beep
set noerrorbells                  " switch off the beep
set nobackup                      " no backup file
set noswapfile                    " now .swp file
set history=100                   " create a larger history
set helplang=de                   " set your prefered help language, english is the fallback
set backspace=indent,eol,start    " allow backspacing over everthing in insert mode
set autoread		                  " auto read when file is changed from outside
set noautowrite                   " Never write a file unless I request it.
set noautowriteall                " NEVER.
         
             
"========================================
" Movement stuff
"========================================

" Moving between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Bubble single lines  (ctrl and ↑ or ↓)
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

"Moving around in line blocks (cmd and j,k,$,^,0)
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g0
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g0

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv


"========================================
" Search stuff
"========================================

set incsearch       " Set incremental searching"
set hlsearch        " Highlight searching
set ignorecase      " case insensitive search
set smartcase


"========================================
" Folding
"========================================

" Enable code folding
set foldenable

" Shortcut to fold tags with leader
nnoremap <leader>ft Vatzf



"========================================
" Spell checking
"========================================

" Toggles spell checking: ,s in normal mode
nmap <silent> <leader>s :set spell!<CR>


"Show spaces and tabs
set listchars=tab:→\ ,eol:¶,trail:•
nmap <leader>l :set list!<CR>


"========================================
" Buffer stuff
"========================================

set hidden    " Switch between buffers without saving

"Load the current buffer in a browser
abbrev ff :! open -a firefox.app %:p<cr>
abbrev chrome :! open -a Google\ Chrome.app %:p<cr>
abbrev safari :! open -a Safari.app %:p<cr>
abbrev opera :! open -a Opera.app %:p<cr>
abbrev chromium :! open -a Chromium.app %:p<cr>



"========================================
" Tabs
"========================================

map <leader>te :tabnew<cr>
map <leader>tn :tabNext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tc :tabclose<cr>


"========================================
" Plug-in Stuff
"========================================

"Change zen coding plug-in expansion key to shift + e
let g:sparkupExecuteMapping = '<D-e>'

"Faster shortcut for commenting. Requires T-Comment plug-in
map <leader>c <c-_><c-_>

"NERDTREE PLUGIN SETTINGS
"Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>

let NERDTreeShowHidden=1      " Show hidden files, too
let NERDTreeShowBookmarks=1   " Show the bookmarks table on startup

let NERDTreeIgnore=[ '\.DS_Store$', '\.swp$']


"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p


"========================================
"Helpeful abbreviations
"========================================

iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

"Spelling corrects
iab teh the
iab Teh The
iab lenght length

iab jquery <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
iab fori for(i=0; i< ; i++){
iab jfunc function (){<CR><CR>return ;<CR>}jjkki 

inoremap { {<CR><BS>}<Esc>ko


"=============================================================================================================================================================
"=============================================================================================================================================================
"=============================================================================================================================================================
"=============================================================================================================================================================
"=============================================================================================================================================================

"Ever notice a slight lag after typing the leader key + command? This lowers the timeout.
set timeoutlen=500


" Create dictionary for custom expansions
set dictionary+=/Users/Alexander/.vim/dict.txt

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Split windows below the current window.
set splitbelow

" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Set up an HTML5 template for all new .html files
"autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl


"Map a change directory to the desktop - Mac specific
nmap <leader>d :cd ~/Desktop<cr>:e.<cr>

"Shortcut for editing vimrc file in a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>





"Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

"Map code completion to , + tab
imap <leader><tab> <C-x><C-o>

" More useful command-line completion
set wildmenu

"Auto-completion menu
set wildmode=list:longest

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
	\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
	\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'



"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>






" Train yourself to use hjkl
" Disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Get to home dir easier
" <leader>hm is easier to type than :cd ~
nmap <leader>hm :cd ~/ <CR>

" Alphabetically sort CSS properties in file with :SortCSS
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort

" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
nmap <leader>bv :bel vsp

" Saves file when Vim window loses focus
au FocusLost * :wa

"Write the old file out when switching between files.
set autowrite


" No more stretching for navigating files
"noremap h ;
"noremap j h
"noremap k gj
"noremap l gk
"noremap ; l


" print empty <a> tag
map! ;h <a href=""></a><ESC>5hi



" Bigger functions
" ================

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif



if has("autocmd")
  autocmd bufWritePost *.js :JSHint
endif

" Remove trailing white space when saving (enabled for .py, .js and .css)
autocmd BufWritePre *.py,*.js,*.css :call <SID>StripTrailingWhitespaces()
function! <SID>StripTrailingWhitespaces()
		" Preparation: save last search, and cursor position.
		let _s=@/
		let l = line(".")
		let c = col(".")
		" Do the business:
		%s/\s\+$//e
		" Clean up: restore previous search history, and cursor position
		let @/=_s
		call cursor(l, c)
endfunction



" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc





" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
	let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
	if l:tabstop > 0
		let &l:sts = l:tabstop
		let &l:ts = l:tabstop
		let &l:sw = l:tabstop
	endif
	call SummarizeTabs()
endfunction
	
function! SummarizeTabs()
	try
		echohl ModeMsg
		echon 'tabstop='.&l:ts
		echon ' shiftwidth='.&l:sw
		echon ' softtabstop='.&l:sts
		if &l:et
			echon ' expandtab'
		else
			echon ' noexpandtab'
		endif
	finally
		echohl None
	endtry
endfunction

"jceb

" vgod
" nvie
" skyl
" sontek
"
" carllerche
" bitprophet
" feelinglucky
