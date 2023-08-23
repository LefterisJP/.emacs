;;; init-rustic --- my rust configuration based on rustic
;;; Commentary:
;; rustic is an addition on top of rust-mode
;;
;; https://github.com/brotzeit/rustic
;; https://robert.kra.hn/posts/rust-emacs-setup/
;;
;;; Code:
(require 'rust-mode)
(require 'rustic)
(require 'lsp-mode)
(require 'lsp-rust)
(require 'flycheck)
(require 'bind-key)  ;; needed for bind-keys

(setq rustic-format-on-save t)
(add-hook 'rustic-mode-hook 'rk/rustic-mode-hook)

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t))

  ;; set key map
  (local-set-key (kbd "M-.") 'elpy-goto-definition)
  (local-set-key (kbd "M-.") 'lsp-find-definition)
  (local-set-key (kbd "M-,") 'pop-tag-mark)
  (local-set-key (kbd "M-,") 'xref-go-back)
  (local-set-key (kbd "M-j") 'lsp-ui-imenu)

  (bind-keys* :prefix-map custom-rustic-map
              :prefix lsp-prefix1-value
              ;; :prefix "C-c C-c"
              ("l" . flycheck-list-errors)
              ("a" . lsp-execute-code-action)
              ("r" . lsp-rename)
              ("q" . lsp-workspace-restart)
              ("Q" . lsp-workspace-shutdown)
              ("s" . lsp-rust-analyzer-status)
              ("?" . lsp-find-references))

  (add-hook 'before-save-hook 'lsp-format-buffer nil t))

(provide 'init-rustic)
;;; init-rustic.el ends here
