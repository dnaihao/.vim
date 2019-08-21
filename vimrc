" PATHOGEN PLUGIN MANAGEMENT
" execute Pathogen (must be on top of .vimrc file)
 execute pathogen#infect()
 filetype plugin indent on
 syntax on


" GENERAL SETTING
filetype plugin on
set backspace=indent,eol,start " set direction arrow and backspace
set nocompatible
set spell
set number " show line number
set title " set terminal title
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>i
:inoremap { {}<Esc>i
:inoremap " ""<Esc>i
:inoremap < <><Esc>i

"Custom commands have to start with upper case
function TexCompleteEnvironment(name)
	let line_number = line(".") - 1
        call append(line_number, "\\end{". a:name . "}")
        call append(line_number, "")
	call append(line_number, "\\begin{". a:name . "}")
	call cursor((line_number+2),1)
endfunction

command! -nargs=0 TexItemize call TexCompleteEnvironment("itemize")
command! -nargs=0 TexFigure call TexCompleteEnvironment("figure")
command! -nargs=0 TexCenter call TexCompleteEnvironment("center")
command! -nargs=0 TexTable call TexCompleteEnvironment("table")
" Use :itemize instead of using Texitemize
cnoreabbrev itemize TexItemize
cnoreabbrev figure TexFigure
cnoreabbrev center TexCenter
cnoreabbrev table TexTable


" AUTO COMPLETION is made available by YOUCOMPLETME


" LATEX SESSION
" latex preview plugin
 autocmd Filetype tex setl updatetime=1
 autocmd Filetype tex LLPStartPreview
 let g:livepreview_previewer = 'okular' " define the pdf viewer


" GIT BLAME

