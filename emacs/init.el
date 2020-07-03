;;; init.el -- My Emacs configuration
;-*-Emacs-Lisp-*-

;;; Commentary:
;;
;; Migrating from VIM to Emacs? Not sure yet...
;;
;;;

;;; Code:

(setq-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq locale-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(setq package-enable-at-startup nil)
(package-initialize)

;; Setting up the package manager. Install if missing.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t))

;; emacs package
(use-package emacs
  :preface
  (defvar ian/indent-width 2)
  :config
  (setq ring-bell-function 'ignore
        frame-resize-pixelwise t
        default-directory "~/")

  (tool-bar-mode -1)
  (menu-bar-mode -1)

  ;; better scrolling experience
  (setq scroll-margin 0
        scroll-conservatively 101 > 100
        scroll-preserve-screen-position t
        auto-window-vscroll nil)

  ;; Fancy title bar on MacOS
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  ;; Enable line numbers
  (global-linum-mode 1)

  ;; Always use spaces for indentation
  (setq-default indent-tabs-mode nil
                tab-width ian/indent-width))

;; Startup
(use-package "startup"
  :ensure nil
  :config (setq inhibit-startup-screen t))

;; Disable scrollbar
(use-package scroll-bar
  :ensure nil
  :config (scroll-bar-mode -1))

;; Enable column numbers
(use-package simple
  :ensure nil
  :config (column-number-mode +1))

;; better file handling
(use-package files
  :ensure nil
  :config
  (setq confirm-kill-processes nil
        make-backup-files nil))

;; Auto refresh emacs buffer on ext file change
(use-package autorevert
  :ensure nil
  :config
  (global-auto-revert-mode +1)
  (setq auto-revert-interval 2
        auto-revert-check-vc-info t
        global-auto-revert-non-file-buffers t
        auto-revert-verbose nil))

;; Show matching parantheses, quotes, ...
(use-package paren
  :ensure nil
  :init (setq show-paren-delay 0)
  :config (show-paren-mode +1))
(use-package elec-pair
  :ensure nil
  :hook (prog-mode . electric-pair-mode))

;; Cleanup whitespace when saving
(use-package whitespace
  :ensure nil
  :hook (before-save . whitespace-cleanup))
(setq-default show-trailing-whitespace t)

;; Frame settings
(use-package frame
  :preface
  (defun ian/set-default-font ()
    (interactive)
    (when (member "Fira Code" (font-family-list))
      (set-face-attribute 'default nil :family "Fira Code"))
    (set-face-attribute 'default nil
                        :height 130
                        :weight 'normal))
  :ensure nil
  :config
  (setq initial-frame-alist '((fullscreen . maximized)))
  (ian/set-default-font))


;; Lightweight syntax highlighting
(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode))
(use-package highlight-escape-sequences
  :hook (prog-mode . hes-mode))

;; Let's be EVIL :)
(use-package evil
  :diminish undo-tree-mode
  :init
  (setq evil-want-C-u-scroll t
        evil-want-keybinding nil
        evil-shift-width ian/indent-width)
  :hook (after-init . evil-mode)
  :preface
  (defun ian/save-and-kill-this-buffer ()
    (interactive)
    (save-buffer)
    (kill-this-buffer))
  :config
  (with-eval-after-load 'evil-maps ; Make it usable for me
    (define-key evil-insert-state-map (kbd "C-n") nil)
    (define-key evil-insert-state-map (kbd "C-p") nil)
    (define-key evil-normal-state-map (kbd "C-c") 'evil-normal-state)
    (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
    (define-key evil-replace-state-map (kbd "C-c") 'evil-normal-state)
    (define-key evil-visual-state-map (kbd "C-c") 'evil-normal-state))
  (evil-ex-define-cmd "q" #'kill-this-buffer)
  (evil-ex-define-cmd "wq" #'ian/save-and-kill-this-buffer))

;; ... and even more EVIL
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))


;; simulate tpops comment plugin
;; gc + motion comments (gcc for whole line)
(use-package evil-commentary
  :after evil
  :diminish
  :config (evil-commentary-mode +1))

;; provides :diminish
(use-package diminish
  :demand t)

;; on-the-fly syntax checker
(use-package flycheck :config (global-flycheck-mode +1))

;; Helm input completion
(use-package helm
  :ensure t
  :diminish helm-mode
  :commands helm-mode
  :config
  (helm-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (setq helm-grep-ag-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s")
  (setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'")))

;; Project manager
(use-package projectile
  :ensure t
  :defer t
  :config
  (projectile-mode)
  (setq projectile-enable-caching t)
  (setq projectile-project-search-path '("~/projects/" "~/work/" "~/studies")))

;; Projectile helm integration
(use-package helm-projectile
  :ensure t
  :commands (helm-projectile helm-projectile-switch-project))

;; In buffer completion
(use-package company
  :diminish company-mode
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.1
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-frontends '(company-pseudo-tooltip-frontend
                            company-echo-metadata-frontend))
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)))


;; Which key
(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode +1)
  (setq which-key-idle-delay 0.4
        which-key-idle-secondary-delay 0.4))

;; Keybindings - emulate spacemacs
(use-package general
  :ensure t
  :config (general-define-key
  :states '(normal visual insert emacs)
  :prefix "SPC"
  :non-normal-prefix "M-SPC"
  "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
  "SPC" '(helm-M-x :which-key "M-x")
  "wl"  '(windmove-right :which-key "move right")
  "wh"  '(windmove-left :which-key "move left")
  "wk"  '(windmove-up :which-key "move up")
  "wj"  '(windmove-down :which-key "move bottom")
  "w/"  '(split-window-right :which-key "split right")
  "w-"  '(split-window-below :which-key "split bottom")
  "wx"  '(delete-window :which-key "delete window")
  "qz"  '(delete-frame :which-key "delete frame")
  "qq"  '(kill-emacs :which-key "quit")
))

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company diminish evil-commentary highlight-numbers which-key use-package spacemacs-theme spaceline neotree highlight-escape-sequences helm-rg helm-projectile general flycheck evil doom-themes doom-modeline))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
