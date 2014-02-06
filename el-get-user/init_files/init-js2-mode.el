;;; init-js2-mode --- a good emacs package for js development
;;; Commentary:
;;;
;;; Code:
(require 'js2-mode)
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq js2-mode-hook
  '(lambda () (progn
    (setq 'indent-tabs-mode nil))))

(setq js2-highlight-level 3)

(provide 'init-js2-mode)
;;; init-js2-mode.el ends here
