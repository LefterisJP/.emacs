;;; projectile --- My configuration for projectile package
;;; Commentary:
;;; Projectile is a project indexing package for EMACS.  Docs are here:
;;; https://github.com/bbatsov/projectile
;;;
;;; Exploring large projects with projectile and helm
;;; http://tuhdo.github.io/helm-projectile.html

;;; Code:
(require 'projectile)

(projectile-global-mode) ;; enable globally

; since I am never working from windows this should be safe
(setq projectile-indexing-method 'alien)
; use helm for completion
(setq projectile-completion-system 'helm)

;; Changing some of the key bindings that were stated here
;; https://github.com/bbatsov/projectile#interactive-commands
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; choose between ack and ag for "A"
;; (define-key projectile-command-map (kbd "A") 'projectile-ack)
(define-key projectile-command-map (kbd "A") 'projectile-ag)

;; due to helm-projectile in helm-init
;; these are the helm enhanced versions of some commands I am using:
;;
;; Current keymap-prefix is: "C-c p". All commands are prefixed with this.
;;
;;
;; helm-projectile-find-other-file  "a"
;; switches between header and source .. or other user configured type of
;; files
;; if you type "4 a" it opens in another window
;;
;;
;; helm-projectile-find-file "f"
;; Opens a helm window with all the indexed files of the project
;;
;; helm-projectile-find-file-in-known-projects "F"
;; Opens a helm window with all the indexed files of all known projects.
;; Is kinda slow.
;;
;; helm-project-switch-project "p"
;; Opens a helm window with all the indexed projects, allowing you to switch
;;
;; helm-projectile-find-file-dwim "g"
;; Performs a projectile action depending on the context at point. (do what I mean)
;;
;; helm-projectile-find-dir    "d"
;; Lists all available directories in the current project
;;
;; helm-projectile-recentf     "e"
;; Shows a helm window with the recently visited files of the current project
;;
;; helm-projectile-switch-to-buffer     "b"
;; Switch to an open buffer of the current project
