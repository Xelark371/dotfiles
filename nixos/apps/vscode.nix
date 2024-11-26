{ pkgs, lib, ... }:
{
  home-manager.users.max = {
    programs.vscode = {
      enable = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = with pkgs.vscode-extensions; [

      ];
      
      package = pkgs.vscode;
    };
  };
}