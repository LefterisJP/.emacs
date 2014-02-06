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

;; these are the default arguments to ag, needed by the plugin
(setq ag-arguments-default '("--smart-case" "--nogroup" "--column" "--"))

(append (list "--ignore" "\"compile_commands.json\"") ag-arguments-default)
(when *at-work*
  (append (list "--ignore" "\"*.cfg\"" "--ignore" "\"*.html\"")
          ag-arguments-default))
(provide 'init-ag)
;;; init-ag.el ends here
