-- Enable the following language servers
local lsp_servers = {
  "pyright",
  "lua_ls",
}

-- Setup neovim lua configuration
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = lsp_servers,
      automatic_installation = true,
    },
    config = function()
      local lspconfig = require("lspconfig")

      require("mason-lspconfig").setup_handlers({
        function(server)
          -- See :help lspconfig-setup
          lspconfig[server].setup({})
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            settings = {
              diagnostics = {
                globals = { "vim" },
              },
              library = vim.api.nvim_get_runtime_file("", true),
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          })
        end,
        ["pyright"] = function()
          lspconfig.pyright.setup({
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "off",
                },
              },
            },
          })
        end,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      -- Diagnostic keymaps
      { "[d",        vim.diagnostic.goto_prev,  desc = "Go to previous diagnostic message" },
      { "]d",        vim.diagnostic.goto_next,  desc = "Go to next diagnostic message" },
      { "<leader>e", vim.diagnostic.open_float, desc = "Open floating diagnostic message" },
      { "<leader>q", vim.diagnostic.setloclist, desc = "Open diagnostics list" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_defaults = lspconfig.util.default_config

      local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if not cmp_ok then
        return
      end
      lsp_defaults.capabilities =
          vim.tbl_deep_extend("force", lsp_defaults.capabilities, cmp_nvim_lsp.default_capabilities())

      require("plugins.lsp.handlers")
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
