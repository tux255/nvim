local telescope = require'telescope'

telescope.setup({
  file_ignore_patterns = {"node_modules/"},
  defaults = {
    layout_config = {
      horizontal = {
        height = 0.9,
        preview_cutoff = 120,
        prompt_position = "bottom",
        width = 0.9
      },
    },
  },
})

telescope.load_extension('dap')
