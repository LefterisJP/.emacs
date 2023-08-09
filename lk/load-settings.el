;;; Settings --- A summary file of my emacs settings
;;; Commentary:
;; This is simply all of my Emacs settings that are
;; loaded at startup
;;

;;; Code:
(require 'determine-location)

;; To inhibit free variable and undefined function warnings
(defvar compilation-scroll-output)
(defvar linum-format)
(defvar buffer-face-mode-face)

;; All search should be case sensitive by default
(setq-default case-fold-search nil)

;compilation window taking less space
(setq compilation-window-height 8)

;; scroll the output of compilation during progress
(setq compilation-scroll-output t)

 ;;to inhibit the starting screen
(setq inhibit-startup-message t)
(setq linum-format "%d")
 ;;setting email address
(setq user-mail-address "lefteris@refu.co")
 ;;the below is used to allow for placing all autosaves
 ;;in the system's temporary directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
 ;;display line numbers in programming modes
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
 ;; Show column-number in the mode line
(column-number-mode 1)
 ;; delete selected text when typing
(delete-selection-mode 1)
 ;; highlight brackets/parentheses e.t.c.
(show-paren-mode t)
 ;; no toolbar
(tool-bar-mode -1)
 ;; no menu bar
(menu-bar-mode -1)
;; show a stack trace to see what went wrong in a function call
;; (setq debug-on-error t)
;; DO NOT prompt in a very large tag file
(setq large-file-warning-threshold nil)
;; Define utf8 as an alias for utf-8
(define-coding-system-alias 'utf8 'utf-8)

;; disable insert prompting for overwrite mode.
;; Move it to control + insert, since I use it really rarely
;; and also since I am now using it as modifier key for i3wm
(define-key global-map [(insert)] nil)
(define-key global-map [(control insert)] 'overwrite-mode)


(defun lk-setup-look ()
  "Set up Emacs font, theme e.t.c."
  ;; Using X Logical font description as described here:
  ;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html
  ;; (if *at-desktop*
  ;; 	  (set-frame-font "-adobe-Source Code Pro-normal-normal-normal-*-10-*-*-*-m-0-iso10646-1")
  ;; 	;; else
  ;;   (set-frame-font "-adobe-Source Code Pro-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")))

  (if *at-desktop*
      (set-frame-font "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-11-*-*-*-m-0-iso10646-1")
    ;; else
    (set-frame-font "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")))

;; load the look for emacs no matter if it's a client frame or not
(if (daemonp)
    (add-hook 'after-make-frame-functions
              '(lambda (f)
                 (with-selected-frame f
                   (when (window-system f) (lk-setup-look)))))
  (lk-setup-look))
;; run emacs as a server
(require 'server)
(or (server-running-p)
    (server-start))



;; -- File association with mode --
 ;;add refu private header files as c mode
(add-to-list 'auto-mode-alist '("\\.ph\\'" . c-mode))
 ;; associate Scons and waf files with python
(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("wscript" . python-mode))
 ;; associate .rf files with c/c++ for now to get similar coloring
(add-to-list 'auto-mode-alist '("\\.rf\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.rfs\\'" . c-mode))
 ;; associate refu c library template files with c mode
(add-to-list 'auto-mode-alist '("\\.ctemplate\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.htemplate\\'" . c-mode))
;; associate tcc files with c++ mode
(add-to-list 'auto-mode-alist '("\\.tcc\\'" . c-mode))
;; associate cl files with open-cl (and not common lisp for now)
(add-to-list 'auto-mode-alist '("\\.cl\\'" . c-mode))

;--- ansi terminal options
(defun ansi-term-set-face ()
  "Set the proper font for 'ansi-term' to try to play well with powerline."
   (setq buffer-face-mode-face '(:family "DejaVu Sans Mono for Powerline"))
   (buffer-face-mode))
(add-hook 'term-mode-hook 'ansi-term-set-face)

; -- window splitting options
;; basically do not allow splitting by putting neew window on the bottom
(setq split-height-threshold nil)
(provide 'load-settings)

; -- dired options --
(add-hook 'dired-mode-hook
	  (lambda ()
	    (setq-default dired-omit-files-p t) ; this is buffer-local variable
	    (setq dired-omit-files
		  (concat dired-omit-files "\\|^\\..+$\\|\\.json$\\|\\.mypy_cache$"))))

;;; load-settings.el ends here
