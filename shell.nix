with (import <nixpkgs> {});

buildEnv rec {
  name = "haskell.lv-shell";
  paths = buildInputs;
  buildInputs = [ nixops ];
}
