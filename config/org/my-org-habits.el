;;; my-org-habits --- Habit tracking using org mode's habit module
;;; Commentary:
;;; From the org manual about habit tracking:
;;; http://orgmode.org/manual/Tracking-your-habits.html
;;;
;;; A small blog post with an example:
;;; http://sachachua.com/blog/2012/05/org-mode-and-habits/
;;; Code:
;;

(require 'org)
(require 'org-habit)

(add-to-list 'org-modules "org-habit")

(provide 'my-org-habits)
;;; my-org-habits.el ends here
