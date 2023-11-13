;;; Init --- My emacs init file
;;; Commentary:
;; Everything starts from here
;;

;;; Code:

;; Emacs package manager START
;; http://www.emacswiki.org/emacs/ELPA
(require 'package)
(setq package-archives
      '(
        ("melpa" . "https://melpa.org/packages/")
        ;; ("marmalade" . "http://marmalade-repo.org/packages/")
        ("elpa" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; load-paths we need to add in the beginning
(add-to-list 'load-path "~/.emacs.d/lk")
(add-to-list 'load-path "~/.emacs.d/utils/")
;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get/")
(add-to-list 'load-path "~/.emacs.d/config/org")

;; ;; for some funny reason these are not added to the path ... find out why and delete from here
;; (add-to-list 'load-path "~/.emacs.d/el-get/f")
;; (add-to-list 'load-path "~/.emacs.d/el-get/s")
;; (add-to-list 'load-path "~/.emacs.d/el-get/dash")
;; (add-to-list 'load-path "~/.emacs.d/el-get/company-mode/")
;; (add-to-list 'load-path "~/.emacs.d/el-get/flycheck/")
;; (add-to-list 'load-path "~/.emacs.d/el-get/htmlize/")


;; ;; for some funny reason, cedet/contrib can't be properly added from init-cedet.el
;; (add-to-list 'load-path "~/.emacs.d/el-get/cedet/contrib/")

;; Loads erc configuration
(add-to-list 'load-path "~/.emacs.d/config/erc/")
(require 'my-erc)
;; Loads all the needed packages
(require 'use-package-start)
(require 'refu-docs-publishing)

(ido-everywhere -1)

;;;;;;;;;;;;;;;;;;;;;;;
;; el-get packages have
;; been loaded by now
;;;;;;;;;;;;;;;;;;;;;;;

;; also make sure the flycheck syntax checker is aware of
;; any load-path customization (which happens thanks to el-get among others)
;; refer to: https://github.com/flycheck/flycheck/issues/174
(setq-default flycheck-emacs-lisp-load-path load-path)
(require 'language-settings)

(require 'load-libraries)
(require 'load-functions)
(require 'load-settings)
(require 'lk-avatar)
(require 'lk-scratch)

;; For some reason rust-mode gets always re-added to auto-mode-alist
;; while we want rustic mode. So delete it here at the very end
(setq auto-mode-alist (delete '("\\.rs\\'" . rust-mode) auto-mode-alist))

(provide 'init)
;;; init.el ends here
