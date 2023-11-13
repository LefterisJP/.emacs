;;; init-flycheck --- flycheck configuration
;;; Commentary:
;;; Usage guide is located here:
;;; http://flycheck.readthedocs.org/en/latest/guide/usage.html
;;;
;;; Code:
(require 'flycheck)
(require 'determine-location)

;; enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; run flycheck at these events
(setq flycheck-check-syntax-automatically
      '(save idle-change new-line mode-enabled))
;; wait 1 second of idle time to perform checks
(setq flycheck-idle-change-delay 1)
;; highlight only symbols at error
(setq flycheck-highlighting-mode 'symbols)
;; show error indicators on the left fringe of the buffer
(setq flycheck-indication-mode 'left-fringe)

(defun flycheck-set-flake8 (version)
  "Set the python 'VERSION' to be used by flake8."
  (interactive (list
                (read-string
                 (format "Flake8 for which Python version? (default:%S): " "2")
                             nil nil "2")))
  (if (string-match "2" version)
      (setq flycheck-python-flake8-executable "flake8-python2")
    (setq flycheck-python-flake8-executable "flake8")))
