;; Custom set variable should go in after-init.el
(setq custom-file "~/.emacs.d/after-init.el")

;; Variables
(defconst ox-modules-dir (locate-user-emacs-file "modules"))

;; Add path for modules
(add-to-list 'load-path ox-modules-dir)

;; Load modules
(require 'package-system)
(require 'window-manager)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package undo-tree
  :ensure t)

(use-package ac-clang
  :ensure t)

(use-package cmake-project
  :ensure t)

(use-package ace-window
  :ensure t)

(global-undo-tree-mode)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-w") 'kill-this-buffer)

;; don't use tabs for indent
(setq-default indent-tabs-mode nil)

;; Enable CUA mode
(cua-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (undo-tree which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
