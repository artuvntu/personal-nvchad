return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
        "kotlin",
        "brightscript",
        "lua",
        "swift",
        "objc",
        "typescript",
  		},
  	},
  },

  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      -- "nvim-tree/nvim-tree.lua", -- (optional) to manage project files
      "stevearc/oil.nvim", -- (optional) to manage project files
      -- "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
    },
    config = function()
      require("xcodebuild").setup({
        -- put some options here or leave it empty to use default settings
      })
    end,
    lazy = true, -- Enable lazy loading
    cmd = { "XcodeBuild", "XcodeClean", "XcodeRun", "XcodebuildPicker" }, -- Load when these commands are used
    ft = { "swift", "objective-c", "objective-cpp" }, -- Load for specific filetypes
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "wojciech-kulik/xcodebuild.nvim",
       "nvim-neotest/nvim-nio"
    },
    config = function()
      local xcodebuild = require("xcodebuild.integrations.dap")

      -- TODO: change it to your local codelldb path
      local codelldbPath = "/Users/arturoventura/Downloads/codelldb-darwin-arm64/extension/adapter/codelldb"

      xcodebuild.setup(codelldbPath)

      vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
      vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
      vim.keymap.set("n", "<leader>dt", xcodebuild.debug_tests, { desc = "Debug Tests" })
      vim.keymap.set("n", "<leader>dT", xcodebuild.debug_class_tests, { desc = "Debug Class Tests" })
      vim.keymap.set("n", "<leader>b", xcodebuild.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>B", xcodebuild.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })
      vim.keymap.set("n", "<leader>dx", xcodebuild.terminate_session, { desc = "Terminate Debugger" })
    end,
    lazy = true, -- Enable lazy loading
    cmd = { "XcodeBuild", "XcodeClean", "XcodeRun", "XcodebuildPicker" }, -- Load when these commands are used
    ft = { "swift", "objective-c", "objective-cpp" }, -- Load for specific filetypes
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", },
    lazy = true,
    config = function()
      require("dapui").setup({
        controls = {
          element = "repl",
          enabled = true,
        },
        floating = {
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        icons = { collapsed = "", expanded = "", current_frame = "" },
        layouts = {
          {
            elements = {
              { id = "stacks", size = 0.25 },
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            position = "left",
            size = 60,
          },
          {
            elements = {
              { id = "repl", size = 0.35 },
              { id = "console", size = 0.65 },
            },
            position = "bottom",
            size = 10,
          },
        },
        integrations = {
          pymobiledevice = {
            enabled = true,
          },
        }
      })

      local dap, dapui = require("dap"), require("dapui")

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "ojroques/nvim-bufdel",
    config = function()
      require("bufdel").setup {
        next = "alternate", -- Ir al buffer alternativo al cerrar uno
        quit = false,       -- No cerrar Neovim si este es el último buffer
      }
    end,
    lazy = false,
  },
  {
    "artuvntu/roku.vim",
    branch = "artuvntu/brighterscript",
    init = function ()
      vim.g.disableAutoFolding = 1
    end,
    ft = { "brs", "bs", "xml" }
  }
}
