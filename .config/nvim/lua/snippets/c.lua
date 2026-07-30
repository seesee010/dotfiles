local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local main_snippet = s("main", {
  t({ "#include <stdio.h>", "", "int main(int argc, char *argv[]) {", "\t" }),
  i(1, "return 0;"),
  t({ "", "}" }),
})

ls.add_snippets("c", { main_snippet })
