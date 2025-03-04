{ pkgs, nixVscodeExtensions, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = with nixVscodeExtensions.vscode-marketplace; [
        bbenoist.nix
        jnoortheen.nix-ide
        formulahendry.code-runner
        tomoki1207.pdf
        ms-vsliveshare.vsliveshare
        pkief.material-icon-theme
        mechatroner.rainbow-csv
      ];
      
      userSettings = {
        "code-runner.executorMap" = {
          "java" = "cd $dir && javac -d ../bin $fileName && java -cp ../bin $fileNameWithoutExt";
        };
        "code-runner.runInTerminal" = true;
        "window.commandCenter" = false;
      };
    };
  };
}