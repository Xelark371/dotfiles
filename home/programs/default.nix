{
  imports = [
    ./alacritty.nix
    ./firefox.nix
    ./vscode.nix
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash = {
		enable = true;
	};

  programs.git = {
    enable = true;
    userName = "Xelark371";
    userEmail = "maxencebressel.371@gmail.com";

    ignores = [
      ".devenv*"
      "__pycache__"
    ];

    extraConfig = {
      credential = {
        helper = "store";
      };
    };
  };
}