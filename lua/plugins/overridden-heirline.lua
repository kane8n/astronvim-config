return {
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local status = require("astroui.status")

        opts.statusline = {
          -- statusline
          hl = { fg = "fg", bg = "bg" },
          status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
          status.component.git_branch(),
          status.component.separated_path {
            max_depth = 1000,
            path_func = status.provider.filename { modify = ":.:h" },
            separator = "/"
          },
          status.component.file_info {
            filename = {
              fallback = "Empty",
            },
            filetype = false,
            file_modified = false
          },
          status.component.git_diff(),
          status.component.diagnostics(),
          status.component.fill(),
          status.component.cmd_info(),
          status.component.fill(),
          status.component.lsp(),
          status.component.treesitter(),
          status.component.nav(),
          status.component.mode { surround = { separator = "right" } },
        }
      end
    },
}
