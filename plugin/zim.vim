" vim:tabstop=2:shiftwidth=2:expandtab:foldmethod=marker:textwidth=79
" Vim global plugin for inserting Zim style header
" Last Change: 2011 Dec 19
" Maintainer: Sören König <soeren-koenig@freenet.de> 

if exists("g:loaded_zim") || &cp
  finish
endif
let g:loaded_zim = 1
let s:keepcpo = &cpo
set cpo&vim

" ------------------------------------------------------------------------------
" Function to insert a header in the Zim wiki style
"
 function! InsertZimHeader()
    let curr_date=strftime('%F', localtime())
    let curr_time=strftime('%T', localtime())
    let title=strftime('%A, %d. %B %Y', localtime())
    exec "normal! ggiContent-Type: text/x-zim-wiki\<CR>Wiki-Format: zim 0.4\<CR>Creation-Date: ".curr_date."T".curr_time."\<CR>\<CR>==== ".title." ====\<CR>" 
 endfunction

" ------------------------------------------------------------------------------
" Key mapping to insert a Zim Wiki header 
"
map <silent> <unique> <script> <C-T><C-Z> :call InsertZimHeader()<CR>

" Abbreviation, wich calls the same function
" 
iab zimhead <ESC>:call InsertZimHeader()<CR>i

" ------------------------------------------------------------------------------
let &cpo= s:keepcpo
unlet s:keepcpo

