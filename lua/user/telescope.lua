local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local builtin = require "telescope.builtin"
local actions = require "telescope.actions"
local fb_actions = require("telescope").extensions.file_browser.actions

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
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["n"] = {
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd "startinsert"
          end,
        },
      },
    },
  },
}

-- load extentions
telescope.load_extension "project"
telescope.load_extension "file_browser"

local center_list = require("telescope.themes").get_dropdown {
  winblend = 20,
  width = 0.8,
  prompt = " ",
  results_height = 15,
  previewer = false,
}

-- setting telescope keymaps
vim.keymap.set("n", ";f", function()
  builtin.find_files {
    no_ignore = false,
    hidden = true,
  }
end)

vim.keymap.set("n", ";r", function()
  builtin.live_grep()
end)

vim.keymap.set("n", ";t", function()
  builtin.help_tags()
end)

vim.keymap.set("n", ";b", function()
  builtin.buffers()
end)

vim.keymap.set("n", ";e", function()
  local opts = {
    path = "%:p:h",
    cwd = vim.fn.expand "%:p:h",
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    initial_mode = "normal",
    layout_config = { height = 40 },
  }
  opts = vim.tbl_deep_extend("force", center_list, opts)
  telescope.extensions.file_browser.file_browser(opts)
end)
