require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>cq", ":cclose<CR>", { desc = " Close quick list" })
map("n", "<leader>cl", ":lclose<CR>", { desc = " Close location list" })

map("n", "<leader>cp", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end, { desc = "Copy relative file path" })

map("n", "<leader>gh", "<cmd>Gitsighs next_hunk<cr>", { desc = "Go to next git hunk" })

-- map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
-- Xcode mappiing
map("n", "<leader>rxl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
map("n", "<leader>rxb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
map("n", "<leader>rxr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
map("n", "<leader>rxt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
map("n", "<leader>rxT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" })
map("n", "<leader>rX", "<cmd>XcodebuildPicker<cr>", { desc = "Show All Xcodebuild Actions" })
map("n", "<leader>rxd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
map("n", "<leader>rxp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
map("n", "<leader>rxc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
map("n", "<leader>rxC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show Code Coverage Report" })
map("n", "<leader>rxq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })

