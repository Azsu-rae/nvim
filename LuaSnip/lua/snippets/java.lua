
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local header = {
    "String s = \""
}

local mid = {
    "\"",
    "throw new IllegalArgumentException(format(s"
}

local tail = {
    "));"
}

-- Define a snippet for Lua
ls.add_snippets("java", {
    s("badarg", {
        t(header),
        i(1),
        t(mid),
        i(2),
        t(tail),
    }),
})
