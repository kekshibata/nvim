local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.load_extension "project"

telescope.setup {
  defaults = {
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules/", "target/", "docs/", ".settings/" },

    mappings = {
      n = {
        ["<esc>"] = actions.close,
        ["q"] = actions.close,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,
      },
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
      },
    },
  },
}
