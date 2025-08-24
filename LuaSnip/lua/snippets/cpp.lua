
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local tail = {
    "", "    return 0;",
    "}"
}

local header = {
    "#include <iostream>", "",
    "using namespace std;", "",
    "typedef long long ll;", "",
    "int main() {", "",
    "    ",
}

-- Define a snippet for Lua
ls.add_snippets("cpp", {
    s("cses", {
        t(header),
        i(1, "int n; cin >> n;"),
        t(tail),
    }),
})
