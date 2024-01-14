return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      commands = {
        -- Copy filename including relative path
        copy_file_name = function(state)
          local node = state.tree:get_node()
          local full_path = node.path
          local relative_path = full_path:sub(#state.path + 2)
          vim.fn.setreg("*", relative_path, "c")
        end,
      },
      window = {
        mappings = {
          ["Y"] = "copy_file_name",
        },
      },
    },
  },
}
