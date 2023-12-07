{ lib, beamPackages, overrides ? (x: y: {}) }:

let
  buildRebar3 = lib.makeOverridable beamPackages.buildRebar3;
  buildMix = lib.makeOverridable beamPackages.buildMix;
  buildErlangMk = lib.makeOverridable beamPackages.buildErlangMk;

  self = packages // (overrides self packages);

  packages = with beamPackages; with self; {
    castore = buildMix rec {
      name = "castore";
      version = "1.0.4";

      src = fetchHex {
        pkg = "castore";
        version = "${version}";
        sha256 = "9418c1b8144e11656f0be99943db4caf04612e3eaecefb5dae9a2a87565584f8";
      };

      beamDeps = [];
    };

    cc_precompiler = buildMix rec {
      name = "cc_precompiler";
      version = "0.1.9";

      src = fetchHex {
        pkg = "cc_precompiler";
        version = "${version}";
        sha256 = "9dcab3d0f3038621f1601f13539e7a9ee99843862e66ad62827b0c42b2f58a54";
      };

      beamDeps = [ elixir_make ];
    };

    certifi = buildRebar3 rec {
      name = "certifi";
      version = "2.12.0";

      src = fetchHex {
        pkg = "certifi";
        version = "${version}";
        sha256 = "ee68d85df22e554040cdb4be100f33873ac6051387baf6a8f6ce82272340ff1c";
      };

      beamDeps = [];
    };

    codepagex = buildMix rec {
      name = "codepagex";
      version = "0.1.6";

      src = fetchHex {
        pkg = "codepagex";
        version = "${version}";
        sha256 = "1521461097dde281edf084062f525a4edc6a5e49f4fd1f5ec41c9c4955d5bd59";
      };

      beamDeps = [];
    };

    db_connection = buildMix rec {
      name = "db_connection";
      version = "2.6.0";

      src = fetchHex {
        pkg = "db_connection";
        version = "${version}";
        sha256 = "c2f992d15725e721ec7fbc1189d4ecdb8afef76648c746a8e1cad35e3b8a35f3";
      };

      beamDeps = [ telemetry ];
    };

    decimal = buildMix rec {
      name = "decimal";
      version = "2.1.1";

      src = fetchHex {
        pkg = "decimal";
        version = "${version}";
        sha256 = "53cfe5f497ed0e7771ae1a475575603d77425099ba5faef9394932b35020ffcc";
      };

      beamDeps = [];
    };

    ecto = buildMix rec {
      name = "ecto";
      version = "3.11.1";

      src = fetchHex {
        pkg = "ecto";
        version = "${version}";
        sha256 = "ebd3d3772cd0dfcd8d772659e41ed527c28b2a8bde4b00fe03e0463da0f1983b";
      };

      beamDeps = [ decimal jason telemetry ];
    };

    ecto_sql = buildMix rec {
      name = "ecto_sql";
      version = "3.11.1";

      src = fetchHex {
        pkg = "ecto_sql";
        version = "${version}";
        sha256 = "ce14063ab3514424276e7e360108ad6c2308f6d88164a076aac8a387e1fea634";
      };

      beamDeps = [ db_connection ecto telemetry ];
    };

    ecto_sqlite3 = buildMix rec {
      name = "ecto_sqlite3";
      version = "0.12.0";

      src = fetchHex {
        pkg = "ecto_sqlite3";
        version = "${version}";
        sha256 = "4eaf8550df1fd0043bcf039a5dce407fd8afc30a115ced173fe6b9815eeedb55";
      };

      beamDeps = [ decimal ecto ecto_sql exqlite ];
    };

    elixir_make = buildMix rec {
      name = "elixir_make";
      version = "0.7.7";

      src = fetchHex {
        pkg = "elixir_make";
        version = "${version}";
        sha256 = "5bc19fff950fad52bbe5f211b12db9ec82c6b34a9647da0c2224b8b8464c7e6c";
      };

      beamDeps = [ castore ];
    };

    elixir_xml_to_map = buildMix rec {
      name = "elixir_xml_to_map";
      version = "0.1.3";

      src = fetchHex {
        pkg = "elixir_xml_to_map";
        version = "${version}";
        sha256 = "d18f0a4e75f20319154b7096d208acd058ac524b7bbed661b231f36ac4c33053";
      };

      beamDeps = [ erlsom ];
    };

    erlsom = buildRebar3 rec {
      name = "erlsom";
      version = "1.5.1";

      src = fetchHex {
        pkg = "erlsom";
        version = "${version}";
        sha256 = "7965485494c5844dd127656ac40f141aadfa174839ec1be1074e7edf5b4239eb";
      };

      beamDeps = [];
    };

    exjsx = buildMix rec {
      name = "exjsx";
      version = "4.0.0";

      src = fetchHex {
        pkg = "exjsx";
        version = "${version}";
        sha256 = "32e95820a97cffea67830e91514a2ad53b888850442d6d395f53a1ac60c82e07";
      };

      beamDeps = [ jsx ];
    };

    exqlite = buildMix rec {
      name = "exqlite";
      version = "0.17.0";

      src = fetchHex {
        pkg = "exqlite";
        version = "${version}";
        sha256 = "719fa7986fed242839629a907d60f774000c1d2dc03ba6ba05fcd30579f2ab45";
      };

      beamDeps = [ cc_precompiler db_connection elixir_make ];
    };

    fast_rss = buildMix rec {
      name = "fast_rss";
      version = "0.5.0";

      src = fetchHex {
        pkg = "fast_rss";
        version = "${version}";
        sha256 = "dafb3eccc024d7366a0ef78521a26cfaf2075be534cfe1ec70d72903eabdd44d";
      };

      beamDeps = [ rustler_precompiled ];
    };

    feeder = buildErlangMk rec {
      name = "feeder";
      version = "2.3.2";

      src = fetchHex {
        pkg = "feeder";
        version = "${version}";
        sha256 = "e176f1e486a4498ae0e235fb5d254082272d52e5f9bd825c469f1dcddf21edd4";
      };

      beamDeps = [];
    };

    feeder_ex = buildMix rec {
      name = "feeder_ex";
      version = "1.1.0";

      src = fetchHex {
        pkg = "feeder_ex";
        version = "${version}";
        sha256 = "3d06dfcc3e13a2fb66182dffc16e112b0ef9aea432a949f48b56c667ac09d07e";
      };

      beamDeps = [ feeder ];
    };

    finch = buildMix rec {
      name = "finch";
      version = "0.16.0";

      src = fetchHex {
        pkg = "finch";
        version = "${version}";
        sha256 = "f660174c4d519e5fec629016054d60edd822cdfe2b7270836739ac2f97735ec5";
      };

      beamDeps = [ castore mime mint nimble_options nimble_pool telemetry ];
    };

    floki = buildMix rec {
      name = "floki";
      version = "0.21.0";

      src = fetchHex {
        pkg = "floki";
        version = "${version}";
        sha256 = "4558100b255f5143d42432e75ceb731d04dbe824d1cf57c38e7e0f3c644ca0cd";
      };

      beamDeps = [ html_entities mochiweb ];
    };

    hackney = buildRebar3 rec {
      name = "hackney";
      version = "1.20.1";

      src = fetchHex {
        pkg = "hackney";
        version = "${version}";
        sha256 = "fe9094e5f1a2a2c0a7d10918fee36bfec0ec2a979994cff8cfe8058cd9af38e3";
      };

      beamDeps = [ certifi idna metrics mimerl parse_trans ssl_verify_fun unicode_util_compat ];
    };

    hpax = buildMix rec {
      name = "hpax";
      version = "0.1.2";

      src = fetchHex {
        pkg = "hpax";
        version = "${version}";
        sha256 = "2c87843d5a23f5f16748ebe77969880e29809580efdaccd615cd3bed628a8c13";
      };

      beamDeps = [];
    };

    html_entities = buildMix rec {
      name = "html_entities";
      version = "0.4.0";

      src = fetchHex {
        pkg = "html_entities";
        version = "${version}";
        sha256 = "3e3d7156a272950373ce5a4018b1490bea26676f8d6a7d409f6fac8568b8cb9a";
      };

      beamDeps = [];
    };

    httpoison = buildMix rec {
      name = "httpoison";
      version = "0.13.0";

      src = fetchHex {
        pkg = "httpoison";
        version = "${version}";
        sha256 = "4846958172d6401c4f34ecc5c2c4607b5b0d90b8eec8f6df137ca4907942ed0f";
      };

      beamDeps = [ hackney ];
    };

    idna = buildRebar3 rec {
      name = "idna";
      version = "6.1.1";

      src = fetchHex {
        pkg = "idna";
        version = "${version}";
        sha256 = "92376eb7894412ed19ac475e4a86f7b413c1b9fbb5bd16dccd57934157944cea";
      };

      beamDeps = [ unicode_util_compat ];
    };

    jason = buildMix rec {
      name = "jason";
      version = "1.4.1";

      src = fetchHex {
        pkg = "jason";
        version = "${version}";
        sha256 = "fbb01ecdfd565b56261302f7e1fcc27c4fb8f32d56eab74db621fc154604a7a1";
      };

      beamDeps = [ decimal ];
    };

    jsx = buildMix rec {
      name = "jsx";
      version = "2.8.3";

      src = fetchHex {
        pkg = "jsx";
        version = "${version}";
        sha256 = "fc3499fed7a726995aa659143a248534adc754ebd16ccd437cd93b649a95091f";
      };

      beamDeps = [];
    };

    metrics = buildRebar3 rec {
      name = "metrics";
      version = "1.0.1";

      src = fetchHex {
        pkg = "metrics";
        version = "${version}";
        sha256 = "69b09adddc4f74a40716ae54d140f93beb0fb8978d8636eaded0c31b6f099f16";
      };

      beamDeps = [];
    };

    mime = buildMix rec {
      name = "mime";
      version = "2.0.5";

      src = fetchHex {
        pkg = "mime";
        version = "${version}";
        sha256 = "da0d64a365c45bc9935cc5c8a7fc5e49a0e0f9932a761c55d6c52b142780a05c";
      };

      beamDeps = [];
    };

    mimerl = buildRebar3 rec {
      name = "mimerl";
      version = "1.2.0";

      src = fetchHex {
        pkg = "mimerl";
        version = "${version}";
        sha256 = "f278585650aa581986264638ebf698f8bb19df297f66ad91b18910dfc6e19323";
      };

      beamDeps = [];
    };

    mint = buildMix rec {
      name = "mint";
      version = "1.5.1";

      src = fetchHex {
        pkg = "mint";
        version = "${version}";
        sha256 = "4a63e1e76a7c3956abd2c72f370a0d0aecddc3976dea5c27eccbecfa5e7d5b1e";
      };

      beamDeps = [ castore hpax ];
    };

    mint_web_socket = buildMix rec {
      name = "mint_web_socket";
      version = "1.0.3";

      src = fetchHex {
        pkg = "mint_web_socket";
        version = "${version}";
        sha256 = "ca3810ca44cc8532e3dce499cc17f958596695d226bb578b2fbb88c09b5954b0";
      };

      beamDeps = [ mint ];
    };

    mochiweb = buildRebar3 rec {
      name = "mochiweb";
      version = "2.22.0";

      src = fetchHex {
        pkg = "mochiweb";
        version = "${version}";
        sha256 = "cbbd1fd315d283c576d1c8a13e0738f6dafb63dc840611249608697502a07655";
      };

      beamDeps = [];
    };

    morphix = buildMix rec {
      name = "morphix";
      version = "0.8.1";

      src = fetchHex {
        pkg = "morphix";
        version = "${version}";
        sha256 = "e2cfd750dcc25c48b1dd97304fcb167f4ccaefc133fa2b9b4cb8619678fac1e3";
      };

      beamDeps = [];
    };

    nimble_options = buildMix rec {
      name = "nimble_options";
      version = "1.0.2";

      src = fetchHex {
        pkg = "nimble_options";
        version = "${version}";
        sha256 = "fd12a8db2021036ce12a309f26f564ec367373265b53e25403f0ee697380f1b8";
      };

      beamDeps = [];
    };

    nimble_pool = buildMix rec {
      name = "nimble_pool";
      version = "1.0.0";

      src = fetchHex {
        pkg = "nimble_pool";
        version = "${version}";
        sha256 = "80be3b882d2d351882256087078e1b1952a28bf98d0a287be87e4a24a710b67a";
      };

      beamDeps = [];
    };

    paasaa = buildMix rec {
      name = "paasaa";
      version = "0.3.1";

      src = fetchHex {
        pkg = "paasaa";
        version = "${version}";
        sha256 = "5e02b49d9a968f6ccffa130c9a9f977a8ec3403b7a26069547bfda9daa557d10";
      };

      beamDeps = [ exjsx ];
    };

    parse_trans = buildRebar3 rec {
      name = "parse_trans";
      version = "3.4.1";

      src = fetchHex {
        pkg = "parse_trans";
        version = "${version}";
        sha256 = "620a406ce75dada827b82e453c19cf06776be266f5a67cff34e1ef2cbb60e49a";
      };

      beamDeps = [];
    };

    readability = buildMix rec {
      name = "readability";
      version = "0.10.0";

      src = fetchHex {
        pkg = "readability";
        version = "${version}";
        sha256 = "b0edfbd1878cbb27a81d7d3678670cdfb2d2b8fef6a9ca9cbc4013eb640082cd";
      };

      beamDeps = [ floki httpoison ];
    };

    req = buildMix rec {
      name = "req";
      version = "0.4.5";

      src = fetchHex {
        pkg = "req";
        version = "${version}";
        sha256 = "dd23e9c7303ddeb2dee09ff11ad8102cca019e38394456f265fb7b9655c64dd8";
      };

      beamDeps = [ finch jason mime ];
    };

    rustler_precompiled = buildMix rec {
      name = "rustler_precompiled";
      version = "0.7.1";

      src = fetchHex {
        pkg = "rustler_precompiled";
        version = "${version}";
        sha256 = "b9e4657b99a1483ea31502e1d58c464bedebe9028808eda45c3a429af4550c66";
      };

      beamDeps = [ castore ];
    };

    scrape = buildMix rec {
      name = "scrape";
      version = "3.1.0";

      src = fetchHex {
        pkg = "scrape";
        version = "${version}";
        sha256 = "77eb65dad6f242bd51f67350d1c50e7540e3a802a18602ea3d9996aff3a80b3a";
      };

      beamDeps = [ codepagex elixir_xml_to_map floki httpoison morphix paasaa readability stemex ];
    };

    ssl_verify_fun = buildRebar3 rec {
      name = "ssl_verify_fun";
      version = "1.1.7";

      src = fetchHex {
        pkg = "ssl_verify_fun";
        version = "${version}";
        sha256 = "fe4c190e8f37401d30167c8c405eda19469f34577987c76dde613e838bbc67f8";
      };

      beamDeps = [];
    };

    stemex = buildMix rec {
      name = "stemex";
      version = "0.1.1";

      src = fetchHex {
        pkg = "stemex";
        version = "${version}";
        sha256 = "219b8e81fedba5a9bb978b8f7eaf230e77f2702d58e409adcca998fde1788521";
      };

      beamDeps = [];
    };

    telemetry = buildRebar3 rec {
      name = "telemetry";
      version = "1.2.1";

      src = fetchHex {
        pkg = "telemetry";
        version = "${version}";
        sha256 = "dad9ce9d8effc621708f99eac538ef1cbe05d6a874dd741de2e689c47feafed5";
      };

      beamDeps = [];
    };

    unicode_util_compat = buildRebar3 rec {
      name = "unicode_util_compat";
      version = "0.7.0";

      src = fetchHex {
        pkg = "unicode_util_compat";
        version = "${version}";
        sha256 = "25eee6d67df61960cf6a794239566599b09e17e668d3700247bc498638152521";
      };

      beamDeps = [];
    };
  };
in self

