local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

lsp_installer.setup {
  ensure_installed = {
    "bashls",
    "cmake",
    "cssls",
    "cssmodules_ls",
    "dockerls",
    "eslint",
    "golangci_lint_ls",
    "gopls",
    "grammarly",
    "graphql",
    "html",
    "jsonls",
    "quick_lint_ls",
    "tsserver",
    "sumneko_lua",
    "zk",
    "prismals",
    "jedi_language_server",
    "pyright",
    "pylsp",
    "stylelint_lsp",
    "tailwindcss",
    "lemminx",
    "yamlls"
  },
  automatic_installation = true
}

lspconfig.sumneko_lua.setup {}
lspconfig.jsonls.setup {}
lspconfig.zk.setup {}
