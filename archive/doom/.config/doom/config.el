;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq main-font "Maple Mono NF")
;; (setq main-font "Iosevka")
(setq doom-font
      (font-spec :family main-font :size 16 :weight 'semi-light :ligatures t)
      doom-variable-pitch-font (font-spec :family main-font :size 20))

(custom-set-faces '(font-lock-comment-face ((t (:slant italic)))))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)
(setq doom-themes-enable-bold t)
(setq doom-themes-enable-italic t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
;; Disable the title bar in GUI mode (works with most window managers)
(when (display-graphic-p)
  (setq frame-title-format nil)
  (set-frame-parameter nil 'undecorated t))
;; Open Emacs in fullscreen by default
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;;
(setq pkm-directory "~/Documents/pkm")
(setq org-directory (expand-file-name "org" pkm-directory))

;; doom-modeline
(after! doom-modeline
  (setq doom-modeline-major-mode-icon t) ; show an icon for the major mode
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-buffer-encoding t) ; show encoding type
  (setq doom-modeline-buffer-size nil))

(setq minor-mode-alist nil)

;; pdf viewer
(setq auto-mode-alist (rassq-delete-all 'doc-view-mode auto-mode-alist))

(add-to-list 'auto-mode-alist '("\\.pdf\\'" . fundamental-mode))

(add-hook 'find-file-hook
          (lambda ()
            (when (string-match "\\.pdf\\'" buffer-file-name)
              (start-process "open-pdf" nil "xdg-open" buffer-file-name)
              (kill-buffer))))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! dired
  (add-hook 'dired-mode-hook #'dired-hide-details-mode))
(after! dirvish
  (setq dirvish-hide-details t))
;; Denote
(use-package! denote
  :config
  (setq denote-directory (expand-file-name "denote" pkm-directory))
  (setq denote-known-keywords '("emacs" "linux" "nix" "python"))
  (setq denote-file-type 'org)
  (setq denote-prompts '(title keywords))
  (add-hook 'dired-mode-hook #'denote-dired-mode))

;; citar
(use-package citar
  :no-require
  :custom
  (org-cite-global-bibliography (list (expand-file-name "reference/main.bib" pkm-directory)))
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  (citar-bibliography org-cite-global-bibliography)
  ;; optional: org-cite-insert is also bound to C-c C-x C-@
  :bind
  (:map org-mode-map :package org ("C-c b" . #'org-cite-insert)))
