{ lib, ...}: {
  services.flatpak.remotes = lib.mkOptionDefault [{
    name = "flathub";
    location = "https://flathub.org/repo/flathub.flatpakrepo";
  }];

  services.flatpak.update.auto.enable = false;
  services.flatpak.uninstallUnmanaged = false;
  services.flatpak.packages = [
    "ch.protonmail.protonmail-bridge"
    "com.github.finefindus.eyedropper"
    "com.github.Matoking.protontricks"
    "com.github.neithern.g4music"
    "com.github.tchx84.Flatseal"
    "com.heroicgameslauncher.hgl"
    "com.protonvpn.www"
    "com.steamgriddb.SGDBoop"
    "com.usebottles.bottles"
    "com.vysp3r.ProtonPlus"
    "dev.vencord.Vesktop"
    "io.github.Foldex.AdwSteamGtk"
    "io.github.mmarco94.tambourine"
    "io.github.realmazharhussain.GdmSettings"
    "io.github.vikdevelop.SaveDesktop"
    "io.gitlab.zehkira.Monophony"
    "io.missioncenter.MissionCenter"
    "me.proton.Pass"
    "me.timschneeberger.jdsp4linux"
    "net.davidotek.pupgui2"
    "org.deluge_torrent.deluge"
    "org.gnome.Evolution"
    "org.kartkrew.RingRacers"
    "org.onlyoffice.desktopeditors"
  ]; 
}