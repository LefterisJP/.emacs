;; This is only needed once, near the top of the file
(eval-when-compile
  (add-to-list 'load-path "home/lefteris/.emacs.d/elpa/use-package-2.4.5.")
  (require 'use-package))

(use-package f :ensure t)

(use-package anzu
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/anzu.el"))

(use-package ag
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/ag.el"))

(use-package highlight-indentation
  :ensure t
  :config
  (setq highlight-indentation-current-column nil))

(use-package highlight-symbol
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/highlight-symbol.el"))

(use-package solarized-theme
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/solarized-emacs.el"))

(use-package markdown-mode
  :ensure t
  :mode ("README\\.,d\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package rainbow-delimiters
  :ensure t
  :hook (c-mode-common . 'rainbow-delimiters-mode)
  :hook (python-mode . 'rainbow-delimiters-mode))

(use-package org
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/org-mode.el"))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-jedi
  :ensure t
  :config
  (add-hook 'python-mode-hook 'company-jedi))

(use-package elpy
  :after (company-jedi)
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/elpy.el"))

(use-package lsp-mode
  :after (elpy)  ;; needed for the python hook
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/lsp-mode.el"))

(use-package lsp-pyright
  :after (lsp-mode)
  :ensure t
  :config
  (setq lsp-pyright-venv-path "/home/lefteris/.virtualenvs"))

(use-package expand-region
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/expand-region.el"))

(use-package ace-jump-mode
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/ace-jump-mode.el"))

(use-package flycheck
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/flycheck.el"))

(use-package magit
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/magit.el"))

(use-package dockerfile-mode
  :ensure t)

(use-package helm
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/helm.el"))

(use-package projectile
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/projectile.el"))

(use-package helm-projectile
  :after (helm projectile)
  :ensure t)

(use-package web-mode
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/web-mode.el"))

(use-package smart-mode-line
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/smart-mode-line.el"))

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t))

(use-package elisp-slime-nav :ensure t)
(use-package elisp-format :ensure t)

(use-package rust-mode :ensure t)

(use-package rustic
  :after (rust-mode flycheck lsp-mode)
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/rustic.el"))

(use-package js2-mode
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/js2-mode.el"))

(use-package py-isort
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/py-isort.el"))

(use-package tide
  :ensure t
  :config
  (load "/home/lefteris/.emacs.d/config/tide.el"))

(provide 'use-package-start)
;;; use-package-start ends here
