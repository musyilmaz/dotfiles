local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {
    "dockerfile",
    "go",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "prisma",
    "python",
    "regex",
    "rust",
    "scss",
    "tsx",
    "typescript",
    "yaml"
  },
  sync_install = false,
  ignore_install = { "" },
  autopairs = { enable = true },
  autotag = { enable = true },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false
  }
}
