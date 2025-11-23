local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("comp", {
    t("@Composable"),
    t({"", "fun "}), i(1, "MyComposable"), t("("), i(2), t({") {", "\t"}),
    i(0),
    t({"", "}"}),
  }),
}
