local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local function recursive_arg(args, state)
	return sn(nil, {
		c(1, {
			sn(nil, {
				i(1, "arg"),
				d(2, recursive_arg, {}),
			}),
			sn(nil, {
				t('"'),
				i(1, "valor"),
				t('"'),
				d(2, recursive_arg, {}),
			}),
			t(""),
		}),
	})
end

local function smart_arg(args, state)
	return sn(nil, {
		c(1, {
			t(""),
			sn(nil, {
				t(", "),
				i(1, "arg"),
				d(2, smart_arg, {}),
			}),
			sn(nil, {
				t(', "'),
				i(1, "valor"),
				t('"'),
				d(2, smart_arg, {}),
			}),
		}),
	})
end

ls.add_snippets("all", {
	s("todo", {
		t({ "TODO: " }),
		i(1, "o que precisa ser feito"),
		t(" - "),
		f(function()
			return os.date("%d/%m/%Y")
		end),
		i(0),
	}),

	s("fixme", {
		t({ "FIXME(!): " }),
		i(1, "corrigir isso"),
		t(" ["),
		f(function()
			return os.date("%H:%M")
		end),
		t("]"),
		i(0),
	}),

	s("header", {
		t({ "---", "Author: " }),
		i(1, "Seu Nome"),
		t({ "", "Date: " }),
		f(function()
			return os.date("%Y-%m-%d")
		end),
		t({ "", "Description: " }),
		i(2, "breve descrição"),
		t({ "", "---", "" }),
		i(0),
	}),

	s("lorem", {
		t("Lorem ipsum dolor sit amet, consectetur adipiscing elit. "),
		i(0),
	}),

	s("fn", {
		i(1, "func"),
		t("("),
		c(2, {
			i(1, "arg"),
			sn(2, { t('"'), i(1, "valor"), t('"') }),
		}),
		d(3, smart_arg, {}),
		t(")"),
		i(0),
	}),
})
