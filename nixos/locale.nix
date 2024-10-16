{pkgs, ...}: {
  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  console.useXkbConfig = true;
  services.xserver = {
    xkb.layout = "us,ua,jp";
    xkbOptions = "grp:ctrl_space_toggle"
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-configtool
    ];
  };
  environment.variables.GLFW_IM_MODULE = "ibus";
  mine.xUserConfig.xsession.initExtra = ''
    ${config.i18n.inputMethod.package}/bin/fcitx5 &
  '';
}
