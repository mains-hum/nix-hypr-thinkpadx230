{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    configFile.text = ''
      $env.config = {
        show_banner: false
        edit_mode: vi 
        cursor_shape: {
          vi_insert: block
          vi_normal: underscore
        }
      }

      $env.PROMPT_COMMAND = { || 
        let path = ($env.PWD | str replace $env.HOME "~")
        $"(ansi blue)╭─[ (ansi cyan)($path)(ansi blue) ]\n(ansi green)❯ "
      }
      $env.PROMPT_COMMAND_RIGHT = { || "" }

      def ze [] {
        zellij attach -c last
      }

      if "ZELLIJ" not-in ($env | columns) {
          ze
      }

      alias la = ls -a
      alias .. = cd ..
      alias ncgd = sudo nix-collect-garbage -d
      alias ... = cd ../..
      alias gs = git status
      alias ga = git add
      alias gc = git commit
      alias gcl = git clone
      alias gp = git push
      alias gpom = git push origin main
      alias r = sudo nixos-rebuild switch --flake /etc/nixos#nixos
      alias u = sudo nix flake update
      alias scb = sudo cargo build
      alias scr = sudo cargo run
      alias cb = cargo build
      alias cr = cargo run
      alias grep = grep --color=auto
      alias sh = sudo -E hx
      alias h = hx
      alias j = joshuto
      alias s = synapce
      alias c = clear
      alias f = fastfetch
    '';
  };

  programs.starship = {
    enable = true;
    enableNushellIntegration = false;
  };
}
