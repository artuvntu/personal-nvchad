# AGENTS.md

This repository is a personal NvChad-based Neovim configuration.
Primary goal: keep startup time minimal and only add tools as needed.
Before adding any plugin or external dependency, ask the user.
All install commands must be run by the user, not by agents.
Any new dependency must be documented in `README.md`.

## Repository Overview

- Main entry: `init.lua` bootstraps lazy.nvim and loads NvChad.
- Local config modules live in `lua/` and `lua/configs/`.
- Plugins are declared in `lua/plugins/init.lua`.
- Formatting is configured via `conform.nvim` and `stylua`.

## Cursor/Copilot Rules

- No Cursor rules found in `.cursor/rules/` or `.cursorrules`.
- No Copilot instructions found in `.github/copilot-instructions.md`.

## Build, Lint, Test Commands

There is no repo-level build, lint, or test runner configured.
Use the following commands and editor actions where applicable:

- Format Lua: `stylua lua` (or `stylua .` if needed)
- Neovim plugin sync (manual, by user): `nvim +":Lazy sync" +qa`
- Neovim health check: `nvim +":checkhealth" +qa`

Single test guidance:

- No automated test suite is configured in this repo.
- For Swift/iOS projects opened inside Neovim, use the Xcodebuild
  plugin commands from within the editor, for example:
  - `:XcodebuildTest` (run tests)
  - `:XcodebuildTestClass` (single test class)

## Performance and Plugin Policy

- Startup time is the highest priority.
- Do not add plugins or new dependencies without explicit approval.
- Prefer minimal configuration and lazy loading wherever possible.
- Avoid eager-loading plugins that are not essential on startup.
- Any dependency that is not auto-installed by lazy.nvim or Neovim
  must be listed in `README.md` with install steps.

## External Dependencies

Documented in `README.md` (keep in sync):

- Suggested Mason packages:
  - `lua-language-server`
  - `vim-luaguage-server`
  - `stylua`
  - `tree-sitter-cli`
  - `brighterscript`
  - `kotlin-language-server`
- Homebrew dependencies:
  - `rust`
  - `codesnap`

If you add a new tool or language server:

- Ask first.
- Do not run installs.
- Update `README.md` with exact steps and commands.

## Formatting Rules (Lua)

Formatting is enforced by `stylua` using `.stylua.toml`:

- Indent: 2 spaces (no tabs)
- Max line width: 120
- Line endings: Unix
- Quotes: prefer double quotes
- Call parentheses: omit when possible (Stylua `None`)

Prefer auto-formatting via `conform.nvim` using `stylua`.

## Lua Code Style

- Follow NvChad module patterns for consistency.
- Use `require "nvchad.options"` and `require "nvchad.mappings"`
  as the base, then extend with local config.
- Use `local` for variables and functions.
- Keep functions short and focused.
- Prefer `vim.keymap.set` for mappings.
- Keep mapping descriptions (`desc`) short and descriptive.

## Imports and Module Structure

- Keep module `require` calls at the top of the file.
- Use absolute module paths relative to `lua/`.
- Example: `require "configs.lspconfig"`
- Avoid circular dependencies across config modules.

## Naming Conventions

- Files: lowercase with underscores when needed.
- Modules: mirror file names (`lua/configs/lspconfig.lua`).
- Functions: `snake_case` or `lowerCamelCase` consistent with existing
  file style.
- Keymaps: use leader prefixes that align with existing mappings.

## Error Handling and Diagnostics

- Prefer early returns and guard clauses.
- Check for required dependencies before configuring plugins.
- Avoid throwing errors during startup; degrade gracefully.
- Use `vim.notify` only when necessary and avoid spam.

## LSP and Tooling

- LSP config lives in `lua/configs/lspconfig.lua`.
- Use `vim.lsp.config` and `vim.lsp.enable` as shown.
- Add new servers to the `servers` list and enable explicitly.
- Ensure server names match Mason or upstream naming.

## Plugin Configuration

- All plugin specs live in `lua/plugins/init.lua`.
- Prefer lazy loading with `cmd`, `ft`, `keys`, or `event`.
- Avoid loading heavy plugins on startup.
- Keep `dependencies` explicit and minimal.
- If a plugin requires a build step, document it in `README.md`.

## Snippets and Filetypes

- Snippet setup is in `lua/snippets/`.
- Filetype additions live in `lua/options.lua`.
- For new filetypes, add `vim.filetype.add` or autocmds as needed.

## Notes for Agentic Changes

- Do not run installation commands; provide them to the user.
- Ask before adding plugins or external tooling.
- Keep changes small and focused.
- Maintain fast startup and minimal runtime overhead.
- Update `README.md` when dependencies change.

## Quick Pointers

- Base entry: `init.lua`
- Main config: `lua/chadrc.lua`
- Options: `lua/options.lua`
- Mappings: `lua/mappings.lua`
- Plugins: `lua/plugins/init.lua`
- LSP config: `lua/configs/lspconfig.lua`
- Formatting config: `.stylua.toml`

## If You Are Unsure

- Ask before adding anything heavy or non-standard.
- Prefer minimal defaults and no automatic installs.
