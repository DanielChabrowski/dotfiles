(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
             (cons "melpa-stable" "https://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
             (cons "gnu" "http://elpa.gnu.org/packages/") t)

; activate all the packages
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'package-system)
