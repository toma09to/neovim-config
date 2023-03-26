local option = { noremap = true, silent = true }
local keymaps = {
   {'', '<Space>', '<Nop>', option},
   {'n', 'U', '<C-r>', option},
   {'n', '<C-h>', '<C-w>h', option},
   {'n', '<C-j>', '<C-w>j', option},
   {'n', '<C-k>', '<C-w>k', option},
   {'n', '<C-l>', '<C-w>l', option},
   {'n', '<Space>w', ':w<CR>', option},
}

for _, v in ipairs(keymaps) do
   vim.api.nvim_set_keymap(v[1], v[2], v[3], v[4])
end
