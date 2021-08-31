
"https://github.com/dense-analysis/ale#standard-installation
":ALEInfo

""""""""""""""""""""""
".vimrc
" Gregg Lain (based on Gino Ledesma vimrc)
"
" Global Settings
set nocompatible
set background=dark

set number											" line-numbering
set showmatch										" show matching brackets/parens
" set mouse=a										" automatically enable mouse usage
set viewoptions=folds,options,cursor,unix,slash 	" better unix / windows compatibility
set history=1000  									" Store a ton of history (default is 20)
"set viminfo=100,h 									" allow yanking more than 50 lines/10 kbytes
" set spell 		 	        					" spell checking on - annoying for code

syntax on											" syntax highlighting
set hlsearch										" highlight last searched term
set binary                                          " edit binary files

" vim UI
set showmode

"set cursorline
set tabstop=4

"==================================================================================
" Damian Conway is.gd/IBV2013 / https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup

"====[ remap ; to : ]============================
nnoremap ; :

"=======[ visual block mode easier ]====================
nnoremap v <C-V>
nnoremap <C-V> v
vnoremap v <C-V>
vnoremap <C-V> v

"====[ Make the 81st column stand out ]====================
highlight ColorColumn ctermbg=green
call matchadd('ColorColumn', '\%81v', 100)

"=====[ Highlight the match in red ]=============
function! HLNext (blinktime)
	let [bufnum, lnum, col, off] = getpos('.')
	let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/)) let target_pat = '\c\%#'.@/
	let ring = matchadd('WhiteOnRed', target_pat, 101)
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	call matchdelete(ring)
	redraw
endfunction

"exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
exec "set listchars=tab:\uBB\uBB,nbsp:~"
"set list

" END Damian Conway Vim-Setup
"==================================================================================

if has('cmdline_info')
	set ruler											" cursor position
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
	set showcmd
endif

if has('statusline')
	set laststatus=2
	set statusline=%<%f\  								" Filename
	set statusline+=%w%h%m%r 							" Options
	set statusline+=\ [%{&ff}/%Y]           			" filetype
	set statusline+=\ [%{getcwd()}]         			" current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%% 			" Right aligned file nav info

endif

" Formatting
"filetype plugin indent on								" enable filetype plugin
set autoindent

" http://vim.1045645.n5.nabble.com/vimdiff-colors-td1173870.html
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=grey ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=white ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 
set diffopt=filler,context:9

" Plugins. 
packloadall
silent! helptags ALL

