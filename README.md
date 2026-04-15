**This repo is supposed to be used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

# Artuvntu fork

Suggested mason modules

"lua-language-server"
"vim-luaguage-server"
"js-debug-adapter"
"stylua"
"tree-sitter-cli"
"brighterscript"
"kotlin-language-server"

Homebrew dependencies

rust
codesnap
imagemagick

Get current mason packages intalled

lua print(vim.inspect(require("mason-registry").get_installed_package_names()))

Lazy.nvim lockfile workflow

- Use :Lazy restore to install exact versions from lazy-lock.json (no updates).
- Avoid :Lazy sync when you want to keep lazy-lock.json unchanged.
