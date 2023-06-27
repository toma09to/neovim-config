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
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/vim-vsnip'

   if PACKER_BOOTSTRAP then
      require('packer').sync()
   end
end)

require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
    local opt = {
        capabilities = require('cmp_nvim_lsp').update_capabilities(
            vim.lsp.protocol.make_client_capabilities()
            )
        }
    require('lspconfig')[server].setup(opt)
end })

vim.cmd [[
augroup lsp_document_highlight
    autocmd!
    autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]

local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-l>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
    }),
    experimental = {
        ghost_text = true,
    },
})
