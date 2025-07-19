# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a modular Emacs configuration focused on software development with support for multiple programming languages. The configuration uses `use-package` for declarative package management and follows a clear separation of concerns.

## Architecture

The configuration follows a modular structure:
- `init.el` - Main entry point that loads all modules in sequence
- `lk/` - Core configuration modules and functions
- `config/` - Individual package configurations
- Package management via ELPA/MELPA with `use-package` declarations

## Key Development Commands

### Emacs Native Compilation
- Native compilation artifacts are stored in `eln-cache/`
- Byte-compiled files (`.elc`) are automatically generated

### Python Development
- **LSP**: Uses `lsp-pyright` for Python language server
- **Linting**: `lazy-ruff` integration for Ruff linter
- **REPL/Testing**: Elpy provides test running capabilities

### Debugging
- Enable debugging: Uncomment `(setq debug-on-error t)` in init.el:14
- Flycheck is configured to respect custom load paths

## Important Configuration Patterns

### Adding New Packages
1. Declare the package in `/lk/use-package-start.el` using `use-package`
2. Create a configuration file in `/config/<package-name>.el`
3. Load the config file in the `:config` section of `use-package`

### Language-Specific Settings
- Language configurations are in `/lk/language-settings.el`
- C/C++ projects use custom setup in `/lk/malinka-projects.el`

### Load Order
1. Package archives initialization
2. Custom load paths
3. ERC configuration
4. All packages via `use-package-start`
5. Language settings
6. General settings and functions

## Custom Features

- **Location-based settings**: `determine-location.el` adjusts settings based on machine
- **Custom avatar**: `lk-avatar.el` for personalization
- **Org-mode publishing**: `refu-docs-publishing.el` for documentation generation

## Notes

- Rust files are handled by `rustic-mode` (not `rust-mode`)
- Helm is used instead of Ido for completion
- Tree-sitter grammars are stored in `tree-sitter/` directory