return {
    "nvim-lua/plenary.nvim",
    "tpope/vim-fugitive",
    "nvim-tree/nvim-web-devicons",
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
    },
    {
        "f4z3r/gruvbox-material.nvim",
        name = 'gruvbox-material',
        lazy = false,
        priority = 1000,
    },
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000
    },
    {
        "windwp/nvim-spectre",
        keys = {
            { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        opts = {
            defaults = {
                -- lua regex indicating what file to ignore
                file_ignore_patterns = { "%.git/" },
                -- Default values except for --hidden
                vimgrep_arguments = {
                    "rg", "--color=never", "--no-heading", "--with-filename",
                    "--line-number", "--column", "--smart-case", "--no-binary",
                    "--hidden" -- Search also hidden files
                },
            },
            pickers = {
                find_files = { theme = "dropdown", previewer = false, hidden = true },
                buffers = {
                    theme = "dropdown",
                    previewer = false,
                    -- Ignore the No Name buffer
                    -- Ignore the buffer opening nvim with "nvim ."
                    file_ignore_patterns = { "^%[No Name%]$", "^%.$" }
                }
            }
        },
        keys = {
            { "<leader>o",  "<cmd>lua require('telescope.builtin').find_files()<cr>",  desc = "Find files" },
            { "<leader>b",  "<cmd>lua require('telescope.builtin').buffers()<cr>",     desc = "Find buffers" },
            { "<leader>fs", "<cmd>lua require('telescope.builtin').live_grep()<cr>",   desc = "Find string" },
            { "<leader>fu", "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = "Find word under the cursor" },
            { "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>",     desc = "Find keymap" },
        },
    },
}
