;;; my-org-refile --- org-mode capturing and refiling options
;;; Commentary:
;;;
;;; Code:

(require 'org-capture)
(require 'ido)

(setq org-default-notes-file "~/org/refile.org")
;; Capture templates for specific type of tasks
(setq org-capture-templates
      (quote (("s" "slock.it Tasks" entry (file+headline  "~/org/work/slockit.org" "General Tasks")
               "* TODO %?\n%U\n%a\n" :kill-bufer t)
              ("r" "refulang Tasks" entry (file+headline  "~/org/projects/refulang/refulang.org" "General Tasks")
               "* TODO %?\n%U\n%a\n" :kill-bufer t)
              ("p" "personal Tasks" entry (file+headline  "~/org/personal/personal.org" "General Tasks")
               "* TODO %?\n%U\n%a\n" :kill-bufer t))))

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

; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

;;;; Refile settings

; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets."
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)

(provide 'my-org-refile)
;;; my-org-refile.el ends here
