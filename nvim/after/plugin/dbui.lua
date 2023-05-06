vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_force_echo_notification = 1

vim.keymap.set("n", "<leader>db", ":tab DBUI<CR>", {})
vim.keymap.set("n", "<leader>tq", ":tabclose<CR>")
vim.keymap.set("n", "<leader>dt", ":tab DBUIToggle<CR>")
