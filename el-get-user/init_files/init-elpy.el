(require 'elpy)

(setq elpy-rpc-python-command "python2")
(setq elpy-modules '(elpy-module-sane-defaults
		     elpy-module-company
		     elpy-module-eldoc
		     elpy-module-highlight-indentation
		     elpy-module-pyvenv
		     elpy-module-yasnippet))

;; python mode hook to deal with elpy configurations
(add-hook 'python-mode-hook
	  (lambda ()
	    ;; override elpy key-bindings
	    (use-local-map elpy-mode-map)
	    ;; override the move-block commands
	    (local-set-key (kbd "<H-right>") 'elpy-nav-move-iblock-right)
	    (local-set-key (kbd "<H-left>") 'elpy-nav-move-iblock-left)
	    ;; and put back the right word and left word bindings which they had overriden
	    (local-set-key (kbd "<M-left>") 'left-word)
	    (local-set-key (kbd "<M-right>") 'right-word)))
(elpy-enable)
