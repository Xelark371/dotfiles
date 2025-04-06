{ pkgs, lib, inputs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = with inputs.nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace; [
        bbenoist.nix
        formulahendry.code-runner
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        mkhl.direnv
        ms-vsliveshare.vsliveshare
        pkief.material-icon-theme
        shardulm94.trailing-spaces
        tomoki1207.pdf
      ];

      userSettings = {
        "code-runner.executorMap" = {
          "java" = "cd $dir && javac -d ../bin $fileName && java -cp ../bin $fileNameWithoutExt";
        };
        "code-runner.runInTerminal" = true;
        "window.commandCenter" = false;
        "workbench.iconTheme" = "material-icon-theme";

        "files.insertFinalNewline" = true;
        "files.trimFinalNewlines" = true;
        "files.exclude" = {
          "**/.mypy_cache" = true;
          "**/__pycache__" = true;
          "**/.devenv*" = true;

        "direnv.restart.automatic" = true;
        };
      };
    };
  };
}
