{
  description = "A development environment for MySQL, Docker, Python, and REST APIs";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/release-23.11";

  outputs = { self, nixpkgs }: let
    systems = [ "x86_64-linux" "aarch64-linux" ]; # Supported systems
  in {
    devShells = builtins.listToAttrs (map (system: {
      name = system;
      value = nixpkgs.legacyPackages.${system}.mkShell {
        buildInputs = with nixpkgs.legacyPackages.${system}; [
          docker
          docker-compose
          mysql-client
          python310
          poetry
          curl
          jq
          git
        ];

        shellHook = ''
          echo "Welcome to the zylyty development environment!"
          echo "Available tools: Docker, MySQL, Python, Poetry, curl, jq, git."
        '';
      };
    }) systems);

    # Provide a default devShell for the current system
    devShell.x86_64-linux = self.devShells.x86_64-linux;
  };
}
