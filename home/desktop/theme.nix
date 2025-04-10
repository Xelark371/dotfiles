{ pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      package = pkgs.vimix-gtk-themes;
      name = "vimix-dark-doder";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style.name = "kvantum";
  };

  home = {
    packages = with pkgs; [
      libsForQt5.qtstyleplugin-kvantum
    ];

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-dark";
      size = 24;
    };
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=KvGnomeDark
    '';
  };
}
