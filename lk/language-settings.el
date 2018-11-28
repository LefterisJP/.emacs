;;; language-settings --- Setup emacs for the different languages I used
;;; Commentary:
;; This file determines location specific setup
;; for various language
;;

;;; Code:

(setq default-directory "~")
;---- C/C++ code options
(require 'malinka-projects)
(require 'cstyle-setup)

;; Python code global options
(add-hook 'python-mode-hook
	  (lambda ()
	    (setq-default current-indentation-spaces 4)
	    (setq indent-tabs-mode nil)
	    (setq-default python-indent 4)
	    (setq tab-width 4)
	    ;; For python there is a bug that causes emacs to hang with opening
	    ;; single or double quotes. Check here:
	    ;; https://github.com/jorgenschaefer/elpy/issues/1381
	    (setq elpy-eldoc-show-current-function nil)
	    (setq-default python-guess-indent nil)))

;; Web mode options
;; For more info look here: http://web-mode.org/
(require 'web-mode)
(add-hook 'web-mode-hook
	  (lambda ()
	    (setq web-mode-markup-indent-offset 4)
	    (setq web-mode-css-indent-offset 4)
	    (set-variable 'indent-tabs-mode nil)
	    (setq tab-width 4)))

;; Javascript options
(require 'js2-mode)
(add-hook 'js2-mode-hook
	  '(lambda () (progn
			(set-variable 'indent-tabs-mode nil))))
(add-hook 'js-mode-hook
	  '(lambda () (progn
			(set-variable 'indent-tabs-mode nil))))
(provide 'language-settings)
;;; language-settings.el ends here
