(require 'racer)
(setq racer-rust-src-path "/home/lefteris/w/rust_projects/rust/src")
(add-hook 'rust-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "M-.") #'racer-find-definition)
	     (local-set-key (kbd "TAB") #'racer-complete-or-indent)))
