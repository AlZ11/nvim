return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    -- Initialize the auto-pairing engine
    require("nvim-autopairs").setup({
      check_ts = true, -- Uses treesitter to avoid pairing in strings/comments
    })

    -- Hook auto-pairs into your nvim-cmp setup
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    
    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done()
    )
  end,
}