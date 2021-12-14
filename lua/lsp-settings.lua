USER = vim.fn.expand('$USER')

local nvim_lsp = require('lspconfig')
-- local on_attach = function(_, bufnr)
--   return require('completion').on_attach
-- end
local handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true
    }
  )
}

--- SUMNEKO SETTINGS
local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
  sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lua-language-server"
  sumneko_binary = "/Users/" .. USER .. "/.config/nvim/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
  sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
  sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
else
  print("Unsupported system for sumneko")
end

--- SORBET SETUP
nvim_lsp.sorbet.setup{
  root_dir = nvim_lsp.util.root_pattern("Gemfile"),
}
nvim_lsp.sumneko_lua.setup{
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
      }
    }
  }
}
--- SOLARGRAPH SETTINGS
local capabilities = vim.lsp.protocol.make_client_capabilities()
nvim_lsp.solargraph.setup {
  cmd = {
    "solargraph",
    "stdio"
  },
  filetypes = {
    "ruby"
  },
  flags = {
    debounce_text_changes = 150
  },
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern(".","Gemfile"),
  capabilities = capabilities,
  handlers = handlers,
  settings = {
    solargraph = {
      autoformat = true,
      completion = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true
    }
  }
}

--- ROME SETTINGS
nvim_lsp.rome.setup{
  settings = {
    runtime = {
      path = '/home/ahara/.asdf/shims/rome'
    }
  }
}
