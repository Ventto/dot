{
  description = "Mes paquets user avec nixpkgs stable";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.buildEnv {
        name = "my-user-packages";
        paths = with pkgs; [
          gitui
          rip2
          showmethekey
          yazi
          zellij
          shfmt
          shellcheck
        ];
      };
    };
}
