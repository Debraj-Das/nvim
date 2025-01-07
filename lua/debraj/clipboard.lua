-- clipboard for wsl setup
vim.cmd([[
let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
	augroup WSLYank
	autocmd!
	autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
	augroup END
endif

au BufNewFile,BufRead *.tex
	\ set nocursorline |
	\ set nornu |
	\ set number |
	\ let g:loaded_matchparen=1 |
]])
