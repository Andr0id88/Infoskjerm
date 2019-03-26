" ____  __.      .__  .__
"|    |/ _|____  |  | |__|__  ______.__.________
"|      < \__  \ |  | |  \  \/  <   |  |\___   /
"|    |  \ / __ \|  |_|  |>    < \___  | /    /
"|____|__ (____  /____/__/__/\_ \/ ____|/_____ \
"        \/    \/              \/\/           \/


call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

let mapleader =","


"""""""""""""""""""""""""""""
" =>     Some basics:
"""""""""""""""""""""""""""""
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber
set bg=light
set mouse=a
set nohlsearch
set clipboard=unnamedplus
set ignorecase

"""""""""""""""""""""""""""""
" =>  Parenthesis/bracket:
"""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

" Show matching brackets when text indicator is over them
set showmatch

""""""""""""""""""""""""""
" => Ultisnips shortcuts:
""""""""""""""""""""""""""
" UltiSnips bindings:
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" Additional UltiSnips config.
let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = ['ultisnips']

" Personal Info
let g:snips_author="Andre Hansen"
let g:snips_email = "1988.hansen@gmail.com"
let g:snips_github = "www.github.com/Andr0id88"

" Opens up snippets folder and lets you tab trough the files:
nnoremap <leader>s :r ~/.snippy/


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Split Navigation:
" Shortcutting split navigation, saving a keypress:
"""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Compile and Preview:
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Compile document, be it groff/LaTeX/markdown/etc:
map <leader>c :w! \| !compiler <c-r>%<CR>
" Open corresponding .pdf/.html or preview:
map <leader>p :!opout <c-r>%<CR><CR>


""""""""""""""""""""""""""""""
" => Search & Replace
""""""""""""""""""""""""""""""
" Pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" :W sudo saves the file
" (useful for handling the permission-denied error)
	command W w !sudo tee % > /dev/null

" Enable autocompletion:
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <C-n> :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
	vnoremap <C-c> "+y
	map <C-p> "+P


" Enable Goyo by default for mutt writting
	" Goyo's width will be the line limit in mutt.
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=light

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost ~/.bmdirs,~/.bmfiles !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %


" ALL SNIPPEST ARE CURRENTLY DISABLED IN FAVOR OF ULTISNIPS!

" Check file in shellcheck, currently disabled because of snippy testing:
"	map <leader>s :!clear && shellcheck %<CR>

" Navigating with guides
"	inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
"	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
"       map <leader><leader> <Esc>/<++><Enter>"_c4l
"""LATEX
	" Word count:
"	autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>
	" Code snippets
"	autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
"	autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
"	autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
"	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
"	autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
"	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
"	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
"	autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
"	autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
"	autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
"	autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
"	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
"	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
"	autocmd FileType tex inoremap ,li <Enter>\item<Space>
"	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
"	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
"	autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
"	autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
"	autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
"	autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
"	autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
"	autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
"	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
"	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
"	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
"	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
"	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
"	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
"	autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
"	autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
"	autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
"	autocmd FileType tex inoremap ,bt {\blindtext}
"	autocmd FileType tex inoremap ,nu $\varnothing$
"	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
"	autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

"""HTML
"	autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
"	autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
"	autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
"	autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
"	autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
"	autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
"	autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
"	autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
"	autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
"	autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
"	autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
"	autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
"	autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
"	autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
"	autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
"	autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
"	autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
"	autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
"	autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
"	autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
"	autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
"	autocmd FileType html inoremap &<space> &amp;<space>
"	autocmd FileType html inoremap á &aacute;
"	autocmd FileType html inoremap é &eacute;
"	autocmd FileType html inoremap í &iacute;
"	autocmd FileType html inoremap ó &oacute;
"	autocmd FileType html inoremap ú &uacute;
"	autocmd FileType html inoremap ä &auml;
"	autocmd FileType html inoremap ë &euml;
"	autocmd FileType html inoremap ï &iuml;
"	autocmd FileType html inoremap ö &ouml;
"	autocmd FileType html inoremap ü &uuml;
"	autocmd FileType html inoremap ã &atilde;
"	autocmd FileType html inoremap ẽ &etilde;
"	autocmd FileType html inoremap ĩ &itilde;
"	autocmd FileType html inoremap õ &otilde;
"	autocmd FileType html inoremap ũ &utilde;
"	autocmd FileType html inoremap ñ &ntilde;
"	autocmd FileType html inoremap à &agrave;
"	autocmd FileType html inoremap è &egrave;
"	autocmd FileType html inoremap ì &igrave;
"	autocmd FileType html inoremap ò &ograve;
"	autocmd FileType html inoremap ù &ugrave;


""".bib
"	autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
"	autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
"	autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

"	autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

""".xml
"	autocmd FileType xml inoremap ,e <item><Enter><title><++></title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
"	autocmd FileType xml inoremap ,a <a href="<++>"><++></a><++><Esc>F"ci"

