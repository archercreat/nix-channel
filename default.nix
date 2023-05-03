{ pkgs ? import <nixpkgs> {} }:
{
  overlays = import ./overlays;

  z3     = pkgs.callPackage ./pkgs/z3 {};
  xed    = pkgs.callPackage ./pkgs/xed {};
  triton = pkgs.callPackage ./pkgs/triton {};
}
