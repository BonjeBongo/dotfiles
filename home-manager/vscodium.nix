{inputs, ...}: {
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium.fhs;
    extensions = with pkgs.vscode-extensions; [
      mhutchie.git-graph
      eamodio.gitlens
      ms-vscode.hexeditor
    ];
  };
}