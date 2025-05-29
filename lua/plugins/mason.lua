return {
    -- Mason plugin to manage LSP, linters, and other tools
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    -- Mason LSP config integration
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            -- Automatically install LSP servers
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "pyright"},  -- List the servers you want to install
                automatic_installation = true,  -- Automatically install missing LSPs
            })
        end,
    },
}
