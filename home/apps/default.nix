{
  imports = [
    ./vscode.nix
  ];

  programs.git = {
		enable = true;
		userName = "Xelark371";
		userEmail = "maxencebressel.371@gmail.com";

		extraConfig = {
			credential = {
				helper = "store";
			};
		};
	};
}