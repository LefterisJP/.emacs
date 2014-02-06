;;; init-drag-stuff --- my drag-stuff configuration
;;; Commentary:
;;; A mode allowing to drag selections, words and lines around
;;; with a modifier key + arrow keys
;;; For more details or customization options visit:
;;; https://github.com/rejeep/drag-stuff.el
;;;
;;; Code:

(require 'drag-stuff)

(setq drag-stuff-modifier 'hyper)
(drag-stuff-global-mode t)


(provide 'init-drag-stuff)
;;; init-drag-stuff.el ends here
