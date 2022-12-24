
local imap = require('handelfan.utils').imap
local nmap = require('handelfan.utils').nmap
local vmap = require('handelfan.utils').vmap
imap('jk', '<ESC>')
imap('kj', '<ESC>')
imap('JK', '<ESC>')
imap('KJ', '<ESC>')

vmap('.', '<cmd>norm.<CR>')

vmap('<leader>y', '"+y')
nmap('<leader>y', '"+y')
nmap('<leader>Y', '"+Y')
vmap('<leader>p', '"+p')
nmap('<leader>p', '"+p')
nmap('<leader>P', '"+P')
nmap('<leader>r', ':!fish %<CR>')

nmap('<leader>v', '<cmd>vnew<CR>')
nmap('<leader>n', '<cmd>NvimTreeToggle<CR>')
nmap ('[b', '<cmd>bprevious<CR>')
nmap (']b', '<cmd>bnext<CR>')
nmap ('[B', '<cmd>bfirst<CR>')
nmap (']B', '<cmd>blast<CR>')
nmap ('<c-j>', '<c-w>j') 
nmap ('<c-k>', '<c-w>k') 
nmap ('<c-h>', '<c-w>h') 
nmap ('<c-l>', '<c-w>l') 

vmap ('<c-j>', '<c-w>j') 
vmap ('<c-k>', '<c-w>k') 
vmap ('<c-h>', '<c-w>h') 
vmap ('<c-l>', '<c-w>l') 

--telescope mapping

nmap('<leader>f', '<cmd>Telescope<CR>')
nmap('<leader>ff', '<cmd>Telescope find_files<CR>')
nmap('<leader>fc', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
nmap('<leader>fg', '<cmd>Telescope live_grep<CR>')
nmap('<leader>fr', '<cmd>Telescope resume<CR>')
nmap('<leader>ft', '<cmd>Telescope<CR>')

--Possible helpful future mappings
--'<leader>fr', '<cmd>Telescope oldfiles<CR>')                   --fuzzy
--'<leader>fb', '<cmd>Telescope buffers<CR>')
--'<leader>fs', '<cmd>Telescope treesitter<CR>')
--'<leader>fc', '<cmd>Telescope commands<CR>')
--'<leader>fp', '<cmd>Telescope project<CR>')
--'<leader>fm', '<cmd>Telescope marks<CR>')

--trouble mapping
nmap('<leader>xx', '<cmd>TroubleToggle<cr>')
nmap('<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>')
nmap('<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>')
nmap('<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
nmap('<leader>xl', '<cmd>TroubleToggle loclist<cr>')
nmap('gR', '<cmd>TroubleToggle lsp_references<cr>')
