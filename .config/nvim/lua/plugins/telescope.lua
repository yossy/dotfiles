return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>/",
      function()
        require("telescope.builtin").live_grep({ cwd = false })
      end,
      desc = "Grep (cwd)",
    },
  },
}
