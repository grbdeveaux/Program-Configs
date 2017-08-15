Symlinks:

To create a new symlink (will fail if symlink exists already):

ln -s /path/to/file /path/to/symlink

To create or update a symlink:

ln -sf /path/to/file /path/to/symlink

# nvim:
ln -s ~/dotfiles/nvim ~/.config/nvim

# .emacs.d:
ln -s ~/dotfiles/.emacs.d/ ~/.emacs.d

# .bashrc:
ln -s ~/dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/dotfiles/bash/.bashrc_aliases ~/.bashrc_aliases

# .zshrc:
ln -s ~/dotfiles/zsh/.oh-my-zsh ~/.oh-my-zsh
ln -s ~/dotfiles/zsh/zshrc_manager.sh ~/.zshrc

# tmux:
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local
