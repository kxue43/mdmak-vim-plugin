if exists("g:kxshowmd_loaded")
    finish
endif
let g:kxshowmd_loaded = 1

nmap <leader>ll :silent! call KXShowmdRender()<CR>

function! KXShowmdRender()
  let b:curr_file = expand('%:p')
  call system('toolkit-show-md ' . b:curr_file)
endfunction
