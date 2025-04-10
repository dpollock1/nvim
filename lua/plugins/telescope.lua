return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<C-p>', builtin.find_files, {})
            vim.keymap.set('n', '<Space><Space>', builtin.buffers, { noremap = true, silent = true, desc = "Buffers"})
            vim.keymap.set('n', '<C-f>', builtin.live_grep, { noremap = true, silent = true })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim"
    }
}
