{
  version,
  rustPlatform,
  src-service,
  pkg-config,
  openssl,
  pname,
  webkitgtk_4_0,
  service-cargo-hash,
  meta,
}:
rustPlatform.buildRustPackage {
  pname = "${pname}-service";
  inherit version meta;

  src = src-service;
  sourceRoot = "${src-service.name}";

  nativeBuildInputs = [
    pkg-config
    rustPlatform.cargoSetupHook
  ];

  buildInputs = [
    openssl
    webkitgtk_4_0
  ];

  env = {
    OPENSSL_NO_VENDOR = 1;
  };

  cargoHash = service-cargo-hash;
}
