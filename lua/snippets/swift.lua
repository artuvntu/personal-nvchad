local ls = require("luasnip")  -- Importa LuaSnip
local s = ls.snippet           -- Atajo para crear un snippet
local t = ls.text_node         -- Nodo de texto
local f = ls.function_node     -- Nodo de functio
local i = ls.insert_node       -- Nodo de inserción
local rep = require("luasnip.extras").rep

-- Agregar snippets personalizados
return {
  s("logaa", { -- Disparador: logaa
    t('print("ARTHUR '), i(1), t('")')
  }),
  s("swift_header", {
    t("//"),
    t({"","//  "}),
    f(function() return vim.fn.expand("%:t") end),
    t({"","// "}),
    i(1, "app"),
    t({"","//"}),
    t({"","// Created by Arturo Ventura on "}),
    f(function () return os.date("%d/%m/%y") end),
    t({""}),
    t({"", "// Copyright © "}),
    f(function () return os.date("%Y") end),
    t(""),
    t(" "),
    rep(1),
    t(", Inc, All right reserved."),
    t({"", "//"}),
    t({"", ""}),
    t({"", ""}),
  })
}

