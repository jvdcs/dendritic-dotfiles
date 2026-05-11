local ls   = require("luasnip")
local s    = ls.snippet
local i    = ls.insert_node
local t    = ls.text_node
local d    = ls.dynamic_node
local sn   = ls.snippet_node
local rep  = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

-- ── Context ───────────────────────────────────────────────────────────────────
local function in_math()
  local node = vim.treesitter.get_node()
  while node do
    if node:type() == "math" then return true end
    node = node:parent()
  end
  return false
end

-- Visual selection wrapper helper
local function get_visual(_, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  end
  return sn(nil, i(1))
end

-- ── Snippet factories ─────────────────────────────────────────────────────────
-- math-mode autosnippet (mA in latex-suite)
local function ms(trig, nodes, opts)
  return s(vim.tbl_extend("force", {
    trig = trig, snippetType = "autosnippet",
    condition = in_math, wordTrig = false,
  }, opts or {}), nodes)
end

-- text-mode autosnippet (tA)
local function ts(trig, nodes, opts)
  return s(vim.tbl_extend("force", {
    trig = trig, snippetType = "autosnippet",
    wordTrig = false,
  }, opts or {}), nodes)
end

-- ── Snippets ──────────────────────────────────────────────────────────────────
ls.add_snippets("typst", {

  -- ── Spacing ────────────────────────────────────────────────────────────────
  ms("ms",  t("\\; ")),
  ms("tx",  fmta([[ "<>" <>]], { i(1), i(0) })),

  -- ── Math containers (text mode) ────────────────────────────────────────────
  ts("$",  fmta("$<>$ ", { i(1) })),
  ts("dm",  fmta("$$\n<>\n$$", { i(1) }), { wordTrig = true }),
  ts("fla", fmta("$left\n<>\n$", { i(1) })),
  ts("beg", fmta("#<>[\n  <>\n]", { i(1), i(0) })),
  ts("align", fmta("$ \n<>\n $", { i(1) })),

  -- ── Matrices / cases (math) ────────────────────────────────────────────────
  ms("pmat",  fmta("mat(\n  <>\n)", { i(1) })),
  ms("bmat",  fmta([[mat(delim: "[", \n  <>\n)]], { i(1) })),
  ms("cas",   fmta("cases(\n  <>\n)", { i(1) })),

  -- ── Logic / Set theory ─────────────────────────────────────────────────────
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
  ms("sub=",  t("subseteq")),
  ms("sup=",  t("supseteq")),
  ms("eset",  t("emptyset")),
  ms("set",   fmta("{ <> }<>", { i(1), i(0) })),
  ms("orr",   t("union")),
  ms("\\\\\\",t("setminus")),

  -- ── Number sets ────────────────────────────────────────────────────────────
  ms("NN", t("NN")),
  ms("ZZ", t("ZZ")),
  ms("QQ", t("QQ")),
  ms("RR", t("RR")),
  ms("CC", t("CC")),

  -- ── Operators ──────────────────────────────────────────────────────────────
  ms("sr",   t("^2")),
  ms("cb",   t("^3")),
  ms("rd",   fmta("^(<>)<>", { i(1), i(0) })),
  ms("_",    fmta("_(<>)<>", { i(1), i(0) })),
  ms("sq",   fmta("sqrt(<>)<>", { i(1), i(0) })),
  ms("//",   fmta("frac(<>, <>)<>", { i(1), i(2), i(0) })),
  ms("ee",   fmta("e^(<>)<>", { i(1), i(0) })),
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

  -- ── Calculus ───────────────────────────────────────────────────────────────
  ms("lim",  fmta("lim_(<> ->> <>) <>",               { i(1,"n"), i(2,"oo"), i(0) })),
  ms("sum",  fmta("sum_(<>=<>)^<> <>",                { i(1,"n"), i(2,"1"), i(3,"oo"), i(0) })),
  ms("prod", fmta("product_(<>=<>)^<> <>",            { i(1,"n"), i(2,"1"), i(3,"oo"), i(0) })),
  ms("int",  fmta("integral <> dif <> <>",            { i(1), i(2,"x"), i(0) })),
  ms("dint", fmta("integral_(<>)^(<>) <> dif <> <>",  { i(1,"a"), i(2,"b"), i(3), i(4,"x"), i(0) })),
  ms("drx",  t("dif / (dif x) ")),
  ms("ddx",  fmta("frac(dif^<> <>, dif x^<>) <>",    { i(1), i(2), rep(1), i(0) })),
  ms("par",  fmta("frac(partial <>, partial <>) <>",  { i(1,"y"), i(2,"x"), i(0) })),

  -- ── Trig ───────────────────────────────────────────────────────────────────
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

  -- ── Greek ──────────────────────────────────────────────────────────────────
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

  -- ── Accents ────────────────────────────────────────────────────────────────
  ms("bar",   fmta("bar(<>)<>",              { i(1), i(0) })),
  ms("tilde", fmta("tilde(<>)<>",            { i(1), i(0) })),
  ms("vec",   fmta("vec(<>)<>",              { i(1), i(0) })),
  ms("avg",   fmta("angle.l <> angle.r <>",  { i(1), i(0) })),
  ms("norm",  fmta("norm(<>) <>",            { i(1), i(0) })),
  ms("abs",   fmta("abs(<>) <>",             { i(1), i(0) })),

  -- ── Visual wrappers (select text → Tab → trigger) ─────────────────────────
  ms("(",  { t("("), d(1, get_visual), t(")") }),
  ms("[",  { t("["), d(1, get_visual), t("]") }),
  ms("{",  { t("{"), d(1, get_visual), t("}") }),
})
