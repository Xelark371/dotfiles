{
  imports = [
    ./alacritty.nix
    ./librewolf.nix
    ./obs.nix
    ./opencode.nix
    ./vscode.nix
  ];

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
    };

    git = {
      enable = true;

      settings = {
        user = {
          name = "Maxence";
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

    mangohud.enable = true;
  };
}
