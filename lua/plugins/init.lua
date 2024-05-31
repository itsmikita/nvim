-- Use can put your plugins here or use Activate to install it in 
-- this folder but different files, this does not really matter as 
-- long as it is the same folder (lua/pugins/)

return {
  {
    "roobert/activate.nvim",
    keys = {
      {
        "<leader>P",
        '<CMD>lua require("activate").list_plugins()<CR>',
        desc = "Plugins",
      },
    },
    dependencies = {
      { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } }
    }
  },
  
  -- add plugins below here
  
}
