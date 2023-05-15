{ lib, stdenv, fetchFromGitHub, cmake, ninja, z3, llvm_16, re2c }:
let
  llvm = llvm_16.overrideAttrs (finalAttrs: previousAttrs: {
    cmakeFlags = previousAttrs.cmakeFlags ++ [
      "-DLLVM_ENABLE_EH=ON"
    ];
  });

in stdenv.mkDerivation rec {
  version = "master";
  name    = "alive2-${version}";

  src = fetchFromGitHub {
    owner  = "AliveToolkit";
    repo   = "alive2";
    rev    = "fae975049342fb81940d427d8575e291595733f6";
    sha256 = "sha256-erJirxsDPIzOosYtdA+EmrYbGMuh1+jTrTUCYOsFc5s=";
  };

  patches = [
    "./cmake-package.patch"
  ];

  cmakeFlags = [
    "-DBUILD_LLVM_UTILS=ON"
  ];

  nativeBuildInputs = [
    cmake
    ninja
  ];

  buildInputs = [
    re2c
    llvm_16
    z3
  ];
}
