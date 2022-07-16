local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
  return
end

local autotag_status, autotag = pcall(require, "nvim-ts-autotag")
if not autotag_status then
  return
end

autopairs.setup {
  disable_filetype = { "TelescopePrompt", "vim" },
  map_c_h = true,
}

autotag.setup { disable = { "xml" } }
