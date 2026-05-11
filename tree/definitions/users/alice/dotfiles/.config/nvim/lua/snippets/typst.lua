local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local function in_math()
  local node = vim.treesitter.get_node()
  while node do
    if node:type() == "math" then return true end
    node = node:parent()
  end
  return false
end

ls.add_snippets("typst", {
  s({ trig = "int", snippetType = "autosnippet", condition = in_math, wordTrig = false },
    fmta("integral_(<>)^(<>) <> dif <>", { i(1,"0"), i(2,"oo"), i(3,"f(x)"), i(4,"x") })
  ),
  s({ trig = "sum", snippetType = "autosnippet", condition = in_math, wordTrig = false },
    fmta("sum_(<>)^(<>) <>", { i(1,"i=0"), i(2,"oo"), i(3,"a_i") })
  ),
  s({ trig = "lim", snippetType = "autosnippet", condition = in_math, wordTrig = false },
    fmta("lim_(<> ->> <>) <>", { i(1,"x"), i(2,"oo"), i(3,"f(x)") })
  ),
})
