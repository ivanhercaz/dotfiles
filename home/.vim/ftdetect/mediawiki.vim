if has("autocmd")
  au BufRead,BufNewFile *.mw             set filetype=mediawiki 
  au BufRead,BufNewFile *.wiki           set filetype=mediawiki
  au BufRead,BufNewFile *.mediawiki      set filetype=mediawiki
endif
