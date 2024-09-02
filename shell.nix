{ pkgs ? import <nixpkgs> { } }:

with pkgs;

mkShell {
  nativeBuildInputs = [
    bundix
    gcc
    nodejs
    ruby
  ];
  buildInputs = [
    libffi
    libyaml
    openssl
    readline
    zlib
  ];
}
