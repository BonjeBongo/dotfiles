{pkgs, ...}: {
  imports = [
    ./modules/packages.nix
    ./scripts/blocks.nix
    ./scripts/nx-switch.nix
    ./scripts/vault.nix
  ];

  packages = with pkgs; {
    linux = [
      (mpv.override {scripts = [mpvScripts.mpris];})
      spotify
      # gnome-secrets
      fragments
      figma-linux
      # yabridge
      # yabridgectl
      # wine-staging
      nodejs
      chromium
      pkgs.nixfmt-rfc-style
    ];
    cli = [
      bat
      eza
      fd
      ripgrep
      fzf
      yazi
      diskonaut
      lazydocker
      lazygit
    ];
  };
}
