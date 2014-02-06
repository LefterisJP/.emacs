;;; init-org-trello --- my org trello configuration
;;; Commentary:
;;; An emacs org-mode sync module for trello
;;; For more details or customization options visit:
;;; https://github.com/org-trello/org-trello
;;;
;;; Code:

(require 'org-trello)

;; activate org-trello only for specific files
(custom-set-variables '(org-trello-files '("~/.emacs.d/trello/refu_lang_backend.org")))


(provide 'init-org-trello)
;;; init-org-trello.el ends here
