function SophHelp()
  if &buftype=="help" && match( strpart( getline("."), col(".")-1,1), "\\S")<0
    bw
  else
    try
      exec "help ".expand("<cWORD>")
    catch /:E149:/
      exec "help ".expand("<cword>")
    endtry
  endif
endfunc
nnoremap <silent> <F1> :call SophHelp()<CR>
imap <F1> nop

" start in maximizing mode
set noswapfile
"set completeopt-=preview
set foldlevel=100
" Some useful miscellaneous options
set listchars=tab:>-,trail:-        " In case I want to use the 'list' option
set matchpairs+=<:>                 " match < > with the % command
set complete=.,t,i,w,u            " For great completion justice...
set backspace=2					            " allow rational backspacing in insert mode
set number
" Ignore case searching
set smartcase	
set incsearch
" Commenty-justice
set formatoptions=tcrqn
set comments=b:#
" Bring a list of filenames when <tab> is pressed
set wildmenu

"}}}

" 256 Colors for gvim
set t_Co=256

"{{{ color highlighing in an xterm
"if &term =~ "xterm"
 if has("terminfo")
  set t_Co=16
  set t_Sf=[3%p1%dm
  set t_Sb=[4%p1%dm
  set t_vb=
 else
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
  set t_vb=
 endif
"endif
"}}}

"{{{ COPY/CUT/PASTE
" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-V should work in all modes
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
cmap <C-V> <C-R>"
"":nnoremap <C-v> "+P=''"
"":inoremap <C-v> <C-o>"+P<C-o>=''"

vmap <C-C> "+y

" CTRL-X should work in visual mode
vnoremap <C-X> "+x

" backspace in Visual mode deletes selection
vnoremap <BS> d

nnoremap <MouseDown> <C-Y>k
nnoremap <MouseUp> <C-E>j
inoremap <MouseDown> <ESC><C-Y>ki
inoremap <MouseUp> <ESC><C-E>ji
"}}}

" {{{ better movement - half screen height 
nnoremap <PageUp> <C-U>
nnoremap <PageDown> <C-D>
inoremap <PageUp> <ESC><C-U>i
inoremap <PageDown> <ESC><C-D>i
"}}}



" {{{ from brief.vim... remaps better visual edit mode 
 " brief-home-key
inoremap <silent> <Home> <C-O>:call <SID>BriefHomeKey()<CR>

" brief-end-key
inoremap <silent> <End> <C-O>:call <SID>BriefEndKey()<CR>

function! s:BriefHomeKey()
   " if we are on the first char of the line, go to the top of the screen
   if (col(".") <= 1)
      " if on top of screen, go to top of file
      let l:a = line(".")
      normal H0
      if (line(".") == l:a)
         " we did not move! so ...
         normal 1G
      endif
   else
      " goto beginning of line
      normal 0
   endif
endfunction

" This function is taken from vim online web page and modified
function! s:BriefEndKey()
    let cur_col = virtcol(".")
    let line_len = virtcol("$")

    if cur_col != line_len
        " The cursor is not at the end of the line, goto the end of the line
        execute "normal " . line_len . "|"
    else
        " The cursor is already at the end of the line
        let cur_line = line(".")
        normal L         " goto the end of the current page
        if line(".") == cur_line
            " Cursor is already at the end of the page
            normal G  " Goto the end of the file
            let line_len = virtcol("$")
            if line_len > 0
                execute "normal " . line_len . "|"
            endif
        else
            " Cursor was not already in the end of the page
            let line_len = virtcol("$")
            if line_len > 0
                execute "normal " . line_len . "|"
            endif
        endif
    endif
endfunction

"}}}

"{{{ Better visual mode selection
"nmap <silent> <S-Left> 

"}}} 


"Toggle NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Toggle Autowrapping
"set sr fo=roqm1 tw=64
" im <C-B> <C-O>:setl sr! fo<C-R>=strpart("-+",&sr,1)<CR>=tc<CR>_<BS><Right>


" Allow filetype plugins (ft_plugin stuff)
filetype plugin on

" Auto-detect file type
filetype on

" turn on syntax
syntax on

" Toogle past mode
set pastetoggle=<F5>   " useful so auto-indenting doesn't mess up code when pasting

"{{{ status line
set laststatus=2
set statusline=
set statusline+=%2*%-3.3n%0*\ " buffer number
set statusline+=%f\ " file name
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=[
if v:version >= 600
    set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
    set statusline+=%{&encoding}, " encoding
endif
set statusline+=%{&fileformat}] " file format
if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
    set statusline+=\ %{VimBuddy()} " vim buddy
endif
set statusline+=%= " right align
"set statusline+=%2*0x%-8B\ " current char
"set statusline+=0x%-8B\ " current char
set statusline+=%-10.(%l,%c%V%)\ \%L\ %<%P " offset
"}}}

"{{{ color schemes
" colorscheme desertEx
colorscheme wombat
" colorscheme enzyme
"colorscheme ir_black
"}}}
"{{{ Python specific 
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead,BufNewFile *.py set smartindent
autocmd BufRead,BufNewFile *.py set cinwords=class,def,elif,else,except,finally,for,if,try,while
autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
"}}}

"{{{ auto commands
" omnicompletion
"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd Filetype sql set omnifunc=sqlcomplete#Complete
autocmd Filetype ruby set omnifunc=rubycomplete#Complete

" Miscellaneous auto commands
augroup filetype
autocmd BufNewFile,BufRead */Mail/drafts/* set filetype=mail
augroup END
autocmd VimEnter * set vb t_vb=
autocmd Filetype css set smartindent
autocmd Filetype html set formatoptions+=tl
autocmd Filetype html,css set noexpandtab tabstop=2
autocmd Filetype make set noexpandtab shiftwidth=8
autocmd Filetype mail set tw=72
autocmd Filetype mail set nocindent
autocmd Filetype mail set noautoindent
autocmd Filetype mail set nosmartindent
autocmd FileType perl set commentstring=#\ %s
autocmd FileType perl set comments=f:#
autocmd Filetype perl,php,javascript set smartindent
autocmd FileType c,cpp set comments=s1:/*,mb:*,ex:*/,f://
autocmd FileType java set comments=s1:/*,mb:*,ex:*/,f://
autocmd FileType cvs set tw=72
"}}}

" handle omnicompletion better
inoremap <silent> <S-CR> <ESC>o
inoremap <silent> <C-Space> <ESC>la


""if !has("gui_running")
let g:AutoComplPop_NotEnableAtStartup = 0
let g:AutoComplPop_CompleteoptPreview = 1
let g:NeoComplCache_EnableAtStartup = 0
""endif
if has("autocmd")
	autocmd FileType python set complete+=k$HOME/.vim/autocomplete/pydiction
endif " has("autocmd") 


