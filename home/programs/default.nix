{
  imports = [
    ./alacritty.nix
    ./git.nix
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
}