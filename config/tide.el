;;; init-tide --- My personal tide configuration
;;; Commentary:
;; Tide repository can be found here
;; https://github.com/ananthakumaran/tide
;;
;;; Code:

(require 'tide)
(require 'company)

;; (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log")) ;; for debug log
(setq tide-tsserver-executable "/usr/local/bin/tsserver") ;; this is needed for me as bundled with package does not work

(defun setup-tide-mode ()
  "Setup the tide mode."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (add-hook 'after-save-hook 'tslint-fix-file nil 'local)
  (setq-default current-indentation-spaces 4)
  (setq indent-tabs-mode nil)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(defun tslint-fix-file ()
  "Use tslint to fix the file for the linter."
  (shell-command (concat "tslint --fix " (buffer-file-name)))
  (revert-buffer t t))

(add-hook 'typescript-ts-mode-hook #'setup-tide-mode)
