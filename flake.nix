{
  description = "A very basic flake for building microsocks";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.09;

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation rec {
        pname = "microsocks";
        version = "1.0.2";

        src = with lib; fetchFromGitHub {
          owner = "rofl0r";
          repo = pname;
          rev = "v${version}";
          sha256 = "sha256-gG5FuWu9omKh5PAw70BYsneh5lgZ64/TA4rDmDoPIbY=";
        };

        installPhase = "mkdir -p $out/bin; install -t $out/bin microsocks";
      };
  };
}
