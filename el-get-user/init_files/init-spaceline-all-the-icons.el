;;; spaceline-all-the-icons --- My configuration for the spaceline-all-the-icons
;;; Commentary:
;;; More info here:
;;; https://github.com/domtronn/spaceline-all-the-icons.el
;;;
;;; Need the following fonts too as specifed here: https://github.com/domtronn/all-the-icons.el/tree/master/fonts.
;;; If in archlinux get from AUR:
;;; yaourt -S ttf-all-the-icons
;;; or if not wanting the bundle package  try to get them separately:
;;; yaourt -S ttf-weather-icons ttf-font-awesome ttf-octicons
;;; ---> or just do M-x all-the-icons-install-fonts
;;;
;;; Code:
;;;
(require 'spaceline-all-the-icons)

;; (spaceline-all-the-icons--setup-anzu)            ;; Enable anzu searching
;; (spaceline-all-the-icons--setup-package-updates) ;; Enable package update indicator
(spaceline-all-the-icons--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git
;; (spaceline-all-the-icons--setup-paradox)         ;; Enable Paradox mode line
;; (spaceline-all-the-icons--setup-neotree)         ;; Enable Neotree mode line

(setq powerline-text-scale-factor 1.1)
(spaceline-all-the-icons-theme)

(provide 'init-spaceline-all-the-icons)
;;; init-spaceline-all-the-icons.el ends here
