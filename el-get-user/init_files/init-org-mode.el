;;; init-org-mode --- org-mode configuration
;;; Commentary:
;;;
;;; Most of my org-mode setup is influenced by "Organizing Your life in Plain
;;; Text" by Bernt Hansen found at http://doc.norang.ca/org-mode.html
;;;
;;; A nice cheatsheet with many commands is here: http://orgmode.org/orgcard.txt
;;; Code:

(require 'org)
(require 'f)

; not needed after Emacs 22.2
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(add-hook 'org-mode-hook
          (lambda ()
            ; not needed when global-font-lock-mode is on
            (turn-on-font-lock)
            ; C-c . should be working for timestamp as seen here:
            ; http://orgmode.org/manual/Creating-timestamps.html
            ; but for some reason in my Emacs "C-c ." combo does not work so ..
            (local-set-key (kbd "C-c ~") 'org-time-stamp)
            ;; override the C-c arrow key bindings for org-mode
            (local-set-key (kbd "C-c <left>")  'windmove-left)
            (local-set-key (kbd "C-c <right>") 'windmove-right)
            (local-set-key (kbd "C-c <up>")    'windmove-up)
            (local-set-key (kbd "C-c <down>")  'windmove-down)))
;; Define a global prefix key to use for org-mode
(define-prefix-command 'org-prefix1-map)
(global-set-key (kbd "<f9>") 'org-prefix1-map)
(define-key 'org-prefix1-map (kbd "L") 'org-store-link)
(define-key 'org-prefix1-map (kbd "l") 'org-insert-link)
(define-key 'org-prefix1-map (kbd "I") 'bh/punch-in)
(define-key 'org-prefix1-map  (kbd "o") 'bh/punch-out)
(define-key 'org-prefix1-map (kbd "i") 'org-clock-in)
(define-key 'org-prefix1-map  (kbd "c") 'org-capture)
(define-key 'org-prefix1-map  (kbd "a") 'org-agenda)
(define-key 'org-prefix1-map  (kbd "b") 'org-iswitchb)
(define-key 'org-prefix1-map  (kbd "SPC") 'bh/clock-in-last-task)
(define-key 'org-prefix1-map  (kbd "<return>") 'org-clock-goto)

(unless (f-exists? "~/org")
  (f-mkdir "~/org"))
(setq org-directory "~/org")

;; indent all new sections properly http://orgmode.org/guide/Clean-view.html#Clean-view
(setq org-startup-indented t)
(setq org-src-fontify-natively t)
(setq org-mobile-directory "/lefvps:/home/lefteris/mobile_org")
(setq org-mobile-inbox-for-pull (concat org-directory "/index.org"))

;; As seen here: https://www.reddit.com/r/emacs/comments/2b5x5g/funny_characters_appended_at_new_line_to_source/
;; and here: https://lists.gnu.org/archive/html/emacs-orgmode/2014-03/msg00369.html
;; when exporting source code to html from language modes for which I have fci-mode on
;; by default then funny characters appear at the end of each new line. This is
;; a clean way of making sure fci is not enabled when rendering/exporting source code in org mode
(add-hook 'org-src-mode-hook  '(lambda () (fci-mode 0)))
;; in the same spirit set highlight indentation off, for python source code buffers
(add-hook 'org-src-mode-hook  '(lambda () (highlight-indentation-mode 0)))

;; ;; these are all my org-mode configurations
;; (require 'my-org-todo)
;; (require 'my-org-refile)
;; (require 'my-org-agenda)
;; (require 'my-org-clock)
;; (require 'my-org-archive)
;; (require 'my-org-habits)
;; (require 'my-org-reminders); keep last

(provide 'init-org-mode)
;;; init-org-mode.el ends here
