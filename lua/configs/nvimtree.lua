local ok, local_cfg = pcall(dofile, vim.fn.getcwd() .. "/.nvimtree.lua")

local options = ok and local_cfg or {}

return vim.tbl_deep_extend("force", options, require("nvchad.configs.nvimtree"))
