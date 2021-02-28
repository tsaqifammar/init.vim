" Plugins
	call plug#begin('~/AppData/Local/nvim/plugged')
	Plug 'tomasr/molokai'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-surround'
	Plug 'junegunn/goyo.vim' " distraction free writing
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'tpope/vim-commentary'
	Plug 'preservim/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'mhinz/vim-startify'
	Plug 'unblevable/quick-scope'

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	call plug#end()

" General settings

	let g:mapleader = "\<Space>"

	syntax enable
	set hidden
	set wrap
	set linebreak
	set mouse=a
	set smartindent
	set autoindent
	set splitbelow
	set splitright
	highlight Comment cterm=italic gui=italic
	set smarttab
	set tabstop=4
	set softtabstop=0 noexpandtab
	set shiftwidth=4
	set cursorline
	set nu rnu " relative line numbering
	set formatoptions-=cro
	set encoding=utf-8
	set fileencoding=utf-8
	set background=dark
	set t_Co=256
	if (has("nvim"))
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	if (has("termguicolors"))
		set termguicolors
	endif
	colorscheme molokai

	" terminal settings
	augroup neovim_terminal
		autocmd!
		" Enter Terminal-mode (insert) automatically
		autocmd TermOpen * startinsert
		" Disables number lines on terminal buffers
		autocmd TermOpen * :set nonumber norelativenumber
		" allows you to use Ctrl-c on terminal window
		autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
	augroup END

	au GUIEnter * simalt ~x " maximized window on startup

	au! BufWritePost $MYVIMRC source % " :e $MYVIMRC to open init.vim

" Mappings
	" Use alt + hjkl to resize windows
	nnoremap <M-j> :resize -2<CR>
	nnoremap <M-k> :resize +2<CR>
	nnoremap <M-h> :vertical resize -2<CR>
	nnoremap <M-l> :vertical resize +2<CR>

	" Tab and Shift+Tab to move to next/prev buffer.
	nnoremap <TAB> :bnext<CR>
	nnoremap <S-TAB> :bprevious<CR>

	" Better tabbing
	vnoremap < <gv
	vnoremap > >gv

	" Better window navigation
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

	" For competitive programming
	augroup compileandrun
		autocmd!
		autocmd filetype python nnoremap <f5> :w <bar> :!python3 % <cr>
		autocmd filetype cpp nnoremap <f5> :w <bar> !g++ -std=c++14 %<cr>
		autocmd filetype cpp nnoremap <f6> :vnew <bar> :te "a.exe"<cr>
		autocmd filetype c nnoremap <f5> :w <bar> !make %:r && ./%:r <cr>
	augroup END

	" Airline
	nmap <leader>1 <Plug>AirlineSelectTab1
	nmap <leader>2 <Plug>AirlineSelectTab2
	nmap <leader>3 <Plug>AirlineSelectTab3
	nmap <leader>4 <Plug>AirlineSelectTab4
	nmap <leader>5 <Plug>AirlineSelectTab5
	nmap <leader>6 <Plug>AirlineSelectTab6
	nmap <leader>7 <Plug>AirlineSelectTab7
	nmap <leader>8 <Plug>AirlineSelectTab8
	nmap <leader>9 <Plug>AirlineSelectTab9

	" Nerdtree
	nnoremap <leader>n :NERDTreeToggle<CR>

	" Coc
		set completeopt=longest,menuone
		" Ctrl+space to trigger completion
		if has('nvim')
		  inoremap <silent><expr> <c-space> coc#refresh()
		else
		  inoremap <silent><expr> <c-@> coc#refresh()
		endif

		" Select next/prev suggestion with tab/shift+tab or ctrl+j/k
		inoremap <silent><expr> <TAB>
			  \ pumvisible() ? "\<C-n>" :
			  \ <SID>check_back_space() ? "\<TAB>" :
			  \ coc#refresh()
		inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
		inoremap <silent><expr> <C-j>
			  \ pumvisible() ? "\<C-n>" :
			  \ <SID>check_back_space() ? "\<TAB>" :
			  \ coc#refresh()
		inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
		function! s:check_back_space() abort
		  let col = col('.') - 1
		  return !col || getline('.')[col - 1]  =~# '\s'
		endfunction

		" Enter(<cr>) to confirm completion
		if exists('*complete_info')
		  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
		else
		  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
		endif

" Plugin settings
	" Startify
	let g:startify_custom_header = [
	\ '  _   _        __      ___           ',
	\ ' | \ | |       \ \    / (_)          ',
	\ ' |  \| | ___  __\ \  / / _ _ __ ___  ',
	\ ' | . ` |/ _ \/ _ \ \/ / | | ''_ ` _ \ ',
	\ ' | |\  |  __/ (_) \  /  | | | | | | |',
	\ ' |_| \_|\___|\___/ \/   |_|_| |_| |_|',
	\ '                                     ',
	\ ]
	" Airline
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#buffer_idx_mode = 1
	let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
	let g:airline_theme='transparent'
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif
	" unicode symbols
	let g:airline_left_sep = '»'
	let g:airline_left_sep = '▶'
	let g:airline_right_sep = '«'
	let g:airline_right_sep = '◀'
	let g:airline_symbols.linenr = '␊'
	let g:airline_symbols.linenr = '␤'
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.branch = '⎇'
	let g:airline_symbols.paste = 'ρ'
	let g:airline_symbols.paste = 'Þ'
	let g:airline_symbols.paste = '∥'
	let g:airline_symbols.whitespace = 'Ξ'
	" airline symbols
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
	let g:airline_symbols.linenr = ''

	" Goyo
	let g:goyo_width = 150
	let g:goyo_height = 140
	let g:goyo_linenr = 1

	" Nerdtree
	let NERDTreeAutoDeleteBuffer = 1
	let NERDTreeMinimalUI = 1
	let NERDTreeDirArrows = 1
	" Exit Vim if NERDTree is the only window left
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
		\ quit | endif

	" Quickscope
	let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

	" MarkdownPreview
	let g:mkdp_refresh_slow = 1

	" Markdown + math syntax highlighting
	function! MathAndLiquid()
		"" Define certain regions
		" Block math. Look for "$$[anything]$$"
		syn region math start=/\$\$/ end=/\$\$/
		" inline math. Look for "$[not $][anything]$"
		syn match math_block '\$[^$].\{-}\$'

		" Liquid single line. Look for "{%[anything]%}"
		syn match liquid '{%.*%}'
		" Liquid multiline. Look for "{%[anything]%}[anything]{%[anything]%}"
		syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
		" Fenced code blocks, used in GitHub Flavored Markdown (GFM)
		syn region highlight_block start='```' end='```'

		"" Actually highlight those regions.
		hi link math Statement
		hi link liquid Statement
		hi link highlight_block Function
		hi link math_block Function
	endfunction

	" Call everytime we open a Markdown file
	autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()

