{ pkgs ? import <nixpkgs> {} }:
{
  overlays = import ./overlays;

  z3     = pkgs.callPackage ./pkgs/z3 {};
  triton = pkgs.callPackage ./pkgs/triton { z3 = import ./pkgs/z3; };
}
