local cmd = vim.cmd
local opt = vim.opt
local fn = vim.fn

-- init autocmd
cmd "autocmd!"

-- cmd("scriptencoding utf-8")
cmd "syntax enable"
cmd "set nocompatible"
cmd "set noswapfile"
opt.number = true
opt.relativenumber = true
opt.fileencodings = { "utf-8", "sjis", "euc-jp", "latin" }
opt.encoding = "utf-8"
opt.title = true
opt.autoindent = true
opt.background = "dark"
cmd "set nobackup"
opt.hlsearch = true
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.scrolloff = 10
opt.expandtab = true
opt.shell = "fish"
opt.backupskip = { "/tmp/*", "/private/tmp/*" }

if fn.has "nvim" then
  opt.inccommand = "split"
end

cmd "set t_BE="
opt.lazyredraw = true
opt.path:append "**"
opt.tabstop = 2
opt.shiftwidth = 2
opt.wrap = false
opt.signcolumn = "yes"
opt.ignorecase = true
opt.smartcase = true
opt.smarttab = true
opt.ai = true
opt.si = true
opt.wildignore:append "*/node_modules/*"

-- cmd "autocmd InsertLeave * set no paste"

opt.formatoptions:append "r"

-- Highlight
opt.cursorline = true
cmd "highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40"
cmd "highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000"

cmd "augroup BgHighlight"
cmd "autocmd!"
cmd "autocmd WinEnter * set cul"
cmd "autocmd WinLeave * set nocul"
cmd "augroup END"

-- true color
if fn.exists "&termguicolors" and fn.exists "&winblend" then
  cmd "syntax enable"
  opt.termguicolors = true
  opt.winblend = 0
  opt.wildoptions = "pum"
  opt.pumblend = 5
  opt.background = "dark"
  -- Use NeoSolarized
--  vim.g.neosolarized_termtrans = 1
--  cmd "runtime ./colors/NeoSolarized.vim"
--  cmd "colorscheme NeoSolarized"
  cmd "runtime ./colors/molokai.vim"
  cmd "colorscheme molokai"
--  cmd "runtime ./colors/256_noir.vim"
--  cmd "colorscheme 256_noir"

end
