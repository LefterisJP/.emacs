;;; lsp-mode --- My configuration for the the language server protocol
;;; Commentary:
;;; Language server protocol for emacs.
;;; Python: https://github.com/python-lsp/python-lsp-server
;;; pip install ‘python-language-server[all]’
;;;

;;; Code:
(require 'lsp-mode)

;; Start lsp when you open a file for each langauge
(add-hook 'python-mode-hook #'lsp)
;; Add more languages as needed

(provide 'init-lsp-mode)
;;; init-lsp-mode ends here
