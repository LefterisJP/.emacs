;;; lsp-ui
;;; Commentary:
;;; lsp-ui part of lsp mode
;;; https://robert.kra.hn/posts/rust-emacs-setup/
;;;

;;; Code:
(require 'use-package)


(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

(provide 'init-lsp-ui)
;;; init-lsp-ui ends here
