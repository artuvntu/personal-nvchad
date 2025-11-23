local ls = require("luasnip")  -- Importa LuaSnip
local s = ls.snippet           -- Atajo para crear un snippet
local t = ls.text_node         -- Nodo de texto
local i = ls.insert_node       -- Nodo de inserción

-- Agregar snippets personalizados
return {
    s("logaa", { -- Disparador: logaa
        t('print("ARTHUR '), i(1), t('")')
    }),
}

