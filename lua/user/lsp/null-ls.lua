local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end
-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = {
    diagnostics.eslint,
    formatting.prettierd,
    formatting.black.with { extra_args = { "--fast" } },
    diagnostics.flake8.with { extra_args = { "--config=.flake8" } },
    formatting.stylua,
    code_actions.eslint_d,
    diagnostics.editorconfig_checker,
  },

  on_attach = function(client, bufnr)
    if client.name == "sumneko_lua" then
      client.server_capabilities.documentFormattingProvider = false
    elseif client.name == "tsserver" then
      client.server_capabilities.documentFormattingProvider = false
    end
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
}
