return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
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

            lspconfig.lua_ls.setup({})
            lspconfig.tsserver.setup({
             filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
            })

            lspconfig.tsserver.setup({
                filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
                cmd = { "/run/current-system/sw/bin/typescript-language-server", "--stdio" },
                root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", ".git"), -- root detection
                on_attach = function(client)
                 client.server_capabilities.documentFormattingProvider = false -- disable formatting by tsserver, use prettier instead
                end,
            })

          -- Setup ESLint
            lspconfig.eslint.setup({
              on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = true
              end,
            })

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            end,
    }
}

