return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- vim options can be configured here
      options = {
        opt = { -- vim.opt.<key>
          relativenumber = false, -- sets vim.opt.relativenumber
        },
      },
      autocmds = {
        neotree_autostart = {
          {
            event = "VimEnter",
            desc = "Open Neo-tree on startup",
            callback = function()
              -- gh-dashなどから --cmd で無効化できるようにする
              if vim.g.no_neotree then return end
              vim.cmd "Neotree show"
            end,
          },
        },
      },
    },
  },
}
