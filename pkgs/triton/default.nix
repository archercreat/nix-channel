{ lib, stdenv, fetchFromGitHub, capstone, z3 }:

stdenv.mkDerivation rec {
  version = "dev-1.0";
  name = "triton-${version}";

  src = fetchFromGitHub {
    owner  = "JonathanSalwan";
    repo   = "Triton";
    rev    = "c344d78281ed9267d83820e06efe89baa27e12b2";
    sha256 = "sha256-NUkWUXsCIhX8el2By3zVVLZcmU09p4Vn4TcsbdEjIfU=";
  };

  cmakeFlags = [
    "-DBOOST_INTERFACE=OFF"
    "-DBUILD_EXAMPLES=OFF"
    "-DENABLE_TEST=OFF"
    "-DPYTHON_BINDINGS=OFF"
  ];

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    capstone
    z3
  ];

  meta = with lib; {
    description = "Triton is a dynamic binary analysis library";
    homepage    = "https://github.com/JonathanSalwan/Triton";
  };
}
