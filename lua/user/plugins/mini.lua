return {
    {
        'nvim-mini/mini.pairs',
        version = '*',
        opts = {},
    },
    {
        'nvim-mini/mini.surround',
        version = '*',
        opts = {
            mappings = {
                add = '<leader>Sa',       -- Add surrounding in Normal and Visual modes
                delete = '<leader>Sd',    -- Delete surrounding
                find = '<leader>Sf',      -- Find surrounding (to the right)
                find_left = '<leader>SF', -- Find surrounding (to the left)
                highlight = '<leader>Sh', -- Highlight surrounding
                replace = '<leader>Sr',   -- Replace surrounding
            }
        },
    },
}
