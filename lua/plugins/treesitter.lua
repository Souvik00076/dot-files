return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      local ensure_installed = {
        "cmake",
        "css",
        "gitignore",
        "http",
        "rust",
        "ron",
        "scss",
        "sql",
      }

      local installed = require("nvim-treesitter.config").get_installed("parsers")
      local not_installed = vim.tbl_filter(function(parser)
        return not vim.tbl_contains(installed, parser)
      end, ensure_installed)

      if #not_installed > 0 then
        require("nvim-treesitter").install(not_installed)
      end

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- MDX
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
