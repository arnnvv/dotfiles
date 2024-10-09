{
  description = "arnnvv's system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
      configuration = { pkgs, ... }: {
        environment.systemPackages =
          [
            pkgs.vim
          ];

        services.nix-daemon.enable = true;

        nix.settings.experimental-features = "nix-command flakes";

        programs.zsh.enable = true; # default shell on catalina

        system.configurationRevision = self.rev or self.dirtyRev or null;

        system.stateVersion = 5;

        nixpkgs.hostPlatform = "x86_64-darwin";

        homebrew.enable = true;
        homebrew.casks = [
          "alacritty"
          "aldente"
          "arc"
          "discord"
          "docker"
          "font-meslo-lg-nerd-font"
          "raycast"
          "signal"
          "telegram"
          "zoom"
        ];
      };
    in
    {
      darwinConfigurations."simple" = nix-darwin.lib.darwinSystem {
        modules = [ configuration ];
      };

      darwinPackages = self.darwinConfigurations."simple".pkgs;
    };
}
