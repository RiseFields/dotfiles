return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                auto_install = true,
                handlers = {
                    function(server_name)
                        -- Add completion capabilities to added lsp's
                        local capabilities = require("cmp_nvim_lsp").default_capabilities()
                        -- Configure lsp
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            vim.opt.signcolumn = "yes"

            -- This is where you enable features that only work
            -- if there is a language server active in the file
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gK", vim.diagnostic.open_float, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol, opts)
                    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, opts)
                    vim.keymap.set("n", "<leader>N", vim.diagnostic.goto_prev, opts)
                    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
                    vim.keymap.set({ "n", "x" }, "<leader>=", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
                end,
            })

            -- Keep errors when typing
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = true,
            })

            vim.lsp.config('pylsp', {
                settings = {
                    pylsp = {
                        plugins = {
                            pylsp_mypy = { enabled = true },
                            pycodestyle = {
                                ignore = { 'W391', 'E501' },
                                maxLineLength = 120
                            }
                        }
                    }
                }
            })
        end,
    },
}
