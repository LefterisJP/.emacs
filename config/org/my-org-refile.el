;;; my-org-refile --- org-mode capturing and refiling options
;;; Commentary:
;;;
;;; Code:

(require 'org-capture)
(require 'ido)

(setq org-default-notes-file "~/org/refile.org")

(defun lk-org-query-location ()
  "Query for a location/headline inside an org file during org-refile.

It considers only level 1 headings in the target org file as potential targets."
  (let* ((org-refile-targets '((nil :maxlevel . 1)))
         (hd (condition-case nil
                 (car (org-refile-get-location nil nil t t))
               (error (car org-refile-history)))))
    (goto-char (point-min))
    (outline-next-heading)
    (if (re-search-forward
         (format org-complex-heading-regexp-format (regexp-quote hd))
         nil t)
        (goto-char (point-at-bol))
      (goto-char (point-max))
      (or (bolp) (insert "\n"))
      (insert "* " hd "\n")))
    (end-of-line))

;; Capture templates for specific type of tasks
(setq org-capture-templates
      (quote (("s" "slock.it Tasks" entry (file+headline  "~/org/work/slockit.org" "General Tasks")
               "* TODO %?\n%U\n%a\n" :kill-bufer t)
              ("r" "refulang Tasks" entry (file+headline  "~/org/projects/refulang/refulang.org" "General Tasks")
               "* TODO %?\n%U\n%a\n" :kill-bufer t)
              ("p" "personal Tasks" entry (file+headline  "~/org/personal/personal.org" "General Tasks")
               "* TODO %?\n%U\n%a\n" :kill-bufer t)
              ("d" "Development Environment - System Tasks" entry (file+headline  "~/org/dev_env/dev_env.org" "Tasks TODO")
               "* TODO %?\n%U\n%a\n" :kill-bufer t)
              ("g" "General Tasks for all Projects" entry (file+function  "~/org/projects/all_projects.org" lk-org-query-location)
               "* TODO %?\n%U\n%a\n" :kill-bufer t)
              )))

;; REFILING OPTIONS
; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))


;;;; Refile settings

; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets."
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)

(provide 'my-org-refile)
;;; my-org-refile.el ends here
