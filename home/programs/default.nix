{
  imports = [
    ./alacritty.nix
    ./librewolf.nix
    ./vscode.nix
  ];

  programs = {
    bash.enable = true;
    direnv = {
      enable = true;
      enableBashIntegration = true;
    };

    git = {
      enable = true;

      settings = {
        user = {
          name = "Xelark371";
          email = "maxencebressel.371@proton.me";
        };

        credential = {
          helper = "store";
        };
      };

      ignores = [
        ".devenv*"
        "__pycache__"
      ];
    };
    mangohud = {
      enable = true;
      enableSessionWide = true;
    };
  };
}
