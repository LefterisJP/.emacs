;;; init-ag --- my ag configuration
;;; Commentary:
;;; AG (The silver searcher) frontend for Emacs
;;; For more details or customization options visit:
;;; https://github.com/Wilfred/ag.el/#agel
;;;
;;; Code:

(require 'ag)
(require 'determine-location)

(setq ag-highlight-search t)
;; Don't keep old search buffers around
(setq ag-reuse-buffers 't)
;; Don't group same file results -- breaks jumping to files
(setq ag-group-matches nil)

;; these are the default arguments to ag, needed by the plugin
(setq ag-arguments '(
		     "--smart-case"
		     "--nogroup"
		     "--column"
		     "--ignore" "compile_commands.json"
		     "--"))
(provide 'init-ag)
;;; init-ag.el ends here
