" NOTE: You must have jshint in your path.
"
" Install:
"
" On system with npm:
"   npm install jshint
"

" Location of jshint utility, change in vimrc i different
if !exists("g:jshintprg")
	let g:jshintprg="jshint"
endif

function! s:JSHint(cmd, args)
    redraw
    echo "JSHint ..."

    " If no file is provided, use current file 
    if empty(a:args)
        let l:fileargs = expand("%")
    else
        let l:fileargs = a:args
    end

    let grepprg_bak=&grepprg
    let grepformat_bak=&grepformat
    try
        let &grepprg=g:jshintprg
        let &grepformat="%f: line %l\\,\ col %c\\, %m"
        silent execute a:cmd . " " . l:fileargs
    finally
        let &grepprg=grepprg_bak
        let &grepformat=grepformat_bak
    endtry

    if len(getqflist()) > 1

      " has errors display quickfix win
      botright copen

      " close quickfix
      exec "nnoremap <silent> <buffer> q :ccl<CR>"

      " open in a new window 
      exec "nnoremap <silent> <buffer> o <C-W><CR>"

      " preview
      exec "nnoremap <silent> <buffer> go <CR><C-W><C-W>"

      redraw!

    else

      " no error, sweet!
      cclose
      redraw
      echo "JSHint: No errors"

    end
    

endfunction

command! -bang -nargs=* -complete=file JSHint call s:JSHint('grep<bang>',<q-args>)