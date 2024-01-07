;;; Init --- My emacs init file
;;; Commentary:
;; Everything starts from here
;;

;;; Code:

;; Emacs package manager START
;; http://www.emacswiki.org/emacs/ELPA
(require 'package)
(setq package-archives
      '(
        ("melpa" . "https://melpa.org/packages/")
        ;; ("marmalade" . "http://marmalade-repo.org/packages/")
        ("elpa" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; load-paths we need to add in the beginning
(add-to-list 'load-path "~/.emacs.d/lk")
(add-to-list 'load-path "~/.emacs.d/utils/")
(add-to-list 'load-path "~/.emacs.d/config/org")

;; Loads erc configuration
(add-to-list 'load-path "~/.emacs.d/config/erc/")
(require 'my-erc)
;; Loads all the needed packages
(require 'use-package-start)
(require 'refu-docs-publishing)

(ido-everywhere -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; packages should have been loaded by now
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; also make sure the flycheck syntax checker is aware of
;; any load-path customization
;; refer to: https://github.com/flycheck/flycheck/issues/174
(setq-default flycheck-emacs-lisp-load-path load-path)
(require 'language-settings)

(require 'load-libraries)
(require 'load-functions)
(require 'load-settings)
(require 'lk-avatar)
(require 'lk-scratch)

;; For some reason rust-mode gets always re-added to auto-mode-alist
;; while we want rustic mode. So delete it here at the very end
(setq auto-mode-alist (delete '("\\.rs\\'" . rust-mode) auto-mode-alist))

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-replace-to-string-separator " => ")
 '(anzu-search-threshold 1000)
 '(package-selected-packages
   '(tree-sitter-langs tree-sitter tide py-isort js2-mode rustic rust-mode elisp-format elisp-slime-nav volatile-highlights smart-mode-line web-mode helm-projectile projectile helm dockerfile-mode magit flycheck solarized-theme rainbow-delimiters lsp-pyright highlight-symbol expand-region elpy company-jedi anzu ag ace-jump-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
