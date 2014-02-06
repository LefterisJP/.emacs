;;; init-git-messenger --- my git-messenger config
;;; Commentary:
;;  provides function that popup commit message at current line
;;  For more info: https://github.com/syohex/emacs-git-messenger
;;; Code:
(require 'git-messenger)

(global-set-key (kbd "C-x v p") 'git-messenger:popup-message)
(define-key git-messenger-map (kbd "m") 'git-messenger:copy-message)

;; always show details
(setq git-messenger:show-detail t)

;; Enable magit-commit-mode after typing 's', 'S', 'd'
(add-hook 'git-messenger:popup-buffer-hook 'magit-commit-mode)

(provide 'init-git-messenger)
;;; init-git-messenger.el ends here
