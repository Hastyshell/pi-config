# Vendored Third-Party Extensions

This repository keeps some third-party Pi extensions as copied source under `extensions/` instead of installing them through Pi packages.

Vendored extension directories are intentionally excluded from the root `tsconfig.json` typecheck and Prettier workflow. Treat them as upstream-owned code: keep local edits minimal, test them separately, and record the upstream version or commit when updating.

## Extensions

### `extensions/files-widget/`

- Upstream: https://github.com/tmustier/pi-extensions/tree/main/files-widget
- Package: `@tmustier/pi-files-widget`
- Version recorded in vendored `package.json`: `0.1.20`
- Notes: copied source with local repository history edits. Update manually from upstream and review local changes before replacing.

### `extensions/pi-web-access/`

- Upstream: https://github.com/nicobailon/pi-web-access
- Package/name: `pi-web-access`
- Version recorded in vendored `package.json`: `0.10.6`
- Notes: copied source. Runtime dependencies used by this extension are listed in the root `package.json` so the vendored code can run from this config checkout.

## Alternative: Pi git package source

Pi can load a package directly from git instead of committing copied source here, for example:

```json
{
  "packages": [
    "git:github.com/nicobailon/pi-web-access@<tag-or-commit>"
  ]
}
```

or with filtering:

```json
{
  "packages": [
    {
      "source": "git:github.com/tmustier/pi-extensions@<tag-or-commit>",
      "extensions": ["files-widget/index.ts"],
      "skills": [],
      "prompts": [],
      "themes": []
    }
  ]
}
```

Pi clones git packages under its package cache and runs `npm install` when `package.json` exists. In this Nix-based setup, vendoring is preferred so dependency installation and reproducibility stay controlled by this repository instead of Pi invoking npm at startup/update time.
