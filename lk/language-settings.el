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
	    (setq-default python-guess-indent nil)))

;; Web mode options
;; For more info look here: http://web-mode.org/
(add-hook 'web-mode-hook
	  (lambda ()
	    (setq web-mode-markup-indent-offset 4)
	    (setq web-mode-css-indent-offset 4)
	    (setq tab-width 4)))
(provide 'language-settings)
;;; language-settings.el ends here
