{ pkgs ? import <nixpkgs> {} }:
{
  z3     = pkgs.callPackage ./pkgs/z3 {};
  triton = pkgs.callPackage ./pkgs/triton { z3 };
}
