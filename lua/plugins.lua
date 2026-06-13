vim.pack.add({
    { src = "https://github.com/alexmozaidze/palenight.nvim" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/nvim-mini/mini.nvim",             version = "stable" }
})
vim.cmd.colorscheme("palenight")

require("mason").setup()

require('mini.hipatterns').setup({
    highlighters = {
        fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
        hack  = { pattern = 'HACK', group = 'MiniHipatternsHack' },
        todo  = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
        note  = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
    }
})

require("mini.indentscope").setup({
    draw = { delay = 0, animation = function() return 0 end },
})
require('mini.indentscope').gen_animation.none()
require('mini.notify').setup()

require('mini.icons').setup()
require('mini.diff').setup()
require('mini.git').setup()
require('mini.statusline').setup()

local MiniPick = require('mini.pick')
local MiniExtra = require('mini.extra')
MiniPick.setup()
MiniExtra.setup()
vim.keymap.set('n', '<leader>pf', function() MiniPick.builtin.files() end, { desc = 'Mini file picker' })
vim.keymap.set('n', '<leader>ps', function() MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") }) end,
    { desc = 'Mini pattern search' })
vim.keymap.set('n', '<leader>vh', function() MiniPick.builtin.help() end, { desc = 'Mini Help' })

vim.keymap.set('n', '<leader>vk', function() MiniExtra.pickers.keymaps() end, { desc = 'Mini Keymaps' })
vim.keymap.set('n', '<leader>di', function() MiniExtra.pickers.diagnostic() end, { desc = 'Mini Keymaps' })

-- mini completions --
local MiniCompletions = require("mini.completion")
MiniCompletions.setup({
    lsp_completion = {
        auto_setup = true,
        process_items = function(items, base)
            return MiniCompletions.default_process_items(items, base, {
                filtersort = "fuzzy",
            })
        end,
    }
})

require("treesitter")
require("lsp")
