-- [[ Autocommands ]]
--
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- autocmd("ColorScheme", {
--   pattern="*",
--   callback = function()
--     vim.api.nvim_set_hl(0, "Normal", { ctermbg=NONE })   
--     vim.api.nvim_set_hl(0, "NonText", { ctermbg=NONE })   
--   end,
-- })

-- go to last loc when opening a buffer
local generalGrp = augroup("General", { clear = true })
autocmd("BufReadPost", {
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
  group = generalGrp,
})

-- don't auto comment new line
autocmd("BufEnter", {
  command = [[set formatoptions-=cro]],
  group = generalGrp,
})

-- windows to close with "q"
local quickCloseGrp = augroup("QuickClose", { clear = true })
autocmd("FileType", {
  pattern = { "help", "startuptime", "qf", "fugitive", "null-ls-info", "dap-float" },
  command = [[nnoremap <buffer><silent> q :close<CR>]],
  group = quickCloseGrp,
})
autocmd("FileType", {
  pattern = "man",
  command = [[ nnoremap <buffer><silent> q :quit<CR> ]],
  group = quickCloseGrp,
})

-- Enable spell checking for certain file types
-- autocmd( { "BufRead", "BufNewFile" }, {
--   pattern = { "*.txt", "*.md", "*.tex" },
--   callback = function()
--     vim.o.spell = true
--     vim.o.spelllang = "en,nl"
--   end,
--   group = generalGrp,
-- })

-- vim: ts=2 sts=2 sw=2 et
