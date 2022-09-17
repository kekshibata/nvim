local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup {
  debug = true,
  sources = {
    diagnostics.eslint,
    formatting.prettier.with {
      extra_filetypes = { "toml", "solidity" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    formatting.black.with { extra_args = { "--fast" } },
    diagnostics.flake8.with { extra_args = { "--config=.flake8" } },
    formatting.stylua,
    code_actions.eslint_d,
    diagnostics.editorconfig_checker,
  },
}
