" vim:tabstop=2:shiftwidth=2:expandtab:foldmethod=marker:textwidth=79
" Zimwiki syntax file
" Author: Sören König <soeren-koenig@freenet.de>

" Quit if syntax file is already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version < 508
  command! -nargs=+ HiLink highlight link <args>
  command! -nargs=+ Hi highlight <args>
else
  command! -nargs=+ HiLink highlight def link <args>
  command! -nargs=+ Hi highlight def <args>
endif

syntax case ignore

syntax match  taskpaperComment "^.*$"
syntax match  taskpaperProject       /^.\+:\s*$/
syntax match  taskpaperLineContinue ".$" contained
syntax match  taskpaperListItem  "^\s*[-+]\s\+"
syntax match  taskpaperContext  "@[A-Za-z0-9_]\+"
syntax match  taskpaperDone "^\s*[-+]\s\+.*@[Dd]one.*$"

" Headers
syntax match ZimwikiHeader1 /^\s*=\{6}[^=]\+.*[^=]\+=\{6}\s*$/
syntax match ZimwikiHeader2 /^\s*=\{5}[^=]\+.*[^=]\+=\{5}\s*$/
syntax match ZimwikiHeader3 /^\s*=\{4}[^=]\+.*[^=]\+=\{4}\s*$/
syntax match ZimwikiHeader4 /^\s*=\{3}[^=]\+.*[^=]\+=\{3}\s*$/
syntax match ZimwikiHeader5 /^\s*=\{2}[^=]\+.*[^=]\+=\{2}\s*$/

" [[Links]]
syntax match ZimwikiLink /\[\[[^\[\]]\+\]\]/

" Bullet Lists
syntax match ZimwikiList /^\*\s.*/

" Checkbox Lists
syntax match ZimwikiCheckBox /\[ \]/
syntax match ZimwikiCheckBoxDone /\[\*\]/
syntax match ZimwikiCheckBoxFailed /\[x\]/

" **bold multiple words**
syntax match ZimwikiBold /\*\*[^*]\+\*\*/

"//italic multiple words//
syntax match ZimwikiItalic /\/\/[^/]\+\/\//

"__emphasis multiple words__
syntax match ZimwikiEmphasis /__[^_]\+__/

"''verbatim multiple words''
syntax region ZimwikiPre start=/^\s*'''/ end=/^\s*'''\s*$/ contains=@Spell

"~~strike through multiple words~~
syntax match ZimwikiDelText /\~\~[^~`]\+\~\~/

" _{subscript multiple words}
syntax match ZimwikiSubScript /_{[^_{}]\+}/

"^{superscript multiple words}
syntax match ZimwikiSuperScript /\^{[^^{}]\+}/

" List items
syntax match ZimwikiList /^\s*\%(\*\|-\)\s/

" Comments
execute 'syntax match ZimwikiComment /^\s*%%.*$/ contains=@Spell'

" Emoticons
syntax match ZimwikiEmoticons /\%((.)\|:[()|$@]\|:-[DOPS()\]|$@]\|;)\|:'(\)/

" todo items
syntax match ZimwikiTodo '/\C\%(TODO:\|DONE:\|STARTED:\|FIXME:\|FIXED:\|XXX:\)/'

" html tags
syntax match ZimwikiHTMLtag #\c</\?\%('.html_tags.'\)\%(\s\{-1}\S\{-}\)\{-}\s*/\?>#
syntax match ZimwikiBold #\c<b>.\{-}</b># contains=ZimwikiHTMLTag
syntax match ZimwikiItalic #\c<i>.\{-}</i># contains=ZimwikiHTMLTag
syntax match ZimwikiUnderline #\c<u>.\{-}</u># contains=ZimwikiHTMLTag

syntax sync fromstart

"highlighting for diverse groups
if &background == 'light'
  Hi ZimwikiHeader1 guifg=#aa5858 gui=bold ctermfg=DarkRed   term=bold cterm=bold
  Hi ZimwikiHeader2 guifg=#507030 gui=bold ctermfg=DarkGreen term=bold cterm=bold
  Hi ZimwikiHeader3 guifg=#1030a0 gui=bold ctermfg=DarkBlue  term=bold cterm=bold
  Hi ZimwikiHeader4 guifg=#103040 gui=bold ctermfg=Black     term=bold cterm=bold
  Hi ZimwikiHeader5 guifg=#505050 gui=bold ctermfg=Black     term=bold cterm=bold
else
  Hi ZimwikiHeader1 guifg=#e08090 gui=bold ctermfg=Red       term=bold cterm=bold
  Hi ZimwikiHeader2 guifg=#80e090 gui=bold ctermfg=Green     term=bold cterm=bold
  Hi ZimwikiHeader3 guifg=#6090e0 gui=bold ctermfg=Blue      term=bold cterm=bold
  Hi ZimwikiHeader4 guifg=#c0c0f0 gui=bold ctermfg=White     term=bold cterm=bold
  Hi ZimwikiHeader5 guifg=#e0e0f0 gui=bold ctermfg=White     term=bold cterm=bold
endif

Hi ZimwikiBold term=bold cterm=bold gui=bold
Hi ZimwikiItalic term=italic cterm=italic gui=italic
HiLink ZimwikiEmphasis Constant
HiLink ZimwikiCode PreProc
HiLink ZimwikiDelText Comment
HiLink ZimwikiSuperScript Macro
HiLink ZimwikiSubScript Macro
HiLink ZimwikiLink Underlined
HiLink ZimwikiList Identifier
HiLink ZimwikiCheckBox ZimwikiList
HiLink ZimwikiCheckBoxDone Exception
HiLink ZimwikiCheckBoxFailed Error
HiLink ZimwikiEmoticons Character
HiLink ZimwikiTodo Todo
HiLink ZimwikiComment Comment
HiLink ZimwikiHTMLtag SpecialKey

let b:current_syntax = "zimwiki"

delcommand HiLink
