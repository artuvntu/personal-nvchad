require "nvchad.options"

-- add yours here!
require "snippets.init"
require "configs.indentation"
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.filetype.add({
  extension = {
    bs = "brs",
  }
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.har",
  callback = function()
    vim.bo.filetype = "json"
  end,
})

