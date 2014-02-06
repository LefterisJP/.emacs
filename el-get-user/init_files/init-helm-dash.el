;;; init-helm-dash --- my helm-dash configuration
;;; Commentary:
;;; A documentation browser for Emacs
;;; For more details or customization options visit:
;;; https://github.com/areina/helm-dash
;;;
;;; Code:
(require 'helm-dash)
(add-to-list 'helm-dash-common-docsets "C++")
;; open helm-dash docsets with an external browser for now :(
(setq helm-dash-browser-func 'browse-url)

(defun c/c++-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("C" "C++" "GLib")))


(add-hook 'c-mode-common-hook 'c/c++-doc)

(provide 'init-helm-dash)
;;; init-helm-dash.el ends here
