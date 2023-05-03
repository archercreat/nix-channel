{ lib, stdenv, fetchurl, cmake, python39 }:

stdenv.mkDerivation rec {
  version = "4.11.0";
  name    = "z3-${version}";

  src = fetchurl {
    url    = "https://github.com/Z3Prover/z3/archive/refs/tags/z3-4.11.0.tar.gz";
    sha256 = "sha256-r6dh7iwAtmr89/d8zz+YIPlxQrupiAQLpW7YdkQ7gRw=";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    python39
  ];

  postPatch = "substituteInPlace z3.pc.cmake.in --replace '=\$\{exec_prefix\}/' '' --replace '=\$\{prefix\}/' ''";

  meta = with lib; {
    description = "A high-performance theorem prover and SMT solver";
    homepage    = "https://github.com/Z3Prover/z3";
  };
}