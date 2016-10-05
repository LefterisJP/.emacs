;;; ropemacs --- My configuration for the ropemacs package
;;; Commentary:
;;; More info here:
;;; https://github.com/python-rope/ropemacs

;;; Code:
(require 'pymacs)

(setq ropemacs-enable-shortcuts nil)
(setq ropemacs-local-prefix "C-c C-p")
;; Set the python version to be used by pymacs
;;
;; IMPORTANT NOTE: el-get ropemacs requires pymacs. At pymacs installation
;; there is a makefile which uses python. This python needs to be specified
;; as python2 for my archlinux system.
;; TODO: Figure out a good way to handle this.
;; Dirty way: Go in ~/.emacs.d/el-get/pymacs/ and edit the Makefile to use
;; python2. Then do make clean && make and you are done.
(setenv "PYMACS_PYTHON" "python2.7")
(pymacs-load "ropemacs" "rope-")



(provide 'init-ropemacs)
;;; init-ropemacs ends here
