;;; jedi --- My configuration for the python jedi package
;;; Commentary:
;;; Jedi is an autocompletion/static analysis library
;;; for python
;;; https://github.com/davidhalter/jedi
;;;

;;; Code:
(require 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(provide 'init-jedi)
;;; init-jedi ends here
