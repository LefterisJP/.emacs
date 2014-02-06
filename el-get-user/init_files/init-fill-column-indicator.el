;; setting default column width
(setq-default fill-column 80)
;; fci takes the default fill-column or if set the fci-rule-column
(setq-default fci-rule-column 80)

(setq fci-rule-width 2)
;; color should change depending on the color theme
;; should be able to meld with the theme and not
;; stand out too much
(setq fci-rule-color "#3D5266")

;; add it as default for C/C++ and python code
(add-hook 'c-mode-common-hook 'fci-mode)
(add-hook 'python-mode-hook 'fci-mode)
