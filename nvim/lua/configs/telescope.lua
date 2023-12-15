local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { "node_modules", ".git" },
    mappings = {
      i = {
        ["<C-h>"] = actions.which_key,
      },
      n = {
        ["?"] = actions.which_key,
      },
    }
  },
  pickers = {
    find_files = {
      layout_strategies = "center",
      layout_config = { width = 0.50 }
    },
    live_grep = {
      layout_strategies = "center",
      layout_config = { width = 0.50 }
    },
  },
})

telescope.load_extension("file_browser")
telescope.load_extension("luasnip")
