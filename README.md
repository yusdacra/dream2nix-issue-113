To reproduce

```
cd service/binary
nix build .#packages.aarch64-darwin.binary
```

To cross check with cargo
```
cd service/binary
cargo run
```
