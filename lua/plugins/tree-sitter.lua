return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {'python', 'lua', 'vim','javascript', 'typescript', 'rust', 'go', 'html', 'css', 'json', 'cpp', 'c'}  
}