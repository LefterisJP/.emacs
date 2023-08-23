;;; lsp-mode --- My configuration for the the language server protocol
;;; Commentary:
;;; Language server protocol for emacs.
;;; Python: https://github.com/python-lsp/python-lsp-server
;;; pip install ‘python-language-server[all]’
;;;

;;; Code:
(require 'lsp-mode)
(require 'lsp-rust)
(require 'elpy)  ;; needed for the python hook

;; rust options
;; what to use when checking on-save. "check" is default, I prefer clippy
(setq lsp-rust-analyzer-cargo-watch-command "clippy")
;; These are optional configurations. See https://emacs-lsp.github.io/lsp-mode/page/lsp-rust-analyzer/#lsp-rust-analyzer-display-chaining-hints for a full list
(setq lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
(setq lsp-rust-analyzer-display-chaining-hints t)
(setq lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
(setq lsp-rust-analyzer-display-closure-return-type-hints t)
(setq lsp-rust-analyzer-display-parameter-hints nil)
(setq lsp-rust-analyzer-display-reborrow-hints nil)

;; general options
(setq lsp-eldoc-render-all t)
(setq lsp-idle-delay 0.6)
;; enable / disable the hints as you prefer:
(setq lsp-inlay-hint-enable t)
;; Show warning if files to watch are more than. Can also disable with nil
(setq lsp-file-watch-threshold 990000)

;; uncomment for less flashiness
;; (setq lsp-eldoc-hook nil)
;; (setq lsp-enable-symbol-highlighting nil)
;; (setq lsp-signature-auto-activate nil)

;; define a global prefix for lsp stuff
(defvar lsp-prefix1-value "C-c C-c")
(define-prefix-command 'lsp-prefix1-map)
(global-set-key (kbd lsp-prefix1-value) 'lsp-prefix1-map)
(setq lsp-keymap-prefix "C-C C-C")

;; Start lsp when you open a file for each language
(add-hook 'python-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; python mode hook to deal with lsp-mode configurations
(add-hook 'python-mode-hook
	  (lambda ()
	    ;; (local-set-key (kbd "M-.") 'elpy-goto-definition)
	    (local-set-key (kbd "M-.") 'lsp-find-definition)
	    ;; (local-set-key (kbd "M-,") 'pop-tag-mark)
	    (local-set-key (kbd "M-,") 'xref-go-back)
	    (local-set-key (kbd "M-j") 'lsp-ui-imenu)
	    (define-key 'lsp-prefix1-map (kbd "l") 'flycheck-list-errors)
	    (define-key 'lsp-prefix1-map (kbd "a") 'lsp-execute-code-action)
	    (define-key 'lsp-prefix1-map (kbd "r") 'lsp-rename)
	    (define-key 'lsp-prefix1-map (kbd "?") 'lsp-find-references)
	    ))

(provide 'init-lsp-mode)
;;; init-lsp-mode ends here
