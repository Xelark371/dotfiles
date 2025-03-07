{
  imports = [
    ./alacritty.nix
    ./git.nix
    ./librewolf.nix
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