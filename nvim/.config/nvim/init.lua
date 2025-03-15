local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Appearance
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
      vim.cmd.colorscheme('zenbones')

      local fs_poll = vim.loop.new_fs_poll()
      fs_poll:start(os.getenv("HOME") .. "/.dark", 1000, vim.schedule_wrap(function()
        local theme_file = os.getenv("HOME") .. "/.dark"  -- Change this to your file path
        local file = io.open(theme_file, "r")
        if file then
            io.close(file)
            vim.o.background = "dark"
        else
            vim.o.background = "light"
        end
      end))
    end
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
  { "tpope/vim-fugitive" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        highlight = { enable = true },
        indent = { enable = true }
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      -- Enable ts context by default
      require('treesitter-context').setup({ enable = true })
    end
  },

  -- Editing
  {
    "echasnovski/mini.pairs",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = { "goimports", "gofumpt", "gomodifytags", "impl", "cspell", "terraform-ls", "shellcheck" }
    },
    config = function()
      require("mason").setup()
    end
  },
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      "mason.nvim",
      { "rshkarin/mason-nvim-lint"}
    },
    config = function()
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
          -- require("lint").try_lint('cspell')
        end,
      })
    end
  },


  -- Language specific
  {
    "ray-x/go.nvim",
    config = function ()
       require("go").setup()
    end
  },

  -- LSP/Autocomplete
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
          require("mason-lspconfig").setup({
            automatic_installation = true,
          })
        end
      },
      { "saghen/blink.cmp" },
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
        },
        severity_sort = true,
      },
      inlay_hints = {
        enable = true,
      },
      codelens = {
        enabled = true,
      },
      servers = {
        lua_ls = {},
        bashls = {},
        jsonnet_ls = {},
        pyright = {},
        terraformls = {},
        ansiblels = {},
        gopls = {},
      },
      setup = {},
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = {buffer = event.buf}

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end,
      })
    end
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      {"honza/vim-snippets"},
      { "rafamadriz/friendly-snippets" },
    },
    event = "InsertEnter",
    opts = {
      completion = {
        accept = { auto_brackets = { enabled = true } },
        menu = { draw = { treesitter = { "lsp" } } },
        documentation = { auto_show = true, auto_show_delay_ms = 100 },
        ghost_text = { enabled = true },
      },
      signature = { enabled = true },
      fuzzy = { implementation = 'lua' },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      keymap = {
        preset = "enter",
        ["C-y"] = { "select_and_accept"},
      },
    },
    config = function(_, opts)
      require("blink.cmp").setup(opts)
    end
  },

  {
    "ibhagwan/fzf-lua",
    opts = {},
    config = function ()
      require('fzf-lua').setup({'fzf-vim'})
    end
  }

  -- { "github/copilot.vim" },
})

-- UI Settings
vim.opt.termguicolors = true

-- Editing Behavior
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.scrolloff = 4
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Nice way to fold multi-stage dockerfiles; credit to @jzck
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dockerfile",
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "get(split(getline(v:lnum)), 0, '') == 'FROM' ? '>1' : '='"
  end,
})

-- Better Keymaps
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", { noremap = true })
