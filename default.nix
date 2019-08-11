with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "st";
  src = ./src;

  nativeBuildInputs = [ pkgconfig makeWrapper ];
  buildInputs = [ xorg.libX11 ncurses xorg.libXext xorg.libXft fontconfig ];

  installPhase = ''
    TERMINFO=$out/share/terminfo make clean install PREFIX=$out
  '';
}
