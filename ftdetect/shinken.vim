" Shinken
autocmd BufRead,BufNewFile */shinken/*.cfg         set filetype=shinken
autocmd BufRead,BufNewFile */shinken/**/*.cfg      set filetype=shinken
autocmd BufRead,BufNewFile */shinken-user/**/*.cfg set filetype=shinken

" Nagios
autocmd BufRead,BufNewFile */*nagios*/*/*.cfg                 set filetype=shinken
autocmd BufRead,BufNewFile /*etc/nagios/*.cfg                 set filetype=shinken
autocmd BufRead,BufNewFile *groundwork/nagios/etc/*.cfg{,.in} set filetype=shinken
autocmd BufRead,BufNewFile /var/lib/nagios/objects.cache      set filetype=shinken

" Completion
autocmd Filetype shinken setlocal omnifunc=syntaxcomplete#Complete
