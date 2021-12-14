" Using Lua functions
nnoremap <leader>O <cmd>lua require("telescope.builtin").find_files{ find_command = { "rg", "--files", "--hidden", "--follow"} }<cr>
nnoremap <leader>o <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>t <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>f <cmd>lua require('telescope.builtin').live_grep()<cr>
