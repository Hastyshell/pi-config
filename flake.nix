{
  description = "Pi Coding Agent configuration";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              nodejs_22
              typescript
              typescript-language-server
            ];

            shellHook = ''
              export PI_CODING_AGENT_DIR="$PWD"
              echo "PI_CODING_AGENT_DIR=$PI_CODING_AGENT_DIR"
              echo "Run 'npm install' once for local TypeScript types."
            '';
          };
        });
    };
}
