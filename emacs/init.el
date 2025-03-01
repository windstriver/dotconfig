;; History
;; 2025-03-01 started
;; 2025-03-01 ui, icomplete, completion-preview
;; 2025-03-01 doom-modeline, magit, smartparens, denote

;; package
(require 'package)
(add-to-list 'package-archives
	     '(("melpa-stable" . "https://stable.melpa.org/packages/")
	       ("org" . "https://orgmode.org/elpa/")))
(package-initialize)

;; UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

(setq inhibit-startup-screen t)
(setq visible-bell nil)
(setq tooltip-mode nil)
(setq use-dialog-box nil)

(global-hl-line-mode 1)
(global-display-line-numbers-mode 1)
(setq-default truncate-lines t)

;; font
(set-face-attribute 'default nil
		    :family "Iosevka"
		    :height 120)

;; theme
(load-theme 'modus-operandi t)
;(load-theme 'modus-vivendi)

;; modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; history
(recentf-mode 1)
(setq history-length 25)
(savehist-mode 1)
(save-place-mode 1)

;; backup
(setq make-backup-files nil)

;; cutom variables
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; dired
(add-hook 'dired-mode-hook #'dired-hide-details-mode)

;; org mode
(setq org-agenda-files '("~/GitHub/pkm/org/gtd.org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; treesit
(setq treesit-language-source-alist
    '((python "https://github.com/tree-sitter/tree-sitter-python")))
;(treesit-language-available-p 'elisp)
(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)))


;; completion
(use-package which-key
  :ensure nil
  :config
  (which-key-mode))

(use-package icomplete
  :ensure nil
  :init
  (setq icomplete-separator "\n"
	icomplete-hide-common-prefix nil
	icomplete-prospects-height 10)
  :config
  (add-hook 'minibuffer-setup-hook #'icomplete-vertical-mode))

(use-package completion-preview
  :ensure nil
  :hook (prog-mode . completion-preview-mode))

;; Denote
(use-package denote
  :ensure t
  :config
  (setq denote-directory "~/GitHub/pkm/denote/")
  (setq denote-file-type 'org))

;; Magit
(use-package magit
  :ensure t)

;; smartparens
(use-package smartparens
  :ensure t
  :hook (prog-mode text-mode)
  :config
  (require 'smartparens-config))
