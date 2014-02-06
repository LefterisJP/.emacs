;;; init-popwing --- my popwin configuration
;;; Commentary:
;; Displays all extra buffers such as occurences as popups and allows
;; for quick deletion using C-g
;; For more details visit:
;; https://github.com/m2ym/popwin-el
;;
;;; Code:
;; (require 'popwin)
;; (popwin-mode 1)

;; ;; set special behavior for some types of extra buffers
;; ;; add ag search
;; (push '("*ag search*" :position right :stick t :noselect nil :width 0.3 :dedicated nil) popwin:special-display-config)

;; ;; add *RTags* buffers
;; (push '("*RTags*" :position right :stick t :noselect nil :width 0.35 :dedicated nil) popwin:special-display-config)

;; ;; add compilation window. For compilation and for testing.
;; ;; unfortunately popwin seems to have a bug for setting the window height
;; ;; (push '("*compilation*" :height 0.35 :position bottom :stick t :noselect t :dedicated nil) popwin:special-display-config)
;; (push '(compilation-mode :width 0.35 :position right :stick t :noselect t :dedicated nil) popwin:special-display-config)

;; (provide 'init-popwin)
;;; init-popwin.el ends here
