
@yusdacra Thanks for picking this up!

I did try this out and I'm still getting the same error (could not find crate ...) and not the one you're describing.
Note that a workspace is not being used - just path deps like this:

[dependencies]
serde = { version = "^1.0", features = ["derive"] }
serde_json = { version = "^1.0" }
private_lib = { path = "../../lib/private_lib" }
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
