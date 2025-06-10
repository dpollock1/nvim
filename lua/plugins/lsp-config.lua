return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
        "hrsh7th/cmp-nvim-lsp",
         {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
              library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
              },
            },
          },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = cmp_nvim_lsp.default_capabilities()

            lspconfig.lua_ls.setup({capabilities = capabilities})
            lspconfig.ts_ls.setup({
               filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
               capabilities = capabilities,
            })

            lspconfig.ts_ls.setup({
                filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
                cmd = { "/run/current-system/sw/bin/typescript-language-server", "--stdio" },
                root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", ".git"), -- root detection
                on_attach = function(client)
                 client.server_capabilities.documentFormattingProvider = false -- disable formatting by tsserver, use prettier instead
                end,
                capabilities = capabilities,
            })

         -- Pyright LSP setup for Python
            lspconfig.pyright.setup({
                on_attach = function(client)
                    -- You can customize further here for Pyright, e.g., for formatting or linting
                    client.server_capabilities.documentFormattingProvider = true
                end,
                capabilities = capabilities,
            })

          -- Setup ESLint
            lspconfig.eslint.setup({
              on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = true
              end,
              capabilities = capabilities,
            })

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            end,
    }
}

