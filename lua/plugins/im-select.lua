return {
  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup {
        default_im_select = "com.google.inputmethod.Japanese.Roman",
        default_command = "im-select",
      }
    end,
  },
}
