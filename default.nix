{ pkgs ? import <unstable> {} }:
{
  z3     = pkgs.callPackage ./pkgs/z3 {};
  xed    = pkgs.callPackage ./pkgs/xed {};
  triton = pkgs.callPackage ./pkgs/triton {};
  alive2 = pkgs.callPackage ./pkgs/alive2 {};
}
