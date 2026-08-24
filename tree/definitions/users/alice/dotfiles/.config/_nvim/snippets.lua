local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta

local function in_math()
	local cur = vim.api.nvim_win_get_cursor(0)
	local lines = vim.api.nvim_buf_get_lines(0, 0, cur[1], false)
	table.insert(lines, vim.api.nvim_get_current_line():sub(1, cur[2]))
	local n = 0
	for _, l in ipairs(lines) do
		for _ in l:gsub("\\%$", ""):gmatch("%$") do
			n = n + 1
		end
	end
	return n % 2 == 1
end

local function ms(trig, nodes, opts)
	return s(
		vim.tbl_extend("force", {
			trig = trig,
			snippetType = "autosnippet",
			condition = in_math,
			wordTrig = false,
		}, opts or {}),
		nodes
	)
end

local function ts(trig, nodes, opts)
	return s(
		vim.tbl_extend("force", {
			trig = trig,
			snippetType = "autosnippet",
			wordTrig = false,
		}, opts or {}),
		nodes
	)
end

-- ==========================================
-- 4. SNIPPETS DEFINITIONS
-- ==========================================
ls.add_snippets("typst", {

	-- CUSTOM FUNCTIONS
	ts("spc", fmta("#h(<>)<>", { i(1), i(0) })),

	-- Containers
	ms("ss", fmta([["<>"<>]], { i(1), i(0) })),
	ts("aa", fmta("$<>$", { i(1) })),
	ts("bb", fmta("*<>*", { i(1) })),
	ms("ee", fmta("_<>_<>", { i(1), i(0) })),

	-- Logic
	ms("=>", t("=>")),
	ms("=v", t("arrow.b.double ")),
	ms("=<", t("<=")),
	ms("iff", t("<=>")),
	ms("->", t("->")),
	ms("!>", t("|->")),
	ms("fa", t("forall")),
	ms("te", t("exists")),
	ms("notin", t("notin")),
	ms("sub", t("subset")),
	ms("sup", t("supset")),
	ms("sor", t("union")),
	ms("sand", t("inter")),
	ms("eset", t("emptyset")),
	ms("\\\\\\", t("setminus")),

	-- Sets
	ms("NN", t("NN")),
	ms("ZZ", t("ZZ")),
	ms("QQ", t("QQ")),
	ms("RR", t("RR")),
	ms("CC", t("CC")),

	-- Operators
	ms("+-", t("plus.minus")),
	ms("-+", t("plus.minus")),
	ms("^", fmta("^(<>)<>", { i(1), i(0) })),
	ms("_", fmta("_(<>)<>", { i(1), i(0) })),
	ms("//", fmta("frac(<>, <>)<>", { i(1, "a"), i(2, "b"), i(0) })),
	ms("ee", fmta("e^(<>)<>", { i(1), i(0) })),
	ms("eq", fmta("<> &= <> \\ \n<>", { i(1, "a"), i(2, "b"), i(0) })),
	ms("===", t("equiv")),

	-- Calculus
	ms("dif", t("dif ")),
	ms("lim", fmta("lim_(<> ->> <>) <>", { i(1, "n"), i(2, "oo"), i(0) })),
	ms("sum", fmta("sum_(<>=<>)^<> <>", { i(1, "n"), i(2, "1"), i(3, "oo"), i(0) })),
	ms("prod", fmta("product_(<>=<>)^<> <>", { i(1, "n"), i(2, "1"), i(3, "oo"), i(0) })),
	ms("int", fmta("integral <> dif <> <>", { i(1), i(2, "x"), i(0) })),
	ms("dint", fmta("integral_(<>)^(<>) <> dif <> <>", { i(1, "a"), i(2, "b"), i(3), i(4, "x"), i(0) })),
	ms("der", fmta("frac(dif <>, dif <>)<>", { i(1), i(2), i(3) })),
	ms("par", fmta("frac(partial <>, partial <>) <>", { i(1, "y"), i(2, "x"), i(0) })),
}, { key = "typst" })
