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

map("n", "<leader>cP", function()
  local path = vim.fn.expand("%")
  local line = vim.fn.line(".")
  local path_with_line = path .. ":" .. line
  vim.fn.setreg("+", path_with_line)
  print("Copied: " .. path_with_line)
end, { desc = "Copy file path with line" })

map("n", "<leader>gh", "<cmd>Gitsigns next_hunk<cr>", { desc = "Go to next git hunk" })

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

map("n", "<leader>tw+", "<cmd>NvimTreeResize +50<cr>", { desc = "NvimTree increase width" })
map("n", "<leader>tw0", "<cmd>NvimTreeResize 30<cr>", { desc = "NvimTree reset width" })
