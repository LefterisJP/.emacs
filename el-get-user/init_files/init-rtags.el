;;; init-rtags --- My personal rtags configuration
;;; Commentary:
;; Rtags repository can be found here:
;; https://github.com/Andersbakken/rtags
;;
;;; Code:
(require 'rtags)


(rtags-enable-standard-keybindings c-mode-base-map "\C-xr")
(rtags-start-process-maybe)
(setq rtags-autostart-diagnostics t)

;; enable completions with company-mode
(require 'company-rtags)
(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-rtags))

(provide 'init-rtags)
;;; init-rtags ends here
