require("mason").setup({
  ui = { border = "rounded" },
})

local lsp = require("lsp-zero").preset({
  manage_nvim_cmp = {
    set_sources = "recommended",
    set_basic_mappings = true,
    set_extra_mappings = false,
    use_luasnip = true,
    set_format = true,
    documentation_window = true,
  },
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = true }

  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  vim.keymap.set("n", "<leader>go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
  vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  vim.keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  vim.keymap.set("n", "<leader>fd", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", opts)
  vim.keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
  vim.keymap.set("n", "<leader>g[", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
  vim.keymap.set("n", "<leader>g]", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
end)

lsp.set_sign_icons({
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "»",
})

lsp.ensure_installed({
  "lua_ls",
  "tsserver",
  "eslint",
  "tailwindcss",
})

lsp.format_mapping("<leader>fd", {
  format_opts = {
    async = true,
  },
  servers = {
    ["null-ls"] = { "javascript", "typescript", "lua" },
  },
})

lsp.format_on_save({
  servers = {
    ["null-ls"] = { "javascript", "typescript", "lua" },
    ["lua_ls"] = { "lua" },
    ["tsserver"] = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  },
})

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
require("lspconfig").tsserver.setup({
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
})

lsp.setup()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  -- preselect = "item",
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "menu", "abbr", "kind" },

    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = "λ",
        luasnip = "⋗",
        buffer = "Ω",
        path = "🖫",
        nvim_lua = "Π",
      }

      item.menu = menu_icon[entry.source.name]

      return item
    end,
  },
  mapping = {
    ["<cr>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp_action.luasnip_supertab(),
    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
  },
  sources = {
    { name = "nvim_lsp", keyword_length = 3 },
    { name = "buffer",   keyword_length = 3 },
    { name = "path" },
    { name = "luasnip",  keyword_length = 2 },
  },
})

---
-- null-ls
---

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.gitsigns,
  },
})
