local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local f = ls.function_node

local function make_assignments(args)
	local header = (args[1][1] or "") .. (args[2][1] or "")
	local assignments = {}

	header = header:gsub("%s+", "")

	for part in header:gmatch("([^,]+)") do
		local var = part:match("([^:]+)")

		if var and var ~= "" and var ~= "self" then
			table.insert(assignments, "    self." .. var .. " = " .. var)
		end
	end

	if #assignments == 0 then
		return { "        pass" }
	end
	return assignments
end

local function py_args(args, state)
	return sn(nil, {
		c(1, {
			t(""), -- Encerrar
			sn(nil, {
				t(", "),
				i(1, "arg"),
				c(2, {
					sn(nil, { t(": "), i(1, "type") }),
					t(""),
				}),
				d(3, py_args, {}),
			}),
		}),
	})
end

ls.add_snippets("python", {
  -- Init com boilerplate
	s("init", {
		t("def __init__(self"),
		i(1),
		d(2, py_args, {}),
		t({ "):", "" }),
		f(make_assignments, { 1, 2 }),
		i(0),
	}),

	-- Main block
	s("main", {
		t({ 'if __name__ == "__main__":', "    main()" }),
		i(0),
	}),

	-- F-String Choice Node (Versátil)
	s("ss", {
		c(1, {
			sn(nil, { t('f"'), i(1), t('"') }),
			sn(nil, { t('"'), i(1), t('"') }),
			sn(nil, { t("'"), i(1), t("'") }),
		}),
	}),

	-- Compreensão de lista
	s("lc", {
		i(1, "item"),
		t(" for "),
		i(2, "item"),
		t(" in "),
		i(3, "iterable"),
		c(4, {
			t(""), -- Sem condição
			sn(nil, { t(" if "), i(1, "condition") }), -- Com condição
		}),
		i(0),
	}),

	-- Retorno Condicional (Ternário)
	s("return", {
		i(1, "val_true"),
		t(" if "),
		i(2, "condition"),
		t(" else "),
		i(3, "val_false"),
		i(0),
	}),

	-- IF com opção de ELSE ou ELIF
	s("if", {
		t("if "),
		i(1, "condition"),
		t({ ":", "    " }),
		i(2, "pass"),
		c(3, {
			t(""), -- Só o if
			sn(nil, { t({ "", "else:", "    " }), i(1, "pass") }), -- If/Else
			sn(nil, { t({ "", "elif " }), i(1, "condition"), t({ ":", "    " }), i(2, "pass") }), -- If/Elif
		}),
		i(0),
	}),

	-- FOR com opção de enumerate
	s("for", {
		t("for "),
		c(1, {
			sn(nil, { i(1, "item") }), -- Básico
			sn(nil, { i(1, "idx"), t(", "), i(2, "item") }), -- Com índice
		}),
		t(" in "),
		c(2, {
			i(1, "iterable"),
			sn(nil, { t("enumerate("), i(1, "iterable"), t(")") }), -- Enumerate automático
		}),
		t({ ":", "    " }),
		i(3, "pass"),
		i(0),
	}),

	s("match", {
		t("match "),
		i(1, "variable"),
		t({ ":", "    case " }),
		i(2, "pattern"),
		t({ ":", "        " }),
		i(3, "pass"),
		t({ "", "    case _:", "        " }),
		i(0, "pass"),
	}),
})
