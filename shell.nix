{ pkgs ? import <nixpkgs> { } }:

with pkgs;

mkShell {
  nativeBuildInputs = [
    bundix
    gcc
    nodejs
    ruby_3_0
  ];
  buildInputs = [
    libffi
    libyaml
    openssl
    readline
    zlib
  ];
}
