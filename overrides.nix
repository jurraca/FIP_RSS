{pkgs, fast-rss-src }: 
 prev: final: let
    rss = pkgs.rustPlatform.buildRustPackage {
        # Fill these out
        pname = "rss";
        version = "2.0";
        # Where the Rust code lives. For NIFs, this is usually native/my-rust-src
        src = "${fast-rss-src}/native/fastrss";
        # A hash that ensures we're getting the right src.
        # Get this hash by running `nix hash path native/my-rust-src`
        # Nix will attempt to verify this when building and tell you the hash it got vs what it expected
        cargoSha256 = "sha256-M9Uql8ekY/ipraRqdNyUzzbs+j8g0a2DjuLldWP3cWs=";
    };
in {
  fast_rss = final.fast_rss.override {
    src = fast-rss-src;
    
    preConfigure = ''
     mkdir priv && mkdir priv/native
     cp ${rss}/lib/rss.so priv/native/

      substituteInPlace lib/fip_rss/native.ex --replace "crate: \"rss\"" """
          crate: \"rss\",
          skip_compilation?: true,
          load_from: {:fastrss, \"priv/native/rss\"}
          \
    '';
  };
}