;;; init-go-mode --- my go configuration
;;; Commentary:
;; A quick setup guide:
;; http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/
;;
;;; Code:
(require 'go-mode)

(setenv "GOPATH" "/home/lefteris/w/go/")
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/home/lefteris/w/go/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

(provide 'init-go-mode)
;;; init-go-mode.el ends here
