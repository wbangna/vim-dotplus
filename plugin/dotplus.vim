" Author: Jonatan Vela
"

if exists('g:dotplus_loaded')
	finish
endif

let g:dotplus_loaded = 1
let s:active = 0


function! s:dotplus(what)
	echo "dotplus " . a:what
	try
		while 1
			let c = getchar()
			if c == 46 " Period
				if a:what == ';'
					exec 'normal ;'
					exec 'normal .'
				elseif a:what == 'n'
					exec 'normal n'
					exec 'normal .'
				endif
			elseif c == 62 " Shift-Period
				if a:what == ';'
					exec 'normal ,'
					exec 'normal .'
				elseif a:what == 'n'
					exec 'normal N'
					exec 'normal .'
				endif
			elseif c == 27 " Escape
				break
			elseif c == 113 " Q
				break
			endif
			redraw
		endwhile
	catch /.*/
	endtry
	echo 'fin.'
endfunction


command! -nargs=0 DotPlusStartSemicolon call s:dotplus(';')
command! -nargs=0 DotPlusStartNext call s:dotplus('n')

