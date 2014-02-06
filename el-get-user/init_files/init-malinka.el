(require 'malinka)

(setq malinka-completion-system 'ido)
(setq malinka-idle-project-check-seconds 0)
(add-hook 'c-mode-common-hook 'malinka-mode)
;; (setq malinka-print-info? t)
;; (setq malinka-print-warning? t)
;; (setq malinka-print-debug? t)
;; (setq malinka-print-xdebug? t)

(provide 'init-malinka)
;;; init-malinka.el ends here
