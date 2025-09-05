if has('win32') || has('win64')
  let vimrc_file=expand('$HOME/AppData/Local/nvim/vimrc')
else
  let vimrc_file=expand('~/.config/nvim/vimrc')
endif

execute "source " . vimrc_file
