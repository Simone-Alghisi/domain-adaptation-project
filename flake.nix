{
  inputs = {
    mach-nix = {
      url = "mach-nix/3.4.0";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {self, nixpkgs, flake-utils, mach-nix }@inp:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      python-build = mach-nix.lib."${system}".mkPython {
        python = "python39";
        requirements = builtins.readFile ./requirements-dev.txt;
      };
    in
    {
      devShell = pkgs.mkShell {
        buildInputs = [
          python-build
        ];
      };
    });
}
