{ pkgs, lib, inputs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = with inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [
        bbenoist.nix
        formulahendry.code-runner
        icrawl.discord-vscode
        jnoortheen.nix-ide
        leonardssh.vscord
        mechatroner.rainbow-csv
        mkhl.direnv
        ms-vsliveshare.vsliveshare
        pkief.material-icon-theme
        shardulm94.trailing-spaces
        tomoki1207.pdf
      ];

      userSettings = {
        "code-runner.runInTerminal" = true;

        "direnv.restart.automatic" = true;

        "files.insertFinalNewline" = true;
        "files.trimFinalNewlines" = true;
        "files.exclude" = {
          "**/.mypy_cache" = true;
          "**/__pycache__" = true;
          "**/.devenv*" = true;
          "**/.direnv" = true;
        };

        "vscord.app.name" = "Visual Studio Code";

        "window.commandCenter" = false;

        "workbench.iconTheme" = "material-icon-theme";
      };
    };
  };
}
