{ pkgs, ... }:
{
  home-manager.users.max = {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;
      extensions = with pkgs.vscode-extensions; [

      ];
    };
  };
}