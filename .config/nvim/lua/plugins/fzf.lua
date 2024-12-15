

vim.cmd[[
" Initialize configuration dictionary
let g:fzf_vim = {}
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']

" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_vim.preview_window = []

" fzf.vim needs bash to display the preview window.
" On Windows, fzf.vim will first see if bash is in $PATH, then if
" Git bash (C:\Program Files\Git\bin\bash.exe) is available.
" If you want it to use a different bash, set this variable.
"   let g:fzf_vim = {}
"   let g:fzf_vim.preview_bash = 'C:\Git\bin\bash.exe'
let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.5 } }
]]

return {
	{
		'junegunn/fzf.vim',

	},
	{
		'junegunn/fzf',
	}
}
