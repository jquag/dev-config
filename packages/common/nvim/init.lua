-----------------------
-- bootstrap lazy.nvim
-----------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
  end
end
vim.opt.rtp:prepend(lazypath)

--------------
-- leader key
--------------
vim.g.mapleader = ','

require('core.globals').config()
require('core.options').config()
require('core.mappings').config()
require('core.autocommands').config()
require('custom')

-----------
-- plugins
-----------
require("lazy").setup(
  {
    {
      import = "plugins",
    },
  }
)

---------------
-- code fences
---------------
vim.g.markdown_fenced_languages = {
  "ts=typescript",
}
