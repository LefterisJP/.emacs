;;; Init-monky --- Initialize the monky HG VCS package
;;; Commentary:
;; Initializes the package I use for mercurial handling from
;; inside Emacs.
;; The manual is here: http://ananthakumaran.in/monky/index.html

;;; Code:
(require 'monky)

;; By default monky spawns a seperate hg process for every command.
;; This will be slow if the repo contains lot of changes.
;; if `monky-process-type' is set to cmdserver then monky will spawn a single
;; cmdserver and communicate over pipe.
;; Available only on mercurial versions 1.9 or higher
(setq monky-process-type 'cmdserver)


;; Currently there is no way to provide arguments to hg-blame
;; so I redefine the function here. This should be fixed
(defun monky-refresh-blame-buffer (file-name)
  (monky-create-buffer-sections
    (monky-with-section file-name 'blame
      (monky-hg-section nil nil
			#'monky-wash-blame
			"blame"
			"--user"
			"--changeset"
      "--ignore-all-space"
			file-name))))

(provide 'init-monky)
;;; init-monky.el ends here
