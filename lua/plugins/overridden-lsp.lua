return {
  {
    "AstroNvim/astrolsp",
    opts = {
      formatting = {
        -- control auto formatting on save
        format_on_save = {
          enabled = true, -- enable or disable format on save globally
          allow_filetypes = { -- enable format on save for specified filetypes only
            "go",
          },
          ignore_filetypes = {
            "markdown",
          },
        },
      },
    },
  },
}
