# Cline CLI Nix Flakes

Nix flakes for the Cline CLI autonomous coding agent.

## What is Cline?

Cline is an AI-powered autonomous coding assistant that can create/edit files, run commands, use the browser, and more with your permission every step of the way.

## Usage

```bash
# Run directly
nix run github:celesrenata/clinecli-flakes

# Install to profile
nix profile install github:celesrenata/clinecli-flakes

# Development shell
nix develop
```

## Building

```bash
nix build
./result/bin/cline --help
```

## Commands

```bash
# Interactive mode
cline

# Non-interactive mode
cline "Create a Python script that prints hello world"

# Authentication (required for first use)
cline auth

# Version info
cline version

# Help
cline --help
```

## Requirements

- Node.js 20+ (handled automatically by the flake)
- Authentication with an AI provider (OpenAI, Anthropic, etc.)

## How it works

This flake creates a wrapper script that:
1. Installs the official Cline CLI from npm on first run
2. Stores the installation in `~/.cline-npm`
3. Runs the CLI with all arguments passed through

The CLI will prompt you to authenticate on first use with `cline auth`.
