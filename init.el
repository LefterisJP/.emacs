;;; Init --- My emacs init file
;;; Commentary:
;; Everything starts from here
;;

;;; Code:

;; load-paths we need to add in the beginning
(add-to-list 'load-path "~/.emacs.d/lk")
(add-to-list 'load-path "~/.emacs.d/utils/")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get/")
(add-to-list 'load-path "~/.emacs.d/config/org")

;; for some funny reason these are not added to the path ... find out why and delete from here
(add-to-list 'load-path "~/.emacs.d/el-get/f")
(add-to-list 'load-path "~/.emacs.d/el-get/s")
(add-to-list 'load-path "~/.emacs.d/el-get/dash")


;; for some funny reason, cedet/contrib can't be properly added from init-cedet.el
(add-to-list 'load-path "~/.emacs.d/el-get/cedet/contrib/")

;; Loads erc configuration
(add-to-list 'load-path "~/.emacs.d/config/erc/")
(require 'my-erc)
;; Loads all the needed packages
(require 'el-get-start)
(require 'refu-docs-publishing)

;;;;;;;;;;;;;;;;;;;;;;;
;; el-get packages have
;; been loaded by now
;;;;;;;;;;;;;;;;;;;;;;;

;; also make sure the flycheck syntax checker is aware of
;; any load-path customization (which happens thanks to el-get among others)
;; refer to: https://github.com/flycheck/flycheck/issues/174
(setq-default flycheck-emacs-lisp-load-path load-path)
(require 'language-settings)

;; Emacs package manager START
;; http://www.emacswiki.org/emacs/ELPA
(require 'package)
(setq package-archives
      '(
        ("melpa" . "http://melpa.milkbox.net/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("elpa" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(require 'load-libraries)
(require 'load-functions)
(require 'load-settings)

(provide 'init)
;;; init.el ends here
