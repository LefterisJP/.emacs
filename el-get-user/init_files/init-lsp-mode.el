;;; lsp-mode --- My configuration for the the language server protocol
;;; Commentary:
;;; Language server protocol for emacs.
;;; Python: https://github.com/python-lsp/python-lsp-server
;;; pip install ‘python-language-server[all]’
;;;

;;; Code:
(require 'lsp-mode)
(require 'lsp-ui)
(require 'use-package)

;; Start lsp when you open a file for each langauge
(add-hook 'python-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'lsp)

(use-package lsp-mode
  :ensure
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  ;; enable / disable the hints as you prefer:
  (lsp-inlay-hint-enable t)
  ;; These are optional configurations. See https://emacs-lsp.github.io/lsp-mode/page/lsp-rust-analyzer/#lsp-rust-analyzer-display-chaining-hints for a full list
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints nil)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))  ; remove if too flashy

(provide 'init-lsp-mode)
;;; init-lsp-mode ends here
