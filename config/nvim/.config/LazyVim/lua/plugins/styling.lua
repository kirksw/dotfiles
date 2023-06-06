return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local logo = [[ 
  ⠀⠀⠀⢠⣶⠶⠶⣦⣀⣴⡶⠿⠿⠷⣦⣤⣶⠾⠿⠿⢶⣦⣀⣴⡶⠾⠷⢶⣦⡀
  ⠀⠀⣰⡿⠁⠀⢀⣿⡿⠁⠀⠀⠀⠀⡸⠋⠀⠀⡀⠀⠀⢹⡟⠁⠀⢀⠀⠀⠹⣷
  ⠀⢠⡿⠁⠀⠀⣼⡿⠁⠀⠠⠶⢿⣿⠁⠀⢀⣾⣇⣀⣠⡞⠀⠀⢰⣿⠀⠀⢰⣿
  ⢀⣿⠃⠀⠀⣼⣿⠃⠀⠀⠀⠀⣸⠃⠀⠀⡾⠁⠀⠈⣿⠁⠀⢠⣿⠇⠀⠀⣼⡇
  ⣸⡏⠀⠀⠰⠿⡟⠀⠀⠸⠿⠿⣿⠀⠀⢸⣿⠂⠀⢀⡏⠀⠀⣼⡟⠀⠀⣰⡿⠀
  ⣿⡇⠀⠀⠀⢀⣧⠀⠀⠀⠀⢀⣿⡀⠀⠀⠀⠀⣠⣾⣇⠀⠀⠀⠀⢀⣴⡿⠁⠀
  ⠘⠿⣶⣶⡶⠿⠻⠷⣶⣶⡶⠿⠛⠿⣶⣶⣶⠿⠛⠉⠻⠷⣶⣶⡶⠿⠋⠀⠀⠀
      ]]

      opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
