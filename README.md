# pi-config

A starter configuration for Pi Coding Agent. It can be used as a global Pi config directory or as a reference for project-local configuration.

## Usage

Choose one of the following:

1. Copy or sync this directory to the default global config path: `~/.pi/agent/`
2. Or point Pi to this directory before startup:

```bash
export PI_CODING_AGENT_DIR=/home/hastyshell/src/pi-config
```

## Development

For TypeScript extension editing with Neovim/LSP:

```bash
nix develop
npm install       # run once, provides local Pi/typebox types for the TS server
npm run typecheck
```

The development shell provides Node.js, TypeScript, and `typescript-language-server`. It also sets `PI_CODING_AGENT_DIR=$PWD` for local testing.

## Testing Extensions

Test a single extension without enabling the whole config:

```bash
PI_CODING_AGENT_DIR=$PWD pi --no-extensions -e ./extensions/examples/hello.ts
```

Then run `/hello` in Pi.

To test auto-discovery, put the extension at `extensions/name.ts` or `extensions/name/index.ts`, start Pi with this config directory, and use `/reload` after edits:

```bash
PI_CODING_AGENT_DIR=$PWD pi
```

## Directory Layout

- `settings.json`: Global Pi settings
- `models.json`: Placeholder for custom providers and models
- `AGENTS.md`: Context and collaboration guidelines loaded automatically by Pi
- `APPEND_SYSTEM.md`: Additional instructions appended to the default system prompt
- `prompts/`: Prompt templates, invoked with `/name`
- `skills/`: Agent skills, invoked with `/skill:name`
- `extensions/`: TypeScript extensions
- `themes/`: Custom themes
- `sessions/`: Optional local session storage
- `flake.nix`: Minimal development shell for TypeScript extension editing
- `package.json`: Local TypeScript/LSP dependencies for extension development
- `tsconfig.json`: TypeScript configuration for extension files
