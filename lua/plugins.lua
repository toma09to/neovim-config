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
    use('whthomason/packer.nvim')

   if PACKER_BOOTSTRAP then
      require('packer').sync()
   end
end)
