return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    "rafamadriz/friendly-snippets",
    {
      "zbirenbaum/copilot-cmp",
      dependencies = { "zbirenbaum/copilot.lua" },
    },
  },
  config = function()
    -- Copilot: only provide completions via cmp, not inline suggestions/panels
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
    require("copilot_cmp").setup()

    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      snippet = {
        expand = function(args)
          -- REQUIRED: configure your snippet engine here, e.g. luasnip
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "copilot", group_index = 2 },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol",
          max_width = 50,
          symbol_map = { Copilot = "" },
        }),
      },
    })
  end,
}
