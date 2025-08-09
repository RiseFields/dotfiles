return {
    "ibhagwan/fzf-lua",
    dependencies = {
        -- "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local fzf = require("fzf-lua")
        fzf.setup {
            -- { "telescope" },
            keymap = {
                builtin = {
                    ['<C-u>'] = 'preview-page-up',
                    ['<C-d>'] = 'preview-page-down',
                },
                fzf = {
                    ['ctrl-k'] = 'up',
                    ['ctrl-j'] = 'down',
                    ['ctrl-c'] = 'abort',
                },
                files = {
                    fd_opts = '--type f --hidden --exclude .git --exclude .venv --exclude build --exclude .cache',
                    previewer = 'builtin',
                },
                buffers = {
                    sort_lastused = true,
                    previewer = 'builtin',
                },
                grep = {
                    cmd = 'rg --line-number --column --no-heading --color=always --smart-case',
                    rg_opts = '--hidden --glob "!node_modules/*" --glob "!.git/*" --glob "!.venv/*"',
                    previewer = 'builtin',
                },
                live_grep = {
                    cmd = 'rg --line-number --column --no-heading --color=always --smart-case',
                    rg_opts = '--hidden --glob "!node_modules/*" --glob "!.git/*" --glob "!.venv/*"',
                    previewer = 'builtin',
                },
                git = {
                    files = {
                        previewer = true,
                    },
                },
                fzf_opts = {
                    ['--tiebreak'] = 'index',
                },
                defaults = {
                    git_icons = true,
                    file_icons = true,
                    color_icons = true,
                },
            }
        }
        vim.keymap.set("n", "<leader>mf", fzf.files, { desc = "Find files using telescope" })
        vim.keymap.set("n", "<leader>mo", fzf.oldfiles, { desc = "Find recently opened files" })
        vim.keymap.set("n", "<leader>mg", fzf.git_files, { desc = "Find git files" })
        vim.keymap.set("n", "<leader>mb", fzf.buffers, { desc = "Find buffers" })
        vim.keymap.set("n", "<leader>ms", fzf.live_grep, { desc = "Search by Grep" })
        vim.keymap.set("n", "<leader>mcw", fzf.grep_cword, { desc = "Search current word" })
        vim.keymap.set("n", "<leader>mcW", fzf.grep_cWORD, { desc = "Search current WORD" })
        vim.keymap.set("n", "<leader>mr", fzf.resume, { desc = "Search Resume" })
        vim.keymap.set("n", "<leader>md", fzf.diagnostics_document, { desc = "Search Diagnostics" })
        vim.keymap.set("n", "<leader>qf", fzf.quickfix, { desc = "Show quick fix list" })
        vim.keymap.set({ "n", "v", "i" }, "<C-f>",
            function() require("fzf-lua").complete_path() end,
            { silent = true, desc = "Fuzzy complete path" })
        vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "Find existing buffers" })
        vim.keymap.set('n', '<leader>/', function()
            fzf.live_grep { buffers_only = true, prompt = 'Live Grep in Open Files> ' }
        end, { desc = '[S]earch [/] in Open Files' })
        vim.keymap.set('n', '<leader>s', function()
            fzf.blines { previewer = false }
        end, { desc = 'Fuzzily search in current buffer' })
    end,
}
