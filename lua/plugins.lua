-- Install packer automatically
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
    print('Installing packer...')
    vim.cmd([[packadd packer.nvim]])
end

local ok, packer = pcall(require, 'packer')
if not ok then
    return
end

packer.startup(function(use)
    use { 'whthomason/packer.nvim', opt = true }
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'

   if PACKER_BOOTSTRAP then
      require('packer').sync()
   end
end)

local lsp = require('lspconfig')
lsp.rust_analyzer.setup({})
lsp.pyright.setup({})

local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'snippy' },
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-l>'] = cmp.mapping.complete(),
    },
})
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'path' },
        { name = 'cmdline' },
    },
})
