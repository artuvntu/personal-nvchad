local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("logaa", {
    t('NSString *arthur_log = [NSString stringWithFormat:@"ARTHUR '),
    i(1, "%@"),
    t('", '),
    i(2, "value"),
    t({"];", "printf(\"%s\\n\", [arthur_log UTF8String]);"}),
  }),
}
