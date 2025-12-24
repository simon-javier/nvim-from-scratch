return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = {
                        {
                            'branch',
                            on_click = function(c, l, r)
                                vim.cmd 'G'
                            end,
                        },
                        'diff',
                        'diagnostics',
                    },
                    lualine_c = { { 'filename', path = 4 } },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
            }
        end,
    },
}
