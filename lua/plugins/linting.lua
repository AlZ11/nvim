return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Assign clang-tidy to C and C++
    lint.linters_by_ft = {
      c = { "clangtidy" },
      cpp = { "clangtidy" },
    }

    -- Trigger linting on save and when entering insert/normal mode
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}