;;; el-get-start --- My el-get initialization
;;; Commentary:
;; Initializes el-get, clones and installs it if it's not present
;; Then checks all the required packages and updates and installs them

;;; Code:
(require 'determine-location)

;; if we don't have el-get, install it
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; setup el-get directories
(setq el-get-user-package-directory "~/.emacs.d/el-get-user/init_files")
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(defun el-get-recompile-packages ()
  "Recompile all el-get downloaded packages."
  (interactive)
  (byte-recompile-directory "/home/lefteris/.emacs.d/el-get/"  nil 'force))

;; set extra makeflags for projects that support it
(setq el-get-parallel-make-args '("-j5"))

(defvar common-packages
  '(el-get                ; el-get is self hosting


    ))

(defvar el-get-packages-list)
(defvar work-only-packages '())
(defvar personal-only-packages '())
(if *at-work*
    (setq el-get-packages-list (append common-packages work-only-packages))
    (setq el-get-packages-list (append common-packages personal-only-packages)))

;; el-get does its magic to make sure all packages are there
(el-get 'sync el-get-packages-list)


(provide 'el-get-start)
;;; el-get-start ends here
