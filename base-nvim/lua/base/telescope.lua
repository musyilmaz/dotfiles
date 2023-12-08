local actions = require("telescope.actions")

require("telescope").setup({
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
      theme = "dropdown",
      layout_strategies = "center",
      layout_config = { width = 0.50 }
    },
    live_grep = {
      theme = "dropdown",
      layout_strategies = "center",
      layout_config = { width = 0.50 }
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      path_display = { truncate = 3 },
    }
  }
})

require("telescope").load_extension("file_browser")
require("telescope").load_extension("luasnip")
