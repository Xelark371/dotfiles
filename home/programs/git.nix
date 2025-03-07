{
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