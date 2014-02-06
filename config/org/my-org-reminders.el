;;; my-org-reminder --- Task reminder using appt
;;; Commentary:
;;; For the manual you can check:
;;; http://www.delorie.com/gnu/docs/elisp-manual-21/elisp_676.html
;;; Code:
;;

(require 'appt)


(defun bh/org-agenda-to-appt ()
  "Erase all reminders and rebuilt reminders for today from the agenda."
  (interactive)
  (setq appt-time-msg-list nil)
  (org-agenda-to-appt))

; Rebuild the reminders everytime the agenda is displayed
(add-hook 'org-finalize-Agenda-hook 'bh/org-agenda-to-appt 'append)
; Activate appointments so we get notifications
(appt-activate t)
; If we leave Emacs running overnight - reset the appointments one minute after midnight
(run-at-time "24:01" nil 'bh/org-agenda-to-appt)

;; Start reminding 30 mins before
(setq appt-message-warning-time 30)
;; Show a reminder every 5 minutes
(setq appt-display-interval 5)
;; DON'T ring terminal bell
(setq appt-audible nil)
;; Display in the echo area
(setq appt-visible t)
;; Display minutes to the appointent in the mode line
(setq appt-display-mode-line t)
;; Display reminders in the area
(setq appt-display-format 'echo)
;; Show an appointment message for 5 seconds
(setq appt-display-duration 5)


;; Reset appoinments at the end of org mode initialization
(bh/org-agenda-to-appt)

(provide 'my-org-reminders)
;;; my-org-reminders.el ends here
