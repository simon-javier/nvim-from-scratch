return {
    {
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
        },
      lazy = false,
      build = ':TSUpdate',
      config = function()
          local treesitter = require('nvim-treesitter')
          treesitter.install({
              "c",
              "lua",
              "vim",
              "vimdoc",
              "query",
              "markdown",
              "markdown_inline"
          })
      end,
    }
}
