;;; init-anzu --- my anzu configuration
;;; Commentary:
;; a minor mode which displays current match and total matches
;; information in the mode-line in various search modes.
;; For more details or customization options visit:
;; https://github.com/syohex/emacs-anzu
;;
;;; Code:
(require 'anzu)
(global-anzu-mode +1)

(set-face-attribute 'anzu-mode-line nil
                    :foreground "yellow" :weight 'bold)

(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000)
 '(anzu-replace-to-string-separator " => "))

;; some keybindings for anzu
;; use anzu versions of some commands instead of normal ones
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
;; keybinding for original anzu commands, TODO: if we need binding for them make ones.
;; (global-set-key (kbd "") 'anzu-replace-at-cursor-thing)
;; (global-set-key (kbd "") 'anzu-query-replace-at-cursor-thing)
