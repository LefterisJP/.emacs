;;; init-python-black --- my ag configuration
;;; Commentary:
;;; https://github.com/wbolster/emacs-python-black
;;;
;;; Code:

(require 'python-black)

;; Make sure that if we are in the raiden project we use black before saving
(add-hook 'python-mode-hook
	  (lambda ()
	    (when (or (string= (projectile-project-name) "raiden") (string= (projectile-project-name) "shutter"))
		      (python-black-on-save-mode))))

(provide 'init-python-black)
;;; init-python-black.el ends here
