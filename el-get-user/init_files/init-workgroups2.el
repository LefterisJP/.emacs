;;; init-workgroups2 --- my workgroup2 configuration
;;; Commentary:
;;; Workgroups is a session manager for Emacs.
;;; For more details or customization options visit:
;;; https://github.com/pashinin/workgroups2
;;;
;;; Code:

(require 'workgroups2)

;; autoload/autosave:
;; if you start Emacs as "emacs --daemon" - turn off autoloading of workgroups:
(setq wg-use-default-session-file nil)
;; Change workgroups session file
(setq wg-default-session-file "~/.emacs.d/.emacs_workgroups")

(setq wg-prefix-key (kbd "C-c z"))
(workgroups-mode 1)

(provide 'init-workgroups2)
;;; init-workgroups2.el ends here
