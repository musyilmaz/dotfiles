local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local status_ok_config, lspconfig = pcall(require, "lspconfig")
if not status_ok_config then
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
  }
}

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  if server.name == "sumneko_lua" then
    lspconfig.sumneko_lua.setup {
      require "config.lsp.settings.sumneko_lua",
      on_attach = require "config.lsp.handlers".on_attach,
      capabilities = require "config.lsp.handlers".capabilities
    }
  end

  if server.name == "jsonls" then
    lspconfig.sumneko_lua.setup {
      require "config.lsp.settings.jsonls",
      on_attach = require "config.lsp.handlers".on_attach,
      capabilities = require "config.lsp.handlers".capabilities
    }
  end

  lspconfig[server.name].setup {
    on_attach = require "config.lsp.handlers".on_attach,
    capabilities = require "config.lsp.handlers".capabilities
  }
end


