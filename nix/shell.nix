{
  stdenv,
  mkShell,

  prettier,

  inputs, # our inputs
  self ? inputs.self,
}:
mkShell {
  inputsFrom = [ self.packages.${stdenv.hostPlatform.system}.default ];

  packages = [
    prettier
    inputs.ebil.packages.${stdenv.hostPlatform.system}.default
  ];
}
