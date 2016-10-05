;;; elpy --- My configuration for the elpy package
;;; Commentary:
;;; More info here:
;;; https://github.com/jorgenschaefer/elpy

(require 'elpy)
(require 'jedi)
(require 'ropemacs)

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
	    ;; Undefine jedi and elpy jumping keybindings
	    (define-key jedi-mode-map (kbd "C-c .") nil)
	    (define-key jedi-mode-map (kbd "C-c ,") nil)
	    (define-key elpy-mode-map (kbd "M-.") nil)
	    (define-key elpy-mode-map (kbd "M-,") nil)
	    ;; override elpy key-bindings
	    (use-local-map elpy-mode-map)
	    ;; Redefine the jumping keybindings as I like them
	    (local-set-key (kbd "M-.") 'jedi:goto-definition)
	    (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)
	    ;; override the move-block commands
	    (local-set-key (kbd "<H-right>") 'elpy-nav-move-iblock-right)
	    (local-set-key (kbd "<H-left>") 'elpy-nav-move-iblock-left)
	    ;; and put back the right word and left word bindings which they had overriden
	    (local-set-key (kbd "<M-left>") 'left-word)
	    (local-set-key (kbd "<M-right>") 'right-word)
	    ;; set some ropemacs keybindings
	    (local-set-key (kbd "C-c f") 'rope-find-occurrences)
	    (local-set-key (kbd "C-c r d") 'rope-show-doc)
	    (local-set-key (kbd "C-c r o") 'rope-organize-imports)))

(elpy-enable)
(setq elpy-rpc-backend "jedi")

(provide 'init-elpy)
;;; init-elpy.el ends here
