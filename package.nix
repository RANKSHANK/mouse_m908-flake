{
    fetchFromGitHub,
    stdenv,
    cmake,
    libusb1,
    pkg-config,
}: stdenv.mkDerivation {

    pname = "mouse-m908";

    version = "2023-19-06-3.4";

    src = fetchFromGitHub {
        owner = "dokutan";
        repo = "mouse_m908";
        rev = "a93f2b81311a5d84ab27f80946cf82eae1e55ef9";
        sha256 = "sha256-2PD6gV8zW5KaYg4NQ8jFxsFuGr/12YaA0Bvq1mjA7zs=";
    };

    nativeBuildInputs = [ cmake pkg-config ];

    buildInputs = [ libusb1 ];

    buildPhase = ''
        make
    '';

    installPhase = ''
       mkdir -p $out/bin
       mv mouse_m908 $out/bin/
       cp $src/mouse_m908.1 $out
    '';

}
