;;; init-yasnippet --- my yasnippet configuration
;;; Commentary:
;;; Code snippets expansion
;;; https://capitaomorte.github.io/yasnippet/
;;; Nice yasnippet writting tutorial:
;;; http://cupfullofcode.com/blog/2013/02/26/snippet-expansion-with-yasnippet/index.html
;;;
;;; Code:
(require 'yasnippet)
(yas-reload-all)

(add-hook 'c-mode-common-hook #'yas-minor-mode)
(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
