local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  s('entry:photo', {
    t { '---', 'title: ' },
    i(1, 'Untitled'),
    t { '', 'date: ' },
    f(function() return os.date '%Y-%m-%d' end, {}),
    t { '', 'location: ' },
    i(2),
    t { '', 'description: ' },
    i(3),
    t { '', 'cover: ' },
    i(4),
    t { '', 'coverPosition: ' },
    i(5, '50% 50%'),
    t { '', '---', '' },
    i(0),
  }),
}
