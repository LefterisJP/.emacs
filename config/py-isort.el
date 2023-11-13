;;; init-py-isort --- my py-isort
;;; Commentary:
;;;
;;; Code:
(require 'py-isort)

(defun python-mode-before-save-hook ()
  (when (eq major-mode 'python-mode) (eq major-mode 'c-mode)
	(py-isort-before-save)))

(add-hook 'before-save-hook 'python-mode-before-save-hook)
