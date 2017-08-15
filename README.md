.bashrc (mostly taken from https://www.linuxquestions.org/questions/linux-general-1/ultimate-prompt-and-bashrc-file-4175518169-print/)

zshrc, dotfiles structure, and tmux theming taken from https://github.com/Parth/dotfiles

Symlinks:

To create a new symlink (will fail if symlink exists already):
`ln -s /path/to/file /path/to/symlink`

To create or update a symlink:
`ln -sf /path/to/file /path/to/symlink`

# vim
`ln -s ~/dotfiles/vim ~/.vim`

`ln -s ~/dotfiles/vim/.vimrc ~/.vimrc`

# nvim
`ln -s ~/dotfiles/nvim ~/.config/nvim`

# .emacs.d
`ln -s ~/dotfiles/.emacs.d/ ~/.emacs.d`

# .bashrc
`ln -s ~/dotfiles/bash/bashrc.sh ~/.bashrc`

`ln -s ~/dotfiles/bash/.bashrc_aliases ~/.bashrc_aliases`

# .zshrc
`ln -s ~/dotfiles/zsh/.oh-my-zsh ~/.oh-my-zsh`

`ln -s ~/dotfiles/zsh/zshrc_manager.sh ~/.zshrc`

# tmux
`ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf`

`ln -s ~/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local`

