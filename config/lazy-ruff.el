(require 'lazy-ruff)

;; Also have a manual edit here:
;; https://github.com/christophermadsen/emacs-lazy-ruff/issues/3
;; TODO: When they merge it remove the manual edit
;; Also seems to have no way to just use lint fix and no format. So I just edited that too.

(setq lazy-ruff-only-check-buffer t) ;; Don't lint in code blocks
(global-set-key (kbd "C-c f") 'lazy-ruff-lint-format-dwim)
;; (setq lazy-ruff-format-command "ruff check --fix -s")
;; (setq lazy-ruff-only-format-block t) ;; Don't lint in code blocks
;; (setq lazy-ruff-only-format-region t) ;; Don't lint in marked regions
;; (setq lazy-ruff-only-format-buffer t) ;; Don't lint in Python major mode buffers
(lazy-ruff-global-mode t)
