return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "python",
      })
    end,
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
    },
    setup = {
      pyright = function()
        require("lazyvim.util").on_attach(function(client, buffer)
          if client.name == "pyright" then
            -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          end
        end)
      end,
    },
    dependencies = {
      {
        "mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "pyright")
        end,
      },
    },
  },

  -- linting / formatting
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      table.insert(opts.sources, null_ls.builtins.formatting.black)
      table.insert(opts.sources, null_ls.builtins.diagnostics.ruff)
      table.insert(opts.sources, null_ls.builtins.diagnostics.mypy)
    end,
    dependencies = {
      {
        "mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "ruff")
          table.insert(opts.ensure_installed, "mypy")
          table.insert(opts.ensure_installed, "black")
        end,
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "debugpy")
        end,
      },
    },
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local dap = require("dap")
      local path = "~/.local/share/LazyVim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(".venv/bin/python")
    end,
  },

  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-go",
    },
    opts = {
      adapters = {
        ["neotest-go"] = {
          -- Here we can set options for neotest-go, e.g.
          -- args = { "-tags=integration" }
        },
      },
    },
  },
}
