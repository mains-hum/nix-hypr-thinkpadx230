{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  programs.nvf = {
    enable = true;

    settings.vim.extraPackages = with pkgs; [
      wl-clipboard
      ripgrep
      fd
      lazygit
      rust-analyzer
      rustc
      cargo
      nil
    ];

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      languages = {
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        rust = {
          enable = true;
          extensions.crates-nvim.enable = true;
        };
        nix.enable = true;
        python.enable = true;
      };

      lsp = {
        enable = true;
        formatOnSave = true;
        lspkind.enable = true;
        lightbulb.enable = true;
      };

      autocomplete.nvim-cmp = {
        enable = true;
        setupOpts = {
          window = {
            completion.border = "rounded";
            documentation.border = "rounded";
          };
          sources = lib.mkForce [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
        };
      };

      statusline.lualine = {
        enable = true;
        setupOpts = {
          options = {
            component_separators = {
              left = "";
              right = "";
            };
            section_separators = {
              left = "";
              right = "";
            };
            globalstatus = true;
          };
        };
      };

      ui = {
        colorizer.enable = true;
        noice.enable = lib.mkForce false;
        borders.enable = true;
      };

      dashboard.alpha.enable = true;
      terminal.toggleterm = {
        enable = true;
        lazygit.enable = true;
        setupOpts.direction = "float";
        mappings.open = "<C-t>";
      };

      visuals.indent-blankline.enable = true;
      notes.todo-comments.enable = true;
      utility.motion.hop.enable = true;
      utility.surround.enable = true;

      startPlugins = with pkgs.vimPlugins; [
        trouble-nvim
      ];

      luaConfigRC.troubleSetup = ''
        require("trouble").setup()
      '';

      luaConfigRC.clipboard = ''
        vim.opt.clipboard = "unnamedplus"
        vim.opt.termguicolors = true 
      '';

      luaConfigRC.customColors = ''
        local function apply_nordic_setup()
          local colors = {
            bg      = "#242933",
            bg_dark = "#1e232b",
            fg      = "#eceff4",
            green   = "#a3be8c",
            blue    = "#81a1c1",
            yellow  = "#ebcb8b",
            magenta = "#b48ead",
            cyan    = "#88c0d0",
            grey    = "#4c566a", 
          }

          vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = "NONE" })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.bg_dark })
          vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.cyan, bg = colors.bg_dark })
          vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = colors.bg, bg = "NONE" })
          vim.api.nvim_set_hl(0, "NonText", { fg = colors.bg }) 

          vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.bg_dark, fg = colors.fg })
          vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.cyan, fg = colors.bg_dark, bold = true })
          vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.bg_dark })
          vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.grey })

          vim.api.nvim_set_hl(0, "Comment", { fg = colors.grey, italic = true })
          vim.api.nvim_set_hl(0, "Constant", { fg = colors.yellow })
          vim.api.nvim_set_hl(0, "String", { fg = colors.green })
          vim.api.nvim_set_hl(0, "Identifier", { fg = colors.fg })
          vim.api.nvim_set_hl(0, "Function", { fg = colors.blue, bold = true })
          vim.api.nvim_set_hl(0, "Statement", { fg = colors.magenta })
          vim.api.nvim_set_hl(0, "Keyword", { fg = colors.magenta, italic = true })
          vim.api.nvim_set_hl(0, "PreProc", { fg = colors.cyan })
          vim.api.nvim_set_hl(0, "Type", { fg = colors.blue })
          vim.api.nvim_set_hl(0, "Operator", { fg = colors.cyan })

          vim.api.nvim_set_hl(0, "StatusLine", { bg = colors.bg_dark, fg = colors.fg })
          
          local groups = {"a","b","c","x","y","z"}
          for _, s in ipairs(groups) do
            vim.api.nvim_set_hl(0, "lualine_"..s.."_normal", { bg = colors.bg_dark, fg = colors.fg })
            vim.api.nvim_set_hl(0, "lualine_"..s.."_insert", { bg = colors.bg_dark, fg = colors.cyan })
            vim.api.nvim_set_hl(0, "lualine_"..s.."_visual", { bg = colors.bg_dark, fg = colors.magenta })
            vim.api.nvim_set_hl(0, "lualine_"..s.."_command", { bg = colors.bg_dark, fg = colors.yellow })
            vim.api.nvim_set_hl(0, "lualine_"..s.."_replace", { bg = colors.bg_dark, fg = colors.green })
            vim.api.nvim_set_hl(0, "lualine_"..s.."_inactive", { bg = colors.bg_dark, fg = colors.grey })
          end

          vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = colors.blue, bold = true })
          vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = colors.blue })
          vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = colors.fg })
          vim.api.nvim_set_hl(0, "NeoTreeExpander", { fg = colors.grey })
          vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = colors.magenta, bold = true })
        end

        vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "*",
          callback = apply_nordic_setup,
        })
        apply_nordic_setup()
      '';

      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          close_if_last_window = true;
          window.width = 30;
          filesystem.filtered_items.hide_dotfiles = false;
        };
      };

      telescope.enable = true;
      treesitter = {
        enable = true;
        highlight.enable = true;
        fold = true;
        context.enable = false;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
      };

      autopairs.nvim-autopairs.enable = true;
      binds.whichKey.enable = true;
      lineNumberMode = "relNumber";

      maps.normal = {
        "<leader>e" = {
          action = ":Neotree toggle<CR>";
          silent = true;
        };
        "<leader>ff" = {
          action = ":Telescope find_files<CR>";
        };
        "L" = {
          action = ":bnext<CR>";
        };
        "H" = {
          action = ":bprevious<CR>";
        };
        "<leader>w" = {
          action = ":w<CR>";
        };
        "<leader>q" = {
          action = ":q<CR>";
        };
        "gd" = {
          action = "vim.lsp.buf.definition";
          lua = true;
        };
        "K" = {
          action = "vim.lsp.buf.hover";
          lua = true;
        };
        "<leader>rn" = {
          action = "vim.lsp.buf.rename";
          lua = true;
        };
        "<leader>ca" = {
          action = "vim.lsp.buf.code_action";
          lua = true;
        };
        "<leader>xx" = {
          action = ":Trouble toggle<CR>";
        };
        "<leader>gg" = {
          action = ":lazygit<CR>";
        };
      };

      maps.insert = {
        "jk" = {
          action = "<Esc>";
        };
      };
      maps.visual = {
        "<leader>y" = {
          action = "\"+y";
        };
      };
    };
  };
}
