""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
au FileType python set shiftwidth=4 tabstop=4 expandtab


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])

""""""""""""""""""""""""""""""
" => C/C++ section
"""""""""""""""""""""""""""""""
" Find functionname
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
au FileType c map f :call ShowFuncName() <CR>
au FileType cpp map f :call ShowFuncName() <CR>

" List all functions

fun! ShowAllFuncName()
  exec "!ctags -x --c-kinds=f % | awk '{print $1 \" : \" $3 }'"
endfun

au FileType c map F :call ShowAllFuncName() <CR>
au FileType cpp map F :call ShowAllFuncName() <CR>

""""""""""""""""""""""""""""""
" => GitCommit section
"""""""""""""""""""""""""""""""
au FileType gitcommit set tw=78

""""""""""""""""""""""""""""""
" => Markdown section
"""""""""""""""""""""""""""""""
" Prefer my Markdown neatly wrapped
au FileType markdown set tw=78
