;;; flx-ido --- My configuration for ido flx
;;; Commentary:
;;; Provides fuzzy matching with good sorting in ido.  Docs are here:
;;; https://github.com/lewang/flx

;;; Code:
(require 'flx-ido)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces t)

(provide 'init-flx)
;;; init-flx ends here
