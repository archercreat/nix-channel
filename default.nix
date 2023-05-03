{ pkgs ? import <nixpkgs> {} }:
{
  z3 = pkgs.callPackage ./pkgs/z3 {};
}