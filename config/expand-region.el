(require 'expand-region)
(global-set-key (kbd "M-q") 'er/expand-region)

;; C- mode overrides M-q with c-fill-paragraph whenever it's loaded so overide
(defun expand-region-key-hook ()
  "Set the key binding for extend-selection."
  (local-set-key (kbd "M-q") 'er/expand-region))
(add-hook 'c-mode-common-hook 'expand-region-key-hook)
