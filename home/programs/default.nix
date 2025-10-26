{
  imports = [
    ./alacritty.nix
    ./librewolf.nix
    ./vscode.nix
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash.enable = true;

  programs.git = {
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
}
