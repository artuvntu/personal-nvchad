local cmp = require "cmp"
local opts = require "nvchad.configs.cmp"

opts.completion = opts.completion or {}
opts.completion.completeopt = "menu,menuone,noinsert"
opts.completion.autocomplete = false

opts.preselect = cmp.PreselectMode.None

opts.mapping["<CR>"] = cmp.mapping.confirm {
  behavior = cmp.ConfirmBehavior.Insert,
  select = false,
}

opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    fallback()
  end
end, { "i", "s" })

opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  else
    cmp.complete()
  end
end, { "i", "s" })

opts.mapping["<C-Space>"] = cmp.mapping(function()
  cmp.complete()
end, { "i", "s" })

return opts
