{
  description = "Arnnvv Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
    let
      configuration = { pkgs, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages =
          [
            pkgs.neovim
            pkgs.tmux
            pkgs.fzf
            pkgs.fd
            pkgs.ripgrep
            pkgs.yamlfmt
            pkgs.biome
            pkgs.stylua
            pkgs.zig
            pkgs.httpie
            pkgs.tree
            pkgs.go
            pkgs.gofumpt
            pkgs.ffmpeg
            pkgs.lua
            pkgs.pnpm
            pkgs.stow
            pkgs.git
            pkgs.delta
            pkgs.minikube
            pkgs.postgresql_16
            pkgs.kind
            pkgs.sqlc
            pkgs.nodejs_22
          ];

        homebrew = {
          enable = true;
          casks = [
            "alacritty"
            "aldente"
            "arc"
            "docker"
            "discord"
            "httpie"
            "raycast"
            "signal"
            "telegram"
            "zoom"
          ];
          brews = [
            "wget"
            "curl"
            "ca-certificates"
            "gnu-tar"
          ];
          onActivation.autoUpdate = true;
          onActivation.upgrade = true;
        };

        fonts.packages = with pkgs; [
          (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
        ];

        system.defaults = {
          dock.autohide = true;
          NSGlobalDomain.KeyRepeat = 2;
          NSGlobalDomain.AppleInterfaceStyle = "Dark";
        };

        # Auto upgrade nix package and the daemon service.
        services.nix-daemon.enable = true;
        # nix.package = pkgs.nix;

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Create /etc/zshrc that loads the nix-darwin environment.
        programs.zsh.enable = true; # default shell on catalina
        # programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 5;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";
      };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Arnavs-MacBook-Air-2
      darwinConfigurations."Arnavs-MacBook-Air-2" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "arnavsharma";
              autoMigrate = true;
            };
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."Arnavs-MacBook-Air-2".pkgs;
    };
}
