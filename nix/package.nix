{
  lib,
  version,
  stdenvNoCC,

  just,
  nodejs,
  pnpm_10,
}:
stdenvNoCC.mkDerivation (oa: {
  pname = "evergarden-site";
  inherit version;

  src = ./.;

  nativeBuildInputs = [
    just
    nodejs
    pnpm_10.configHook
  ];

  pnpmDeps = pnpm_10.fetchDeps {
    inherit (oa) pname version src;
  };

  justFlags = [
    "--set"
    "prefix"
    (placeholder "out")
  ];

  meta = {
    homepage = "https://codeberg.org/evergarden/site";
    description = "evergarden site";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ comfysage ];
  };
})
