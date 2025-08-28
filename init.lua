
-- PACKER: plugin manager
--
require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'          -- Packer itself
  use 'neovim/nvim-lspconfig'           -- LSP configs
  use 'hrsh7th/nvim-cmp'                -- Autocomplete engine
  use 'hrsh7th/cmp-nvim-lsp'            -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'              -- Buffer words source
  use 'hrsh7th/cmp-path'                -- File paths
  use 'saadparwaiz1/cmp_luasnip'        -- Snippets source
  use 'L3MON4D3/LuaSnip'                -- Snippet engine
  use 'windwp/nvim-autopairs'           -- auto bracket
  use 'lervag/vimtex'                   -- Best LaTeX plugin (syntax, compile, TOC, etc.)
  use 'ltex-plus/vscode-ltex'           -- Grammar + spellcheck (optional, for English writing)
  use 'iurimateus/luasnip-latex-snippets.nvim'  -- Latex Snippet 
  use 'tanvirtin/monokai.nvim'          -- Monokai theme
  
 
  use 'rafamadriz/friendly-snippets'
  -- NNN FileExplorer
  use {
  "luukvbaal/nnn.nvim",

  config = function()
    require("nnn").setup({
      explorer = {
	icons = true,
        width = 24,
        side = "topleft",
        tabs = true,
      },
      picker = {
        style = {
          width = 0.9,
          height = 0.8,
          xoffset = 0.5,
          yoffset = 0.5,
          border = "rounded",
        },
	icons = true,
        tabs = true,
        fullscreen = true,
      },
      auto_open = {
        setup = nil,
        tabpage = nil,
        empty = false,
        ft_ignore = { "gitcommit" },
      },
      windownav = { 
        left = "<C-w>h",
        right = "<C-w>l",
        next = "<C-w>w",
        prev = "<C-w>W",
      },
    })
  end
}


end)


-- LSP SETUP

local kmap = vim.keymap.set 
local lspconfig = require('lspconfig')

-- List of LSP servers to enable
local servers = { 'pyright', 'ts_ls', 'rust_analyzer', 'bashls', 'texlab' }  -- add more if needed

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end




-- nvim-cmp setup 

local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  })
})



-- Basic autopairs  

require('lspconfig').bashls.setup{}
require('nvim-autopairs').setup{}
require'luasnip-latex-snippets'.setup()
require('lspconfig').texlab.setup{}
require('monokai').setup {
  palette = require('monokai').pro, -- or .soda, .ristretto
}
require("luasnip.loaders.from_vscode").lazy_load()





-- Integrate autopairs with autocomplete

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())


-- KNAP Settings 

local gknapsettings = {
    -- LaTeX settings
    texoutputext = "pdf",
    textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
    textopdfviewerlaunch = "mupdf %outputfile%",
    textopdfviewerrefresh = "kill -HUP %pid%",
    -- Markdown → HTML
    mdoutputext = "html",
    mdtohtml = "pandoc %docroot% -s -o %outputfile%",
    mdtohtmlviewerlaunch = "firefox %outputfile%",
    mdtohtmlviewerrefresh = "kill -HUP %pid%",
    -- Delay (ms) before auto-processing
    delay = 250
}


-- Optional settings

vim.o.completeopt = "menuone,noinsert,noselect"
vim.cmd('filetype plugin indent on')
vim.cmd[[colorscheme monokai]]

-- Absolute line numbers
vim.opt.number = true
-- Optional: relative numbers
vim.opt.relativenumber = true


-- KeyBindings 


kmap({ 'n', 'v', 'i' }, '<F5>', function() require("knap").process_once() end)
-- F6: close viewer
kmap({ 'n', 'v', 'i' }, '<F6>', function() require("knap").close_viewer() end)
-- F7: toggle auto-preview
kmap({ 'n', 'v', 'i' }, '<F7>', function() require("knap").toggle_autopreviewing() end)
-- F8: forward jump (for LaTeX SyncTeX)
kmap({ 'n', 'v', 'i' }, '<F8>', function() require("knap").forward_jump() end)
vim.g.knap_settings = gknapsettings
vim.g.knap_filetypes = { "markdown", "pandoc", "html", "tex" }

-- NNN Explorer Mode
vim.api.nvim_set_keymap('n', '<C-A-n>', '<cmd>NnnExplorer<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-A-n>', '<cmd>NnnExplorer<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-n>', '<cmd>NnnExplorer %:p:h<CR>', { noremap = true, silent = true })

-- Picker Mode
vim.api.nvim_set_keymap('n', '<C-A-p>', '<cmd>NnnPicker<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-A-p>', '<cmd>NnnPicker<CR>', { noremap = true, silent = true })


