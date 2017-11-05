.bashrc (mostly taken from
https://www.linuxquestions.org/questions/linux-general-1/ultimate-prompt-and-bashrc-file-4175518169-print/
)

Tmux and zsh theming and some functionality taken from
https://github.com/Parth/dotfiles. deploy is also from the same source but
modified for better echoing and conditional backups. See
https://www.youtube.com/watch?v=UgDz_9i2nwc for a demonstration of some of these
features.

Deploy has yet to be tested on a clean install. The backup and symlinking
features have been tested.

This setup is only for *nix machines.

Emacs/Spacemacs and zsh are the focus of this configuration. All other tools are
functional and contain somewhat advanced configurations but emacs and zsh are
what I currently use so they're the only configurations currently being
maintained.

# Before deploying

Spacemacs requires that aspell, ispell, and Source Code Pro fonts be installed
to run properly. On macos, run the following commands for aspell and ispell:

`brew install ispell --with-lang-en`
`brew install aspell`

Download the Source Code Pro fonts at the following link and add them to your
font book: https://github.com/adobe-fonts/source-code-pro/downloads

Install Spacemacs. The config files in this repo are created with the intention
of being used alongside Spacemacs and give minimal additional functionality. The
majority of the necessary packages (layers) and configurations are found within
spacemacs http://spacemacs.org/.

The zsh configuration included herein should be completely compatible with Spacemacs.

# deploy.sh

Deploy is a more advanced script which does the following:
1. Makes sure you have zsh, vim, and tmux installed
2. Helps install them if you don't
3. Checks to see if your default shell is zsh
4. Tries to change it if it's not
5. With permission, creates a backup of every config file/dir if none exists. If
   one exists, deploy terminates and the user is asked to handle the backup.
6. With permission, creates symlinks to every root config file or config
   directory (emacs and nvim)

Run deploy using `sh ~/dotfiles/deploy`

# Manually symlinking

To create a new symlink (will fail if symlink exists already):
`ln -s /path/to/file /path/to/symlink`

To create or update a symlink:
`ln -sf /path/to/file /path/to/symlink`

## vim
`ln -s ~/dotfiles/vim ~/.vim`

`ln -s ~/dotfiles/vim/.vimrc ~/.vimrc`

## nvim
`ln -s ~/dotfiles/nvim ~/.config/nvim`

## .bashrc
`ln -s ~/dotfiles/bash/bashrc.sh ~/.bashrc`

## .zshrc
`ln -s ~/dotfiles/zsh/.oh-my-zsh ~/.oh-my-zsh`

`ln -s ~/dotfiles/zsh/zshrc_manager.sh ~/.zshrc`

## tmux
`ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf`

## Spacemacs
`ln -s ~/dotfiles/emacs/spacemacs ~/.spacemacs`
