{
  description = "A development environment for MySQL, Docker, Python, and REST APIs";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/release-23.11";

  outputs = { self, nixpkgs }: {
    devShells.default = nixpkgs.lib.mkShell {
      # Define the packages to include in the devShell
      buildInputs = with nixpkgs; [
        docker            # Docker runtime
        docker-compose    # Docker Compose
        mysql-client      # MySQL client tools
        python310         # Python 3.10
        poetry            # Python dependency management
        curl              # REST API testing tool
        jq                # JSON parser for REST API responses
        git               # For version control
      ];

      # Environment variables (if needed)
      shellHook = ''
        echo "Welcome to your development environment for MySQL, Docker, and REST APIs!"
      '';
    };
  };
}
