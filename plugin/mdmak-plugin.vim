if exists("g:mdmak_loaded")
    finish
endif
let g:mdmak_loaded = 1

nmap <leader>ll :silent! call MdmakRender()<CR>

function! MdmakRender()
  let b:curr_file = expand('%:p')
  let b:output_path = fnamemodify(g:mdmak_plugin_dir, ':p') . '/rendered.html'
  let b:mdmak = fnamemodify(g:mdmak_executable, ':p')
  let b:python = fnamemodify(g:mdmak_python_executable, ':p')
  call system(b:mdmak . ' ' . b:curr_file . ' ' . b:output_path)
  call system(b:python . ' -m webbrowser -t file://' . b:output_path . ' > /dev/null 2>&1')
endfunction
