;;; Determine-Location --- Determines my location
;;; Commentary:
;; This file determines location specific customization
;; variables which are used later on to decide how to setup
;; Emacs
;;

;;; Code:
;; detect development environment
(defvar *at-work* nil "True if at the office.")
(defvar *at-desktop* nil "True if at a desktop computer (so we got a big monitor).")

(when (string-prefix-p "archlenovo" system-name) ;;the work laptop
    (setq *at-work* t))
(when (string-prefix-p "archdesktop" system-name)
    (setq *at-desktop* t))

(provide 'determine-location)
;;; determine-location.el ends here
