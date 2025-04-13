(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq make-backup-files nil)
(setq custom-file (locate-user-emacs-file "custom-vars.el"))

(load-theme 'modus-vivendi t)

(set-face-attribute 'default nil
 		      :family "Maple Mono NF"
		    :height 120)

(add-hook 'dired-mode-hook #'dired-hide-details-mode)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(use-package denote
  :ensure t
  :config
  (setq denote-directory "~/Documents/pkm/denote/")
  (setq denote-file-type 'org))

(use-package magit
  :ensure t)

(use-package smartparens
   :ensure t
   :hook (prog-mode text-mode)
   :config
   (require 'smartparens-config))
