(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(package-selected-packages
   (quote
    (gitlab-ci-mode-flycheck gitlab-ci-mode cmake-mode smart-mode-line racer flycheck-rust rust-mode visual-regexp undo-tree highlight-symbol neotree dockerfile-mode magit py-autopep8 elpy cff xclip buffer-move move-text zoom-window flycheck-clang-tidy crux goto-line-preview smartparens clang-format yasnippet helm helm-swoop company-lsp company ccls lsp-ui lsp-mode))))

;; Disable GC for startup
(setq gc-cons-threshold (* 500 1024 1024)
      gc-cons-percentage 0.6)

;; Restore GC default values
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024)
                  gc-cons-percentage 0.1)))

(add-hook 'emacs-startup-hook
          (lambda ()
            (message (format "Emacs startup time: %s" (emacs-init-time)))))

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))

(package-initialize)
(package-install-selected-packages)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

(setq-default indent-tabs-mode nil) ;; disable tabs
(setq-default truncate-lines 0) ;; disable line wrap

(setq default-tab-width 4)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)

(setq projectile-project-search-path '("~/projects/"))

(cua-mode t) ;; enable cua-mode
(menu-bar-mode -1) ;; disable menu bar
(global-display-line-numbers-mode) ;; show line numbers
(show-paren-mode) ;; enable paren matching

(column-number-mode t)
(line-number-mode t)

(setq sml/theme 'dark)
(smart-mode-line-enable t)
(display-time-mode 0)

(add-hook 'dired-mode-hook 'hl-line-mode)

(load "~/projects/fzf.el/fzf.el")

;; environment
(setenv "FZF_DEFAULT_COMMAND" "rg --files --hidden -g '!.*/' -g '![Bb]uild/' -g '!.o'")

;; key bindings
(global-set-key (kbd "C-k") 'fzf-projectile)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-w") 'kill-current-buffer)
(global-set-key (kbd "C-x C-c") 'kill-emacs)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(global-set-key (kbd "<f2>") 'xref-find-definitions)
(global-set-key (kbd "<f3>") 'xref-find-references)
(global-set-key (kbd "<f5>") 'projectile-compile-project)
(global-set-key (kbd "<f6>") 'helm-do-grep-ag)

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-<up>") (lambda()
    (interactive)
    (scroll-down 4)))

(global-set-key (kbd "C-<down>") (lambda()
    (interactive)
    (scroll-up 4)))

(require 'helm)
(helm-mode 1)
(setq helm-follow-mode-persistent t)
(setq helm-buffer-max-length nil)
(setq helm-grep-ag-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s")
(setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'"))
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "M-x") 'helm-M-x)

(require 'helm-swoop)
(setq helm-swoop-use-fuzzy-match t)
(global-set-key (kbd "C-f") 'helm-swoop-without-pre-input)

(require 'move-text)
(global-set-key (kbd "C-S-<up>") 'move-text-up)
(global-set-key (kbd "C-S-<down>") 'move-text-down)

(require 'buffer-move)
(global-set-key (kbd "M-<up>") 'buf-move-up)
(global-set-key (kbd "M-<down>") 'buf-move-down)
(global-set-key (kbd "M-<left>") 'buf-move-left)
(global-set-key (kbd "M-<right>") 'buf-move-right)

(require 'goto-line-preview)
(global-set-key (kbd "C-l") 'goto-line-preview)

(require 'visual-regexp)

(require 'zoom-window)
(global-set-key (kbd "C-x z") 'zoom-window-zoom)

(require 'crux)
(global-set-key (kbd "S-<delete>") 'crux-kill-whole-line)
(global-set-key (kbd "C-d") 'crux-duplicate-current-line-or-region)

(require 'cff)
(global-set-key (kbd "<f4>") 'cff-find-other-file)

(require 'smartparens)
(smartparens-global-mode)

(require 'xclip)
(xclip-mode 1)

(require 'company-lsp)
(push 'company-lsp company-backends)
(setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)

;; all languages
(setq xref-prompt-for-identifier '(not xref-find-definitions xref-find-definitions-other-window xref-find-definitions-other-frame xref-find-references))

(require 'flycheck)
(setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-gcc c/c++-cppcheck))
(global-flycheck-mode)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'yasnippet)
(add-hook 'after-init-hook 'yas-global-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; python config
(elpy-enable)

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; c++ config
(defun my-c-mode-hook()
  (require 'ccls)
  (setq ccls-executable "/usr/local/bin/ccls")

  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-enable-file-watchers nil)
  (lsp)
  (lsp-mode)

  (global-set-key (kbd "<f2>") 'lsp-find-definition)
  (global-set-key (kbd "<f3>") 'lsp-find-references)
)
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

(defun clang-format-buffer-when-used()
  "Only use clang-format when it's in the project root."
  (when (locate-dominating-file "." ".clang-format")
    (clang-format-buffer))
  ;; Evaluate to nil, else the file is considered already saved.
  nil)
(add-hook 'c++-mode-hook
  (lambda () (add-to-list 'write-contents-functions 'clang-format-buffer-when-used)))

;; dockerfile
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; yaml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(setq gdb-many-windows t
      gdb-use-separate-io-buffer t)

(advice-add 'gdb-setup-windows :after
            (lambda () (set-window-dedicated-p (selected-window) t)))


(advice-add 'gud-sentinel :after
            (lambda (proc msg)
              (when (memq (process-status proc) '(signal exit))
                (jump-to-register gud-window-register)
                (bury-buffer))))

(add-hook 'rust-mode-hook #'flycheck-rust-setup)

(defun rust-setup()
    (racer-mode)
    (global-set-key (kbd "<f2>") 'racer-find-definition)
    (setq rust-format-on-save t)
)
(add-hook 'rust-mode-hook 'rust-setup)
