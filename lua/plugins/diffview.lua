return {
  -- free <leader>gd from LazyVim's fzf-lua git_diff picker
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader>gd", false },
    },
  },

  -- real side-by-side diff view
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff (side-by-side)" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Git Diff" },
    },
  },
}
