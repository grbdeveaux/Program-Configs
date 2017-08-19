;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(package-initialize) ;;Activate all packages

(add-to-list 'load-path "~/.emacs.d/settings/") ;; Set path to dependencies

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;Load various settings file
(require 'package)
(require 'startup) ;;Start up configuration
(require 'tweaks) ;;Start up configuration
(require 'pacman) ;; Package enables
(require 'rainbow-delimiters) ;; Package configuration
(require 'functions)
(require 'hydras)
(require 'hooks) ;; Hooks
