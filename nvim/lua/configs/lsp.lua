local mason = require("mason")
local lsp_zero = require("lsp-zero")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local null_ls = require("null-ls")

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion

local function tsserver_lsp_setup()
  lspconfig.tsserver.setup({
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
    },
  })
end

local function lua_ls_lsp_setup()
  lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
end

lsp_zero.on_attach(function(_, bufnr)
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
  vim.keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
  vim.keymap.set("n", "<leader>d[", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
  vim.keymap.set("n", "<leader>d]", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
end)

lsp_zero.format_on_save({
  servers = {
    ["null-ls"] = { "javascript", "typescript", "lua" },
    ["lua_ls"] = { "lua" },
    ["tsserver"] = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  },
})

mason.setup({})

mason_lspconfig.setup({
  ensure_installed = {
    "tsserver",
    "eslint",
    "tailwindcss",
    "lua_ls",
  },
  handlers = {
    lsp_zero.default_setup,
    tsserver = tsserver_lsp_setup(),
    lua_ls = lua_ls_lsp_setup(),
  },
})

cmp.setup({
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

local sources = {
  code_actions.eslint,
  code_actions.spellcheck,
  completion.luasnip,
  diagnostics.eslint,
  diagnostics.luacheck,
  diagnostics.tsc,
  formatting.prettier,
  formatting.prismaFmt,
  formatting.stylua,
}

null_ls.setup({
  sources = sources,
})
