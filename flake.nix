{
  description = "Cline CLI";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { nixpkgs, ... }: 
    let 
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      packages.x86_64-linux = {
        default = pkgs.writeShellScriptBin "cline" ''
          export PATH="${pkgs.nodejs}/bin:$PATH"
          if [ ! -d "$HOME/.cline-npm" ]; then
            mkdir -p "$HOME/.cline-npm"
            cd "$HOME/.cline-npm"
            ${pkgs.nodejs}/bin/npm init -y >/dev/null 2>&1
            ${pkgs.nodejs}/bin/npm install cline >/dev/null 2>&1
          fi
          cd "$HOME/.cline-npm"
          ${pkgs.nodejs}/bin/npx cline "$@"
        '';
      };
      
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = with pkgs; [ nodejs npm ];
      };
    };
}
