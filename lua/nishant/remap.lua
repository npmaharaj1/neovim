vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "jk", "<Esc>")

-- move text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- remove upcoming line break and indent
vim.keymap.set("n", "J", "mzJ`z")

-- page up and down while staying in middle
vim.keymap.set("n", "M", "<C-d>zz")
vim.keymap.set("n", "U", "<C-u>zz")

-- search while staying in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- replace paste without losing
vim.keymap.set("x", "<leader>p", "\"_dP")

-- choose between system clipboard and nvim
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- todo tmux
vim.keymap.set("n", "<leader>tf", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- quickfix stuff
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>kk", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>jj", "<cmd>lnext<CR>zz")

-- quick find a replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- quick chmod
vim.keymap.set("n", "<leader>x", "<cmd>!chmod u+x %<CR>", { silent = true })

-- Definition
vim.keymap.set("n", "<leader>d", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true})
