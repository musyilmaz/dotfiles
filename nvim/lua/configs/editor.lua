local nvimTree = require("nvim-tree")
local nvimTreeApi = require("nvim-tree.api")
local trouble = require("trouble")
local align = require("mini.align")
local pairs = require("mini.pairs")
local surround = require("nvim-surround")
local lualine = require("lualine")
local barbar = require("barbar")

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

-- helper functions
local function open_nvim_tree()
  nvimTreeApi.tree.open()
end

local function floating_nvim_tree_config()
  local screen_w = vim.opt.columns:get()
  local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
  local window_w = screen_w * WIDTH_RATIO
  local window_h = screen_h * HEIGHT_RATIO
  local window_w_int = math.floor(window_w)
  local window_h_int = math.floor(window_h)
  local center_x = (screen_w - window_w) / 2
  local center_y = ((vim.opt.lines:get() - window_h) / 2)
      - vim.opt.cmdheight:get()
  return {
    border = 'rounded',
    relative = 'editor',
    row = center_y,
    col = center_x,
    width = window_w_int,
    height = window_h_int,
  }
end

local function getFloatingNvimTreeWidth()
  return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
end

nvimTree.setup({
  view = {
    float = {
      enable = true,
      open_win_config = floating_nvim_tree_config
    },
    width = getFloatingNvimTreeWidth,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false
  }
})

-- Start neovim with nvim tree open
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Automatically open the file upon creation
nvimTreeApi.events.subscribe(nvimTreeApi.events.Event.FileCreated, function(file)
  vim.cmd("edit " .. file.fname)
end)


-- Trouble
trouble.setup({
  position = "bottom",
  height = 10,
  width = 50,
  icons = true,
  mode = "workspace_diagnostics",
  fold_open = "",
  fold_closed = "",
  group = true,
  padding = true,
  action_keys = {
    close = "q",
    cancel = "<esc>",
    refresh = "r",
    jump = { "<cr>", "<tab>" },
    jump_close = { "o" },
    open_split = { "<c-x>" },
    open_vsplit = { "<c-v>" },
    open_tab = { "<c-t>" },
    toggle_mode = "m",
    toggle_preview = "P",
    hover = "K",
    preview = "p",
    close_folds = { "zM", "zm" },
    open_folds = { "zR", "zr" },
    toggle_fold = { "zA", "za" },
    previous = "k",
    next = "j"
  },
  indent_lines = true,
  auto_open = false,
  auto_close = false,
  auto_preview = true,
  auto_fold = false,
  auto_jump = { "lsp_definitions" },
  signs = {
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "﫠"
  },
  use_diagnostic_signs = false
})

align.setup()
pairs.setup()
surround.setup()
lualine.setup({
  options = {
    icons_enables = true,
    theme = "tokyonight",
    globalstatus = true
  }
})

vim.g.barbar_auto_setup = false
barbar.setup({
  animation = true,
  auto_hide = false,
  tabpages = true,
  clickable = true,
  focus_on_close = "right",
  icons = {
    buffer_index = true,
    button = '',
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
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
      custom_colors = false,
      enabled = true,
    },
    separator = { left = '▎', right = '' },
    separator_at_end = true,
    modified = { button = '●' },
    pinned = { button = '', filename = true },
    preset = 'default',
    alternate = { filetype = { enabled = false } },
    current = { buffer_index = true },
    inactive = { button = '×' },
    visible = { modified = { buffer_number = false } },
  },
})
