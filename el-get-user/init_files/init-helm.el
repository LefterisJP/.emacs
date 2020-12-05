;;; init-helm --- my helm initialization
;;; Commentary:
;; Manual:
;; https://github.com/emacs-helm/helm/wiki
;;
;; Tutorial:
;; http://tuhdo.github.io/helm-intro.html
;;
;; Exploring large projects with projectile
;; http://tuhdo.github.io/helm-projectile.html
;;; Code:
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(helm-mode 1) ;; should come before references to helm-map

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-quick-update                     t ; do not display invisible candidates
      helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(setq completion-styles `(basic partial-completion emacs22 initials
                                ,(if (version<= emacs-version "27.0") 'helm-flex 'flex)))


;; helm's version of execute command
(global-set-key (kbd "M-x") 'helm-M-x)

;; helm's mini buffer
(global-set-key (kbd "C-x b") 'helm-mini)

;; helm's version of find-files
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(provide 'init-helm)
;;; init-helm ends here
