--[[
O is the global options object

Formatters and linters should be
filled in as strings with either
a global executable or a path to
an executable
]] -- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
O.colorscheme = 'palenight'
O.timeoutlen = 100
O.leader_key = ' '

O.plugin.indent_line.active = true

O.dashboard.custom_header = {
    '              ^                      ', --
    '             /|\\                    ', --
    '            //|\\\\                  ', --
    '           ///|\\\\\\                ', --
    '          ////|\\\\\\\\              ', --
    '         /////|\\\\\\\\\\            ', --
    '        //////|\\\\\\\\\\\\          ', --
    '       ///////|\\\\\\\\\\\\\\        ', --
    '      ////////|\\\\\\\\\\\\\\\\      ', --
    '     /////////|\\\\\\\\\\\\\\\\\\    ', --
    '    //////////|\\\\\\\\\\\\\\\\\\\\  ', --
    '     \'////////|\\\\\\\\\\\\\\\\\'   ', --
    '       \'//////|\\\\\\\\\\\\\'       ', --
    '         \'////|\\\\\\\\\'           ', --
    '           \'//|\\\\\'               ', --
    '             \'|\'                   ' --
}
