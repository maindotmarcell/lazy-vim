return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- Load the plugin before saving
    cmd = { "ConformInfo" }, -- Enable ConformInfo command
    opts = {
      notify_on_error = true,
      log_level = vim.log.levels.DEBUG,
      formatters_by_ft = {
        ["*"] = { "trim_whitespace" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        go = { "gofumpt", "goimports" },
      },
      formatters = {
        gofumpt = {
          command = "gofumpt",
        },
        goimports = {
          command = "goimports",
        },
        prettier = {
          options = {
            arrow_parens = "always",
            bracket_spacing = true,
            bracket_same_line = false,
            embedded_language_formatting = "auto",
            end_of_line = "lf",
            html_whitespace_sensitivity = "css",
            jsx_single_quote = false,
            print_width = 80,
            prose_wrap = "preserve",
            quote_props = "as-needed",
            semi = true,
            single_quote = false,
            tab_width = 2,
            trailing_comma = "es5",
            use_tabs = false,
          },
        },
      },
    },
  },
}
