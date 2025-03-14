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
    style = {
      name = "kvantum";
      package = pkgs.libsForQt5.qtstyleplugin-kvantum;
    };
  };

  home = {
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-dark";
      size = 24;
    };

    packages = with pkgs; [
      libsForQt5.qtstyleplugin-kvantum
    ];
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Vimix-Dark-Doder
    '';

    "qt5ct/qt5ct.conf".text = ''
      [Appearance]
      style=kvantum
    '';
  };
}