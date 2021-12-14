set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline
set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set number
set mouse=a
set clipboard=unnamedplus
set laststatus=2
set noshowmode
set ts=2 sw=2 sts=2 et
set cursorline
set cursorcolumn
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set inccommand=nosplit
retab!

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.config/nvim/undo

"""""""""" VIM SETTINGS
" set tabstop=2 shiftwidth=2 expandtab

noremap <Up> <Nop>
noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

" Optimize JS/TS scan
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

set completeopt=menuone,noselect

augroup filetypedetect
   au! BufReadPre,BufReadPost,BufRead,BufNewFile *.erb setfiletype eruby.html
   au! BufReadPre,BufReadPost,BufRead,BufNewFile *.feature setfiletype cucumber
   au! BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
filetype plugin on

let g:python_host_prog  = '/usr/bin/python'
let g:python2_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
Plug 'simrat39/symbols-outline.nvim'
" A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'SmiteshP/nvim-gps'
Plug 'folke/lsp-colors.nvim'
" Markups
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
" vimspector - A multi language graphical debugger for Vim
" Plug 'puremourning/vimspector'
" Tabs, as understood by any other editor.
Plug 'romgrk/barbar.nvim'
Plug 'TaDaa/vimade'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-cucumber'
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
Plug 'kyazdani42/nvim-web-devicons'
" https://github.com/folke/trouble.nvim
" Plug 'folke/trouble.nvim'


Plug 'misterbuckley/vim-definitive'
Plug 'prettier/vim-prettier', {
         \ 'do': 'yarn install',
         \ 'branch': 'release/0.x'
         \ }
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'autozimu/LanguageClient-neovim', {
         \ 'branch': 'next',
         \ 'do': 'bash install.sh',
         \ }
" A collection of common configurations for Neovim's built-in language server client.
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'williamboman/nvim-lsp-installer'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'winston0410/cmd-parser.nvim'
Plug 'winston0410/range-highlight.nvim'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'glepnir/dashboard-nvim'
Plug 'sindrets/diffview.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-tree.lua'
" This is a simple plugin that helps to end certain structures automatically.
Plug 'tpope/vim-endwise'
Plug 'nvim-lualine/lualine.nvim'
" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'
" This plugin adds indentation guides to all lines (including empty lines).
Plug 'lukas-reineke/indent-blankline.nvim'
" Plugin for vim to enable opening a file in a given line
Plug 'bogado/file-line'
" nvim-scrollview is a Neovim plugin that displays interactive vertical scrollbars. The plugin is customizable (see :help scrollview-configuration).
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }

" THEMES
Plug 'rockerBOO/boo-colorscheme-nvim'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'marko-cerovac/material.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'ful1e5/onedark.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'rafamadriz/neon'
Plug 'folke/twilight.nvim'
Plug 'tpope/vim-fugitive'

" REACTJS PLUGINS
" Plug 'pangloss/vim-javascript'
" Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'jparise/vim-graphql'
call plug#end()

" GITGUTTER 
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '❆'
let g:gitgutter_sign_removed = '✖'
let g:gitgutter_grep = 'rg'

source ~/.config/nvim/plugins/barbar.vim

" LSP SAGA SETTINGS
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

" NVIM LSP SETTINGS
let g:LanguageClient_serverCommands = {
         \ 'ruby': ['~/.asdf/shims/solargraph', 'stdio'],
         \ }

" ROOTER SETTINGS "
let g:rooter_patterns = ['.git/', 'package.json', 'Gemfile']

colorscheme github_dimmed
" Background transparent
" hi Normal guibg=NONE ctermbg=NONE

"""""""""" DASHBOARD ETTINGS
let g:dashboard_default_executive = 'telescope'
let g:dashboard_session_directory = '~/.config/nvim/sessions'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

" NVIMTree settings
luafile ~/.config/nvim/lua/_nvimtree.lua
source ~/.config/nvim/plugins/nvim-tree.vim

" Telescope SETTINGS
luafile ~/.config/nvim/lua/_telescope.lua
source ~/.config/nvim/plugins/telescope.vim

" STALINE/STABLINE SETTINGS
luafile ~/.config/nvim/lua/_lualine.lua

" NVIM LSP
luafile ~/.config/nvim/lua/_nvim-lsp.lua

luafile ~/.config/nvim/lua/lsp-settings.lua

luafile ~/.config/nvim/lua/_indentline.lua

luafile ~/.config/nvim/lua/_tree.lua

" luafile ~/.config/nvim/lua/_gitsigns.lua

luafile ~/.config/nvim/lua/_treesitter.lua

luafile ~/.config/nvim/lua/_nvim_cmp.lua

" Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing.
luafile ~/.config/nvim/lua/_twilight.lua

luafile ~/.config/nvim/lua/_nvim-gps.lua

luafile ~/.config/nvim/lua/_colorizer.lua

luafile ~/.config/nvim/lua/_range-highlite.lua

luafile ~/.config/nvim/lua/_symbols_outline.lua

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
