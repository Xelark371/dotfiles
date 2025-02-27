{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = with pkgs.vscode-extensions; [
        
      ];
      
      userSettings = {
        "code-runner.executorMap" = {
          "java" = "cd $dir && javac -d ../bin $fileName && java -cp ../bin $fileNameWithoutExt";
        };
        "code-runner.runInTerminal" = true;
        "window.commandCenter" = false;
      };
    };

    package = pkgs.vscode;
  };
}