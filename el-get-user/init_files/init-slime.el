(setq inferior-lisp-program "/usr/bin/sbcl") ; steel bank common lisp

(require 'slime)
(require 'slime-autoloads)

;; Remember: When you want to load slime just type: M-x slime
(slime-setup '(slime-repl)) ; repl only
; If you like what you see try this:
;; (slime-setup '(slime-fancy)) ; almost everything
;; (slime-setup '(slime-fancy slime-asdf))

