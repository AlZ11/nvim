vim.opt.expandtab = true    -- Converts your Tab key presses into raw spaces
vim.opt.shiftwidth = 4      -- Sets the size of auto-indents to 4 spaces
vim.opt.tabstop = 4         -- Makes existing Tab characters look like 4 spaces wide
vim.opt.softtabstop = 4     -- Makes backspacing delete 4 spaces at once like a real Tab
vim.opt.number = true          -- Turns on the line number column
vim.opt.relativenumber = true    -- Switches the column to relative numbering
require("config.lazy")

vim.opt.termguicolors = true
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '*' }, 
    callback = function()
        -- pcall (protected call) stops the error from crashing Neovim
        -- if a fake filetype like "startup" is detected.
        pcall(vim.treesitter.start)
    end,
})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false, -- Keeps your editor fast while typing
  severity_sort = true,
})