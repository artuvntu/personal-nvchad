local ok_dap, dap = pcall(require, "dap")
if not ok_dap then
  return
end

local base_configs = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Node: Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
    runtimeExecutable = "node",
    console = "integratedTerminal",
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Node: Launch via npm script",
    cwd = "${workspaceFolder}",
    runtimeExecutable = "npm",
    runtimeArgs = function()
      local script = vim.fn.input("npm script: ", "start")
      return { "run", script }
    end,
    console = "integratedTerminal",
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Node: Launch built file",
    cwd = "${workspaceFolder}",
    program = function()
      return vim.fn.input("Program path: ", "${workspaceFolder}/dist/index.js", "file")
    end,
    runtimeExecutable = "node",
    console = "integratedTerminal",
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Node: Attach",
    cwd = "${workspaceFolder}",
    processId = require("dap.utils").pick_process,
  },
}

dap.configurations.javascript = base_configs
dap.configurations.javascriptreact = base_configs

dap.configurations.typescript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Node: Launch file (TS + source maps)",
    program = "${file}",
    cwd = "${workspaceFolder}",
    runtimeExecutable = "node",
    sourceMaps = true,
    outFiles = { "${workspaceFolder}/dist/**/*.js" },
    console = "integratedTerminal",
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Node: Launch via npm script (TS)",
    cwd = "${workspaceFolder}",
    runtimeExecutable = "npm",
    runtimeArgs = function()
      local script = vim.fn.input("npm script: ", "build")
      return { "run", script }
    end,
    sourceMaps = true,
    outFiles = { "${workspaceFolder}/dist/**/*.js" },
    console = "integratedTerminal",
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Node: Launch built file (TS)",
    cwd = "${workspaceFolder}",
    program = function()
      return vim.fn.input("Program path: ", "${workspaceFolder}/dist/index.js", "file")
    end,
    runtimeExecutable = "node",
    sourceMaps = true,
    outFiles = { "${workspaceFolder}/dist/**/*.js" },
    console = "integratedTerminal",
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Node: Attach (TS)",
    cwd = "${workspaceFolder}",
    processId = require("dap.utils").pick_process,
    sourceMaps = true,
    outFiles = { "${workspaceFolder}/dist/**/*.js" },
  },
}

dap.configurations.typescriptreact = dap.configurations.typescript

local package_root = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"
if vim.fn.isdirectory(package_root) == 0 then
  return
end

local debugger_cmd = package_root .. "/js-debug-adapter"
local debugger_path = package_root .. "/js-debug/src/dapDebugServer.js"

if vim.fn.filereadable(debugger_cmd) == 0 and vim.fn.filereadable(debugger_path) == 0 then
  return
end

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "8123",
  executable = {
    command = "/Users/arturoventura/.local/share/nvim/mason/bin/js-debug-adapter",
    args = {"8123"}
  },
}
