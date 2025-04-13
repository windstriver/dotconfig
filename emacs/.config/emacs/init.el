(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(tooltip-mode -1)

(setq make-backup-files nil)

(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(set-face-attribute 'default nil
 		      :family "Maple Mono NF"
		    :height 120)

(load-theme 'modus-vivendi t)

;; Tokyo Night color override
(custom-set-faces
  '(default ((t (:background "#1a1b26" :foreground "#c0caf5"))))
  '(cursor ((t (:background "#c0caf5"))))
  '(font-lock-keyword-face ((t (:foreground "#7aa2f7"))))
  '(font-lock-function-name-face ((t (:foreground "#bb9af7"))))
  '(font-lock-variable-name-face ((t (:foreground "#c0caf5"))))
  '(font-lock-string-face ((t (:foreground "#9ece6a"))))
  '(font-lock-comment-face ((t (:foreground "#565f89" :slant italic))))
  '(font-lock-type-face ((t (:foreground "#2ac3de")))))

(setq-default
  mode-line-format
    '(" "
     (:eval (if (buffer-modified-p) "*" "-"))
     " "
     (:eval (propertize (buffer-name) 'face 'font-lock-keyword-face))
     (:eval (propertize " " 'display '((space :align-to (- right 10)))))
     (:eval (propertize mode-name 'face 'font-lock-function-name-face))))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

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

(use-package smartparens
  :ensure t
  :hook (prog-mode)
  :config
  (require 'smartparens-config))

(add-hook 'dired-mode-hook #'dired-hide-details-mode)

(use-package denote
  :ensure t
  :config
  (setq denote-directory "~/Documents/pkm/denote/")
  (setq denote-file-type 'org))

(use-package magit
  :ensure t)
