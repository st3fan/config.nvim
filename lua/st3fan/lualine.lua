
require('lualine').setup({
    options = {
        theme = 'auto',
        icons_enabled = false,
        section_separators = '', component_separators = ''
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {'diagnostics', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
})
