;;; init-rtags --- My personal rtags configuration
;;; Commentary:
;; Rtags repository can be found here:
;; https://github.com/Andersbakken/rtags
;;
;;; Code:
(require 'rtags)


(rtags-enable-standard-keybindings c-mode-base-map "\C-xr")
(rtags-start-process-maybe)

;; -- enable completions with company-mode
(require 'company-rtags)
;; Need both of these to start diagnostics, which are needed for completions
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
;; enable rtags completion and add the rtags backend
(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-rtags))
;; Add C-tab as the company-complete binding for c/c++
(define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))

(provide 'init-rtags)
;;; init-rtags ends here
