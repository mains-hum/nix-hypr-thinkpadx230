{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
  ];

  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "lsd -lah";
      la = "lsd -a";
      ls = "lsd";
      ".." = "cd ..";
      "..." = "cd ../..";
      nvf = "nvim";
      snvf = "sudo --preserve-env=WAYLAND_DISPLAY,XDG_RUNTIME_DIR nvim";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gcl = "git clone";
      gp = "git push";
      gpom = "git push origin main";
      r = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      u = "sudo nix flake update";
      cb = "cargo build";
      cr = "cargo run";
      grep = "grep --color=auto";
      sh = "sudo -E hx";
      h = "hx";
    };

    functions = {
      fish_prompt = {
        body = ''echo "> "'';
      };

      fish_command_not_found = {
        body = ''
          if string match -qr '^[0-9+\-*/.^]+$' $argv[1]
              math $argv[1]
          else
              echo "fish: Unknown command: $argv[1]"
          end
        '';
      };
    };

    interactiveShellInit = ''
      set -g fish_greeting ""
      fastfetch

      bind \ch backward-delete-char # Это стандарт, но если tmux перехватит, будет ок
      bind -e \cj # Отвязываем Ctrl+j
      bind -e \ck # Отвязываем Ctrl+k
      bind -e \cl # Отвязываем Ctrl+l

      function =
          set -l expr (string join ' ' $argv)
          python3 -c "import math; print($expr)"
      end

      function calc
          set -l expr (string join ' ' $argv)
          python3 -c "from math import *; print($expr)"
      end
    '';
  };
}
