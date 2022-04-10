{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=release-21.11";
    dream2nix = {
      type = "github";
      owner = "yusdacra";
      repo = "dream2nix";
      ref = "feat/cargo-lock-subpackages";
    };
  };

  outputs = { self, dream2nix, ... }@inputs:
    let
      dream2nix = inputs.dream2nix.lib.init {
        # modify according to your supported systems
        systems = [ "x86_64-linux" "aarch64-darwin" ];
        config.projectRoot = ./.;
      };
    in dream2nix.makeFlakeOutputs {
      source = ./.;
    };
}
