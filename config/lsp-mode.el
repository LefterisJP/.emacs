;;; lsp-mode --- My configuration for the the language server protocol
;;; Commentary:
;;; Language server protocol for emacs.
;;; Python: https://github.com/python-lsp/python-lsp-server
;;; pip install ‘python-language-server[all]’
;;;

;;; Code:
(require 'lsp-mode)
(require 'lsp-rust)

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

;; general options - optimized for performance
(setq lsp-eldoc-render-all nil)  ; Reduced for performance
(setq lsp-idle-delay 0.3)        ; Faster response
(setq lsp-inlay-hint-enable t)
;; Reduce file watching for better performance
(setq lsp-file-watch-threshold 2000)
;; Performance optimizations
(setq lsp-completion-provider :none)  ; Use company-capf instead
(setq lsp-headerline-breadcrumb-enable nil)  ; Disable breadcrumbs for performance
(setq lsp-modeline-code-actions-enable nil)  ; Disable modeline actions for performance
(setq lsp-signature-auto-activate nil)       ; Reduce signature popup frequency

;; uncomment for less flashiness
;; (setq lsp-eldoc-hook nil)
;; (setq lsp-enable-symbol-highlighting nil)
;; (setq lsp-signature-auto-activate nil)

;; define a global prefix for lsp stuff
(defvar lsp-prefix1-value "C-c C-c")
(define-prefix-command 'lsp-prefix1-map)
(global-set-key (kbd lsp-prefix1-value) 'lsp-prefix1-map)
(setq lsp-keymap-prefix "C-c C-C")

;; Start lsp when you open a file for each language
(add-hook 'python-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'lsp)

;; ============================================================================
;; Python-specific LSP configuration
;; ============================================================================

;; Pyright global settings
(setq lsp-pyright-multi-root nil)              ; Disable multi-root for performance
(setq lsp-pyright-auto-import-completions t)   ; Enable auto-import completions
(setq lsp-pyright-auto-search-paths t)         ; Auto-detect Python paths

;; Python mode hook - streamlined for LSP-only setup
(add-hook 'python-mode-hook
	  (lambda ()
	    ;; Pyright language service settings
	    (setq lsp-pyright-disable-language-service nil)
	    (setq lsp-pyright-disable-organize-imports nil)
	    
	    ;; Local LSP optimizations for Python
	    (setq-local lsp-enable-file-watchers nil)       ; Disable for large Python projects
	    (setq-local lsp-enable-folding nil)             ; Disable folding for performance
	    (setq-local lsp-enable-symbol-highlighting t)   ; Keep symbol highlighting
	    (setq-local lsp-enable-links nil)               ; Disable clickable links for performance
	    
	    ;; Company completion optimizations
	    (setq-local company-backends '((company-capf company-dabbrev-code)))
	    (setq-local company-minimum-prefix-length 2)
	    (setq-local company-idle-delay 0.2)
	    (setq-local company-tooltip-align-annotations t)
	    
	    ;; Navigation keybindings
	    (local-set-key (kbd "M-.") 'lsp-find-definition)
	    (local-set-key (kbd "M-,") 'xref-go-back)
	    (local-set-key (kbd "M-j") 'lsp-ui-imenu)
	    (local-set-key (kbd "C-c M-.") 'lsp-find-implementation)
	    (local-set-key (kbd "C-c M-?") 'lsp-find-references)
	    
	    ;; LSP command prefix bindings
	    (define-key 'lsp-prefix1-map (kbd "l") 'flycheck-list-errors)
	    (define-key 'lsp-prefix1-map (kbd "a") 'lsp-execute-code-action)
	    (define-key 'lsp-prefix1-map (kbd "r") 'lsp-rename)
	    (define-key 'lsp-prefix1-map (kbd "?") 'lsp-find-references)
	    (define-key 'lsp-prefix1-map (kbd "i") 'lsp-find-implementation)
	    (define-key 'lsp-prefix1-map (kbd "t") 'lsp-find-type-definition)
	    ))
