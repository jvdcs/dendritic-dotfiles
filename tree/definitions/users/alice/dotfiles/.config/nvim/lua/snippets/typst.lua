local ls   = require("luasnip")
local s    = ls.snippet
local i    = ls.insert_node
local t    = ls.text_node
local sn   = ls.snippet_node
local rep  = require("luasnip.extras").rep
local d    = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local map  = vim.keymap.set

-- LuaSnip Setup
ls.config.set_config({
  enable_autosnippets  = true,
  store_selection_keys = "<Tab>",
})

-- LuaSnip Jump Keymaps
map({ "i", "s" }, "<Tab>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<Cmd>TypstarSmartJump<CR>", true, false, true), "n", false
    )
  end
end, { silent = true })

map({ "i", "s" }, "<S-Tab>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  else
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<Cmd>TypstarSmartJumpBack<CR>", true, false, true), "n", false
    )
  end
end, { silent = true })

-- Context
local MATH_NODES = {
  ["math"]             = true,
  ["equation"]         = true,
}

local IGNORE_NODES = {
  ["string"]           = true,
  ["string_content"]   = true,
  ["line_comment"]     = true,
  ["block_comment"]    = true,
}

local function in_math()
  local node = vim.treesitter.get_node()
  while node do
    if IGNORE_NODES[node:type()] then return false end
    if MATH_NODES[node:type()] then return true end
    node = node:parent()
  end
  return false
end

local function get_visual(_, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  end
  return sn(nil, i(1))
end

local function not_before_char()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local next_char = line:sub(col + 1, col + 1)
  
  if next_char == "" then return true end
  return next_char:match("[%s%)%]%}\"']") ~= nil
end

-- Factories
local function ms(trig, nodes, opts)
  return s(vim.tbl_extend("force", {
    trig = trig, snippetType = "autosnippet",
    condition = in_math, wordTrig = false,
  }, opts or {}), nodes)
end

local function ts(trig, nodes, opts)
  return s(vim.tbl_extend("force", {
    trig = trig, snippetType = "autosnippet",
    wordTrig = false,
  }, opts or {}), nodes)
end

-- Math & Text Snippets
ls.add_snippets("typst", {
  -- CUSTOM FUNCTIONS
  ts("spc", fmta("#h(<>fr)<>", { i(1), i(0) })),
  ts("-rf", fmta("#ref(<>)<>",  { i(1), i(0) })),
  ts("-nc", fmta("#anc(<>)<>",  { i(1), i(0) })),

  -- Spacing
  ms("ms", t("\\; ")),
  ms("ss", fmta([["<>"<>]], { i(1), i(0) })),

  -- Containers
  ts("aa",    fmta("$<>$",            { i(1) })),
  ts("ee",    fmta("_<>_<>",          { i(1), i(0) })),
  ts("dm",    fmta("$$\n<>\n$$",      { i(1) }), { wordTrig = true }),
  ts("fla",   fmta("$left\n<>\n$",    { i(1) })),
  ts("beg",   fmta("#<>[\n  <>\n]",   { i(1), i(0) })),
  ts("align", fmta("$ \n<>\n $",      { i(1) })),

  -- Matrices
  ms("pmat", fmta("mat(\n  <>\n)",               { i(1) })),
  ms("bmat", fmta([[mat(delim: "[", \n  <>\n)]], { i(1) })),
  ms("cas",  fmta("cases(\n  <>\n)",             { i(1) })),

  -- Logic
  ms("thus",  t("therefore ")),
  ms("qed",   t("& square")),
  ms("=>",    t("=> ")),
  ms("=v",    t("arrow.b.double ")),
  ms("=<",    t("<=")),
  ms("iff",   t("<=>")),
  ms("->",    t("->")),
  ms("!>",    t("|->")),
  ms("fa",    t("forall ")),
  ms("te",    t("exists ")),
  ms("st",    t("\" s.t. \"")),
  ms("notin", t("notin ")),
  ms("sub",  t("subset")),
  ms("sup",  t("supset")),
  ms("sor",  t("union")),
  ms("sand",  t("inter")),
  ms("eset",  t("emptyset")),
  ms("set",   fmta("{ <> }<>", { i(1), i(0) })),
  ms("\\\\\\",t("setminus")),

  -- Sets
  ms("NN", t("NN")), ms("ZZ", t("ZZ")),
  ms("QQ", t("QQ")), ms("RR", t("RR")),
  ms("CC", t("CC")),

  -- Operators
  ms("^",    fmta("^(<>)<>",        { i(1), i(0) })),
  ms("_",    fmta("_(<>)<>",        { i(1), i(0) })),
  ms("sqrt",   fmta("sqrt(<>)<>",     { i(1), i(0) })),
  ms("//",   fmta("frac(<>, <>)<>", { i(1), i(2), i(0) })),
  ms("ee",   fmta("e^(<>)<>",       { i(1), i(0) })),
  ms("invs", t("^(-1)")),
  ms("xx",   t("times ")),
  ms("**",   t("dot ")),
  ms("===",  t("equiv")),
  ms("!=",   t("!= ")),
  ms(">=",   t(">= ")),
  ms("<=",   t("<= ")),
  ms("simm", t("sim ")),
  ms("...",  t("...")),
  ms("c..",  t("dots.c")),
  ms("ooo",  t("oo")),

  -- Calculus
  ms("dif",  t("dif ")),
  ms("lim",  fmta("lim_(<> ->> <>) <>",              { i(1,"n"), i(2,"oo"), i(0) })),
  ms("sum",  fmta("sum_(<>=<>)^<> <>",               { i(1,"n"), i(2,"1"), i(3,"oo"), i(0) })),
  ms("prod", fmta("product_(<>=<>)^<> <>",           { i(1,"n"), i(2,"1"), i(3,"oo"), i(0) })),
  ms("int",  fmta("integral <> dif <> <>",           { i(1), i(2,"x"), i(0) })),
  ms("dint", fmta("integral_(<>)^(<>) <> dif <> <>", { i(1,"a"), i(2,"b"), i(3), i(4,"x"), i(0) })),
  ms("ddx",  fmta("frac(dif^<> <>, dif x^<>) <>",    { i(1), i(2), rep(1), i(0) })),
  ms("par",  fmta("frac(partial <>, partial <>) <>", { i(1,"y"), i(2,"x"), i(0) })),

  -- Trig
  ms("sin",   t("sin ")),   ms("cos",   t("cos ")),
  ms("tan",   t("tan ")),   ms("cot",   t("cot ")),
  ms("sec",   t("sec ")),   ms("csc",   t("csc ")),
  ms("asin",  t("arcsin ")),ms("acos",  t("arccos ")),
  ms("atan",  t("arctan ")),ms("sinh",  t("sinh ")),
  ms("cosh",  t("cosh ")),  ms("tanh",  t("tanh ")),
  ms("coth",  t("coth ")),
  ms("asinh", t("op(\"arsinh\") ")),
  ms("acosh", t("op(\"arcosh\") ")),
  ms("atanh", t("op(\"artanh\") ")),
  ms("ln",    t("ln ")),
  ms("log",   t("log ")),
  ms("exp",   t("exp ")),

  -- Greek
  ms("@a", t("alpha ")),   ms("@b", t("beta ")),
  ms("@g", t("gamma ")),   ms("@G", t("Gamma ")),
  ms("@d", t("delta ")),   ms("@D", t("Delta ")),
  ms("@e", t("epsilon ")), ms(":e", t("epsilon.alt ")),
  ms("@z", t("zeta ")),    ms("@h", t("eta ")),
  ms("@t", t("theta ")),   ms("@T", t("Theta ")),
  ms(":t", t("theta.alt ")),
  ms("@i", t("iota ")),    ms("@k", t("kappa ")),
  ms("@l", t("lambda ")),  ms("@L", t("Lambda ")),
  ms("@m", t("mu ")),      ms("@n", t("nu ")),
  ms("@p", t("pi ")),      ms("@r", t("rho ")),
  ms("@s", t("sigma ")),   ms("@S", t("Sigma ")),
  ms("@u", t("upsilon ")), ms("@U", t("Upsilon ")),
  ms("@f", t("phi ")),
  ms("@o", t("omega ")),   ms("@O", t("Omega ")),

  -- Accents
  ms("cal",   fmta("cal(<>)<>",             { i(1), i(0) })),
  ms("bar",   fmta("bar(<>)<>",             { i(1), i(0) })),
  ms("tilde", fmta("tilde(<>)<>",           { i(1), i(0) })),
  ms("vec",   fmta("vec(<>)<>",             { i(1), i(0) })),
  ms("avg",   fmta("angle.l <> angle.r <>", { i(1), i(0) })),
  ms("norm",  fmta("norm(<>) <>",           { i(1), i(0) })),
  ms("abs",   fmta("abs(<>) <>",            { i(1), i(0) })),

  -- Wrappers
  ts("(", { t("("), d(1, get_visual), t(")"), i(0) }, { condition = not_before_char }),
  ts("[", { t("["), d(1, get_visual), t("]"), i(0) }, { condition = not_before_char }),
  ts("{", { t("{"), d(1, get_visual), t("}"), i(0) }, { condition = not_before_char }),
  ts('"', { t('"'), d(1, get_visual), t('"'), i(0) }, { condition = not_before_char }),
})

-- Plot Snippet
ls.add_snippets("typst", {
  s({ trig = "plt", snippetType = "autosnippet" }, {
    t({
      "#lq.diagram(",
      "\twidth: 5cm,",
      "\theight: 5cm,",
      "\txlim: (0, 3),",
      "\tylim: (0, 3),",
      "\txaxis: (tick-distance: 1),",
      "\tyaxis: (tick-distance: 1),",
      "\txlabel: $x$,",
      "\tylabel: $y$,",
      "",
      "\tgrid: gray.transparentize(70%),",
      "",
      "\tlq.scatter(",
      "\t\t(",
    }),
    i(1, "0,"),
    t({ "),", "\t\t(" }),
    i(2, "0,"),
    t({ "),", "\t\tcolor: " }),
    i(3, "black"),
    t({ ",", "\t),", "\t" }),
    i(4),
    t({ "", ")" }),
  }),
}, { key = "typst-plt" })
