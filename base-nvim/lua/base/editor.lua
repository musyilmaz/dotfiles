---
-- Mini align
---
local status_align, align = pcall(require, "mini.align")

if not status_align then
  print("mini.align plugin is not loaded!")
  return
end

align.setup()

---
-- Mini pairs
---
local pairs = require("mini.pairs")

pairs.setup({})

---
-- Surround
---
local surround = require("nvim-surround")

surround.setup({})

---
-- Lualine
---
local lualine = require("lualine")

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "tokyonight",
    globalstatus = true,
  },
})

---
-- Barbar
---
vim.g.barbar_auto_setup = false
local barbar = require("barbar")

barbar.setup({
  animation = true,
  auto_hide = false,
  tabpoages = true,
  clickable = true,
  focus_on_close = "right",
  icons = {
    buffer_index = true,
    button = "",
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
      [vim.diagnostic.severity.WARN] = { enabled = false },
      [vim.diagnostic.severity.INFO] = { enabled = false },
      [vim.diagnostic.severity.HINT] = { enabled = true },
    },
    gitsigns = {
      added = { enabled = true, icon = "+" },
      changed = { enabled = true, icon = "~" },
      deleted = { enabled = true, icon = "-" },
    },
    filetype = {
      custom_colors = true,
      enabled = true,
    },
  },
})

---
-- Neotree
---
local status_neo_tree, neo_tree = pcall(require, "neo-tree")

if not status_neo_tree then
  print("neo-tree plugin is not loaded!")
  return
end

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

neo_tree.setup({
  sources = {
    "filesystem",
    "buffers",
    "git_status",
  },
  source_selector = {
    winbar = true,
    statusline = false,
  },
  add_blank_line_at_top = false,
  close_if_last_window = true,
  hide_root_node = true,
  popup_border_style = "rounded",
})

---
-- Comment
---
local comment = require("Comment")

comment.setup({
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  padding = true,
  sticky = true,
})

---
-- Indent blankline
---
local indent_blankline = require("indent_blankline")

indent_blankline.setup({
  show_current_context = true,
  show_current_context_start = true,
})
