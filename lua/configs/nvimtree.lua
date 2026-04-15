local ok, local_cfg = pcall(dofile, vim.fn.getcwd() .. "/.nvimtree.lua")

local options = ok and local_cfg or {}

local overrides = {
  view = {
    width = {
      min = 30,
      max = -1,
      padding = 1,
    },
  },
  renderer = {
    full_name = true,
    group_empty = true,
  },
}

return vim.tbl_deep_extend("force", require("nvchad.configs.nvimtree"), overrides, options)
