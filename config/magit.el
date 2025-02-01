;;; init-magit --- my magit configuration
;;; Commentary:
;;; Emacs interface to git configuration
;;;
;;; Code:
(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-auto-revert-mode t)
(setq magit-last-seen-setup-instructions "1.4.0")
(setq transient-default-level 5)  ;; to get gpg sign option
(setq magit-popup-use-prefix-argument  'default)
