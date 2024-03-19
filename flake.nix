{
  description = "A flake for pythonification";

  inputs = {
    # Ensure our nixpkgs revision is green in Hydra for both Linux and macOS (i.e. there are
    # prebuilt binaries in the cache):
    #   https://status.nixos.org
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };

      pythonPackages = pkgs.python3Packages;
    in rec {
      devShell = pkgs.mkShell rec {
        name = "impurePythonEnv";
        venvDir = "./.venv";
        buildInputs = with pkgs; [
          # A Python interpreter including the 'venv' module is required to bootstrap
          # the environment.
          pythonPackages.python

          # This executes some shell code to initialize a venv in $venvDir before
          # dropping into the shell
          pythonPackages.venvShellHook
        ];

        postVenvCreation = ''
          unset SOURCE_DATE_EPOCH
          pip install -r requirements.txt
        '';
      };
    }
  );
}
