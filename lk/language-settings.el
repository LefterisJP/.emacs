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

;---- Python code global options
 ;;tabs in python settings
(add-hook 'python-mode-hook
	  (lambda ()
	    (setq-default current-indentation-spaces 4)
	    (setq indent-tabs-mode nil)
	    (setq-default python-indent 4)
	    (setq tab-width 4)
	    (setq-default python-guess-indent nil)))
(provide 'language-settings)
;;; language-settings.el ends here
