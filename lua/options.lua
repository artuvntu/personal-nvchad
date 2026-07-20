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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "yaml", "yml", "kotlin", "swift" },
  callback = function()
    vim.opt_local.foldmethod = "indent"
    vim.opt_local.foldlevel = 99
    vim.opt_local.foldenable = true
    vim.opt_local.foldlevelstart = 99

  end,
})

vim.api.nvim_create_user_command("OpenLink", function(opts)
  local candidate = opts.args ~= "" and opts.args or vim.fn.expand "<cfile>"
  local url = candidate:gsub("[%)%]%}>,;.!?]+$", "")

  if url == "" or not (url:match "^[%a][%w+.-]*://" or url:match "^mailto:") then
    vim.notify("No link found under cursor", vim.log.levels.WARN)
    return
  end

  local opener = vim.fn.has "macunix" == 1 and "open" or vim.fn.has "unix" == 1 and "xdg-open"

  if not opener then
    vim.notify("No system opener available for links", vim.log.levels.ERROR)
    return
  end

  vim.fn.jobstart({ opener, url }, { detach = true })
end, {
  nargs = "?",
  desc = "Open link under cursor or provided URL",
})
