;;; my-org-todo --- org-mode todo configuration
;;; Commentary:
;;;
;;; Code:

(require 'org)


;; TODO state transitions.
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "white" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-use-fast-todo-selection t)

;; set TODO state transitions tags for easier filtering
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

;; -- Org statistics cookies --
(setq org-provide-todo-statistics '('("TODO" "NEXT") '("DONE" "CANCELED")))
(setq org-hierarchical-todo-statistics nil) ; consider all entries in the sublist

;; Change a todo entry automatically to DONE when all children are done
(defun org-summary-todo (n-done n-not-done)
  "Change a todo entry automatically to DONE when all children are done.
Switch entry to 'N-DONE' when all subentries are done, to 'N-NOT-DONE otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(provide 'my-org-todo)
;;; my-org-todo.el ends here
