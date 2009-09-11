set completeopt=longest,menu,preview
set thesaurus=~/.vim/linguistics/mthesaur.txt
" Have the mouse movement focus our windows
set mousefocus

" build tags of your own project with CTRL+F12
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
"inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

set guifont=courier\ bold\ 09

" {{{ Handle UI simplicity 
set guioptions-=T     " Remove the toolbar and menubar
set guioptions-=m
set guioptions-=r     " Remove right- and left-hand scrollbars
set guioptions-=L     
set guioptions+=c     " Console-based dialogs for simple queries

" allow windows to get fully squashed
set winminheight=0  
"}}}

" {{{ Better tab support 
" move between tabs
nnoremap <silent> <C-PageUp> :tabprevious<CR>
nnoremap <silent> <C-PageDown> :tabnext<CR>

inoremap <silent> <C-PageUp> <ESC>:tabprevious<CR>i
inoremap <silent> <C-PageDown> <ESC>:tabnext<CR>i

nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <S-ESC> :q!<CR>
inoremap <silent> <S-ESC> <ESC>:q!<CR>

hi TabLine cterm=underline ctermfg=LightBlue ctermbg=none
hi TabLineSel cterm=bold,underline ctermfg=White ctermbg=none
hi TabLineFill cterm=underline ctermfg=LightBlue ctermbg=none
set showtabline=1     "stal:  Display the tabbar if there are multiple tabs. Use :tab ball or invoke Vim with -p
"}}}

" Toggle Tag List
""nnoremap <silent> <C-f> :TlistToggle<CR>

" switch between windows, maximizing the current window
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_

" Press ESC to turn off highlighting and clear any message already displayed.
inoremap <silent> <F1> <ESC>:silent noh<CR>a
nnoremap <silent> <F1> <ESC>:silent noh<CR>

"{{{ folding 

" auto save/restore folds when file is saved or opened
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"hi Folded cterm=bold ctermfg=black ctermbg=yellow
"hi FoldColumn cterm=bold ctermfg=black ctermbg=yellow
"}}}

" Miscellaneous highlighting
"syntax match parens /[({})]/
"hi parens ctermfg=blue


"{{{ stuff i'm saving just in case

" omnicompletion menu colors
"hi Pmenu cterm=none ctermfg=Green ctermbg=none
"hi PmenuSel cterm=underline ctermfg=White ctermbg=none
"hi PmenuSbar cterm=bold ctermfg=none ctermbg=DarkBlue
"hi PmenuThumb cterm=bold ctermfg=none ctermbg=White


" map <C-h> :py EvaluateCurrentRange()

" python ctags
"set tags+=$HOME/.vim/tags/python.ctags

" syntax checking
"autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
"autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m


" auto-completion for functions
" inoremap ( ()<esc>:call BC_AddChar(")")<cr>i
"inoremap { {<cr>}<esc>:call BC_AddChar("}")<cr><esc>kA<cr>
" inoremap [ []<esc>:call BC_AddChar("]")<cr>i
" inoremap " ""<esc>:call BC_AddChar("\"")<cr>i
" jump out of parenthesis
"inoremap <C-j> <esc>:call search(BC_GetChar(), "W")<cr>a

"function! BC_AddChar(schar)
"  if exists("b:robstack")
"	    let b:robstack = b:robstack . a:schar
"  else
"	    let b:robstack = a:schar
"  endif
"endfunction

"function! BC_GetChar()
"  let l:char = b:robstack[strlen(b:robstack)-1]
"  let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
"  return l:char
"endfunction 

"vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
"nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
"vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")
"nnoremap <buffer> <silent> [] m':call search('^\s*endf*\%[unction]\>', "bW")
"vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
"nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
"vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
"nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
"vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")
"nnoremap <buffer> <silent> ][ m':call search('^\s*endf*\%[unction]\>', "W")
"vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
"nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")

" Session Management
"let s:vimHome = strpart(&rtp, 0, stridx(&rtp, ','))
"
"let s:sessionDir = s:vimHome . '/sessions'
"
"function! SaveSession()
"	" If there isn't a current session, ask for a filename
"	exec v:this_session != "" ? 
"		\":mks! ".escape(v:this_session,' ') : ":browse mks ".s:sessionDir."<CR>"
"endfunction
"
"" It has it's own function to call DrawSessionMenu() afterwards
"function! SaveSessionAs()
"	exec "browse mks ".s:sessionDir."<CR>"
"endfunction
"

"inoremap <silent> <buffer> . .<C-X><C-O>

""imap <silent> <expr> <buffer> <CR> pumvisible() ? "<CR><C-R>=(col('.')-1&&match(getline(line('.')), '\\.',
""      \ col('.')-2) == col('.')-2)?\"\<lt>C-X>\<lt>C-O>\":\"\"<CR>"
""      \ : "<CR>"
""set cinkeys=0{,0},0),:,0#,!^F,o,O,e
"set cinop
"set wildmode=list:longest,preview
" Setting examples:
" Don't use autocomplpop.
"let g:AutoComplPop_NotEnableAtStartup = 1
"" Use neocomplcache.
"let g:NeoComplCache_EnableAtStartup = 1
"" Use smartcase.
"let g:NeoComplCache_SmartCase = 1
"" Use previous keyword completion.
"let g:NeoComplCache_PreviousKeywordCompletion = 0
"" Use tags auto update.
"let g:NeoComplCache_TagsAutoUpdate = 1
"" Try keyword completion.
"	let g:NeoComplCache_TryKeywordCompletion = 0
"" Try default completion.
"	let g:NeoComplCache_TryDefaultCompletion = 1
"" Use preview window.
"let g:NeoComplCache_EnableInfo = 1
"" Delete keyword when rank is 0.
"let g:NeoComplCache_DeleteRank0 = 1
"" Use camel case completion.
"" let g:NeoComplCache_EnableCamelCaseCompletion = 1
"" Set minimum syntax keyword length.
"let g:NeoComplCache_MinSyntaxLength = 3
"" Set skip input time.
"let g:NeoComplCache_SkipInputTime = '0.1'
"
"" Define keyword.
"if !exists('g:NeoComplCache_KeywordPatterns')
"		let g:NeoComplCache_KeywordPatterns = {}
"endif
"let g:NeoComplCache_KeywordPatterns['default'] = '\v\h\w*'
"let g:NeoComplCache_SnippetsDir = $HOME.'/snippets'
" Plugin key-mappings.
"imap <silent><C-l>     <Plug>(neocomplcache_snippets_expand)
"smap <silent><C-l>     <Plug>(neocomplcache_snippets_expand)
"nmap <silent><C-e>     <Plug>(neocomplcache_keyword_caching)
"imap <expr><silent><C-e>     pumvisible() ? "\<C-e>" : "\<Plug>(neocomplcache_keyword_caching)"
" 
""let g:AutoComplPop_Behavior = { 
""\ 'c': [ {'command' : "\<C-x>\<C-o>",
""\       'pattern' : ".",
""\       'repeat' : 0}
""\      ]  
""\}
" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
"
" remapping to make omnicompletion easier
"inoremap <Nul> <C-x><C-o>
"map <expr> <C-Space> "\<C-x>\<C-o>"
""nnoremap <silent> <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>
""inoremap <expr> <cr> pumvisible()? "\<c-y>":"\<c-g>u\<cr>"
""inoremap <expr> j   pumvisible()?"\<C-N>":"j"
""inoremap <expr> k   pumvisible()?"\<C-P>":"k"
"}}}


