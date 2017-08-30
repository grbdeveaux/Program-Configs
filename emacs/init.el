;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(package-initialize) ;;Activate all packages

(add-to-list 'load-path "~/.emacs.d/settings/") ;; Set path to dependencies
(add-to-list 'load-path "/usr/texbin") ;; Set path to tex

(getenv "PATH")
 (setenv "PATH"
(concat
 "/Library/TeX/texbin" ":" ;first string in quotes is the directory (excluding file) given by the CLI command "which latex" https://tex.stackexchange.com/questions/24510/pdflatex-fails-within-emacs-app-but-works-in-terminal

 (getenv "PATH")))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;Load various settings file
(require 'package)
(require 'startup) ;;Start up configuration
(require 'pacman) ;; Package enables
(require 'functions)
(require 'hydras)
(require 'textweaks) ;;Start up configuration
(require 'tweaks) ;;Start up configuration
(require 'hooks) ;; Hooks

;; Magit test
