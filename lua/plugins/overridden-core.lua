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
        terminal_settings = {
          {
            event = "VimEnter",
            callback = function()
              vim.cmd "Neotree toggle"
            end,
          },
        },
      },
    },
  },
}
