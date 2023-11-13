;;; init-web-mode --- my web-mode configuration
;;; Commentary:
;;; web-mode.el is an autonomous Emacs major-mode for editing web templates:
;;; HTML documents embedding parts (CSS / JavaScript) and
;;; blocks (client / server side)
;;;
;;; For more details or customization options visit:
;;; http://web-mode.org/
;;;
;;; Code:
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

;; indentation should be set at 4 spaces
(setq web-mode-markup-indent-offset 4)

