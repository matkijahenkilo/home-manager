{ pkgs, ... }:

{
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.username = "marisa";
  home.homeDirectory = "/home/marisa";
  home.packages = [ ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {

    # Important
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "matkijahenkilo";
      userEmail = "matkija.henkilo@gmail.com";
    };

    neovim =
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        clang
        fd
        ripgrep

        # Clipboard
        wl-clipboard
        xclip

        # Commonly used LSPs
        clang-tools
        jdt-language-server
        lua-language-server
        nixd
        pyright
        texlab
      ];

      extraLuaPackages = lps: with lps; [
        luautf8
        jsregexp
      ];

      plugins = with pkgs.vimPlugins; [

        {
          plugin = gruvbox-nvim;
          config = "colorscheme gruvbox";
        }

        neodev-nvim

        cmp-buffer
        cmp-cmdline
        cmp-conjure
        cmp_luasnip
        cmp-nvim-lsp
        cmp-path
        cmp-rg
        cmp-treesitter
        nvim-cmp 
        {
          plugin = nvim-cmp;
          config = toLuaFile ./modules/neovim/plugins/cmp.lua;
        }

        {
          plugin = telescope-nvim;
          config = toLuaFile ./modules/neovim/plugins/telescope.lua;
        }
        telescope-fzy-native-nvim

        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./modules/neovim/plugins/lsp.lua;
        }

        {
          plugin = comment-nvim;
          config = toLua "require(\"Comment\").setup()";
        }

        luasnip
        friendly-snippets

        lualine-nvim
        lualine-lsp-progress
        nvim-web-devicons

        plenary-nvim
        markdown-preview-nvim
        Coqtail
        conjure
        emmet-vim
        symbols-outline-nvim
        nvim-web-devicons
        vimspector
        undotree
        nerdcommenter
        tagbar
        vim-fugitive
      ];

      extraLuaConfig = ''
        ${builtins.readFile ./modules/neovim/options.lua}
      '';
    };

    # kitty = {
    #   enable = true;
    #   font = {
    #     package = pkgs.nerdfonts;
    #     name = "Fira Code nerd Font Mono";
    #     size = 11;
    #   };
    #   settings = {
    #     background_opacity = "0.85";
    #     background_blur = "3";
    #   };
    # };

    fish = {
      enable = true;
      functions = {
        asd = {
          body = "yt-dlp -f mp4 $argv[1]";
          onEvent = "Ran yt-dlp";
        };
      };
    };

    fastfetch.enable = true;
  };
}
