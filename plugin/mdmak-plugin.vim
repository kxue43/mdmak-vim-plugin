if exists("g:loaded_mdmak")
    finish
endif
let g:loaded_mdmak = 1

"nmap <leader>ll :silent! call MdmakRender()<CR>
nmap <leader>ll :MdmakRender

" Exposes the plugin's functions for use as commands in Vim.
command! -nargs=0 MdmakRender call mdmak-plugin#MdmakRender()

