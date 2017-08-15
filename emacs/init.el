(package-initialize) ;;Activate all packages

(add-to-list 'load-path "~/.emacs.d/settings/") ;; Set path to dependencies
(add-to-list 'load-path "~/.emacs.d/settings/rainbow-delimiters.el") ;; Set path to rainbow-parentheses
(add-to-list 'load-path "~/.emacs.d/themes/")

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;Load various settings file
(require 'package)
(require 'startup) ;;Start up configuration
(require 'tweaks) ;;Start up configuration
(require 'theme)   ;;Set up colorscheme (Zenburn)
(require 'packinit) ;; Package enables
(require 'packconfig) ;; Package configuration
(require 'rainbow-delimiters) ;; Package configuration
(require 'hooks) ;; Hooks
