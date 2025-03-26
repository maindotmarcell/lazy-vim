return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- Define common on_attach function
      local on_attach = function(_, bufnr)
        -- Buffer local mappings
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<space>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end

      -- Ensure required servers are installed
      require("mason").setup({
        ensure_installed = {
          "stylua",
          "shellcheck",
          "shfmt",
          "flake8",
          "eslint",
          "solhint",
        },
        automatic_installation = true,
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "pyright",
          "gopls",
          "lua_ls",
          "solidity_ls_nomicfoundation",
        },
        automatic_installation = true,
      })

      -- Configure LSP servers here
      lspconfig.pyright.setup({
        on_attach = on_attach,
      })

      lspconfig.gopls.setup({
        on_attach = on_attach,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })

      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              path = vim.split(package.path, ";"),
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      lspconfig.solidity_ls_nomicfoundation.setup({
        on_attach = on_attach,
        filetypes = { "solidity" },
        root_dir = lspconfig.util.root_pattern("hardhat.config.*", "foundry.toml", "remappings.txt", ".git"),
        settings = {
          solidity = {
            includePath = "",
            remappings = {
              ["@openzeppelin/"] = "lib/openzeppelin-contracts/",
              ["account-abstraction/"] = "lib/account-abstraction/",
            },
          },
        },
      })
      -- Let typescript.nvim handle TypeScript setup
      require("typescript").setup({
        server = {
          on_attach = on_attach,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
      })
    end,
  },

  {
    {
      "antosha417/nvim-lsp-file-operations",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-neo-tree/neo-tree.nvim",
      },
      config = function()
        require("lsp-file-operations").setup()
      end,
    },
  },
}
