/* 2> /dev/null; no() { a="$1"; shift; nixops "$a" -s localstate.nixops "$@"; }; return # */

with (import <nixpkgs> {});

buildEnv rec {
  name = "haskell.lv-shell";
  paths = buildInputs;
  buildInputs = [
    nixops
    git-crypt
    openvpn
  ];
}
