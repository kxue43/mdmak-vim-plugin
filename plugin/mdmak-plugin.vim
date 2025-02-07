if exists("g:mdmak_loaded")
    finish
endif
let g:mdmak_loaded = 1

nmap <leader>ll :silent! call MdmakRender()<CR>

function! MdmakRender()
  let b:curr_file = expand('%:p')
  let b:output_path = g:mdmak_plugin_dir . '/rendered.html'
  call system(g:mdmak_executable . ' ' . b:curr_file . ' ' . b:output_path)
  call system('open -a "' . g:mdmak_browser . '" ' . b:output_path)
endfunction
