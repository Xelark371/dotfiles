{ pkgs, lib, nixVscodeExtensions, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = with nixVscodeExtensions.vscode-marketplace; [
        bbenoist.nix
        formulahendry.code-runner
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        ms-vsliveshare.vsliveshare
        pkief.material-icon-theme
        tomoki1207.pdf
      ];
      
      userSettings = {
        "code-runner.executorMap" = {
          "java" = "cd $dir && javac -d ../bin $fileName && java -cp ../bin $fileNameWithoutExt";
        };
        "code-runner.runInTerminal" = true;
        "window.commandCenter" = false;

        "files.exclude" = {
          "**/.mypy_cache" = true;
          "**/__pycache__" = true;
          "**/.devenv*" = true;
        };
      };
    };
  };
}