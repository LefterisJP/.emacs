;;; init-smart-mode-line --- my smart-mode-line configuration
;;; Commentary:
;; a sexy mode line for Emacs
;; I saw it in this EMACS SE post.
;; http://emacs.stackexchange.com/questions/281/how-do-i-get-a-fancier-mode-line-that-uses-solid-colors-and-triangles
;;
;; I am also using an extra package that is not in el-get to get the powerline
;; theme for smart-mode-line.  It is mentioned in the above post.  Get it from MELPA:
;; M-x package-install RET smart-mode-line-powerline-theme
;; Note that this also requires powerline to be there.
;;
;; For more details or customization options visit:
;; https://github.com/Bruce-Connor/smart-mode-line/
;;
;;; Code:

(require 'smart-mode-line)

(setq sml/no-confirm-load-theme t)

;; set powerline as the theme for smart mode line
;; TODO: We can customize it just as if it was powerline.
;;       Turned off for now since default setup does
;;       not play nice with solarized-emacs
;; (setq sml/theme 'powerline)
(sml/setup)

;; add shorteners for the most used directories
(add-to-list 'sml/replacer-regexp-list '("^~/ew/cpp-ethereum" ":ETH:") t)
(add-to-list 'sml/replacer-regexp-list '("^~/w/refu/lang" ":RFL:") t)
(add-to-list 'sml/replacer-regexp-list '("^~/w/refu/clib" ":RFC:") t)
(add-to-list 'sml/replacer-regexp-list '("^~/ew/raiden/" ":RDN:") t)
(add-to-list 'sml/replacer-regexp-list '("^~/w/rotkehlchen/" ":RKLN:") t)

;; char to show in modeline if the buffer has outstanding changes
(setq sml/modified-char "X")
;; char to show in modeline if file visited by buffer has been modified outside the buffer
(setq sml/outside-modified-char "M")
;; char to show in modeline if buffer is Read only
(setq sml/read-only-char "R")

;; other options
(setq sml/position-percentage-format "%p")

(provide 'init-smart-mode-line)
;;; init-smart-mode-line.el ends here
