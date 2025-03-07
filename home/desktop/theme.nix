{
  gtk = {
      enable = true;

      theme = {
        package = pkgs.vimix-gtk-themes;
        name = "vimix-dark-doder";
      };

      iconTheme = {
        package = pkgs.dracula-icon-theme;
        name = "Dracula";
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "q5ct";
      style = {
        name = "Vimix-Dark-Doder";
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
    };

    xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Vimix-Dark-Doder
    '';

    xdg.configFile."qt5ct/qt5ct.conf".text = ''
      [Appearance]
      style=kvantum
    '';
}