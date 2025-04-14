return {
  -- add nvim-lint
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Define the tslint linter
    lint.linters.tslint = {
      cmd = "tslint",
      args = { "--format", "json" },
      ignore_exitcode = true,
      parser = function(output, bufnr)
        local diagnostics = {}
        if output == "" then
          return diagnostics
        end

        local decoded = vim.json.decode(output)
        if not decoded then
          return diagnostics
        end

        for _, failure in ipairs(decoded) do
          table.insert(diagnostics, {
            lnum = failure.startPosition.line,
            col = failure.startPosition.character,
            end_lnum = failure.endPosition.line,
            end_col = failure.endPosition.character,
            message = failure.failure,
            code = failure.ruleName,
            severity = vim.diagnostic.severity.WARN,
          })
        end

        return diagnostics
      end,
    }

    lint.linters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint", "tslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint", "tslint" },
      solidity = { "solhint" },
    }
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>cl", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
