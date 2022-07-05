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
      # you can build automatically python pkgs from repo using their requirements
      # poke-env = mach-nix.lib."${system}".buildPythonPackage {
      #   pname = "poke_env";
      #   version = "0.4.21";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "Simone-Alghisi";
      #     repo = "poke-env";
      #     rev = "612b5862df5a3549e8c93ecee686ba38dcb86f95";
      #     hash = "sha256-TJ+1e2WLKsQmQUvCPVLPphEtglnQwkbPmLNb5LA9Aro=";
      #   };
      # };
      python-build = mach-nix.lib."${system}".mkPython {
        # you can specify the pyhton version
        # python = "python39"
        requirements = builtins.readFile ./requirements.txt;
        packagesExtra = [
          # you can build tarball, local paths
          # ./path/to/package
          # (builtins.fetchTarball {
          #   url = "https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-3.1.0/en_core_web_sm-3.1.0.tar.gz";
          #   sha256 = "0iqhcmwvl2jna6m2zk6g9j1j7six6wf7kzd2xlxgypn0s8649dvb";
          # })
        ];
      };
      # you can override packages
      #Qt-matplotlib = pkgs.python39Packages.matplotlib.override {
      #  enableQt = false;
      #  enableTk = true;
      #}; 
    in
    {
      # enter this python environment by executing `nix shell .`
      devShell = pkgs.mkShell {
        # you can hook some variables for example
        shellHook = ''
          export QT_QPA_PLATFORM=wayland-egl
        '';
        buildInputs = [
          python-build
          # Additional packages, e.g. pkgs.python39Packages.matplotlib
        ];
      };
    });
}
