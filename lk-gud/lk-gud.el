;; GDB-MI wiki: http://www.emacswiki.org/emacs/GDB-MI
;;

(setq old-map)

(defun undedicate-gud-windows ()
  "For emacs 24 undedicates some gud windows that are created

   In emacs 24 *input/output of* buffer windows becomes dedicated and
   in that window no other buffer can be shown which becomes quite annoying.
   This function makes sure that it's not dedicated.

   There are 2 issues with this. It definitely feels like not the best way
   to handle the problem. And secondly I don't know when to call the function.
   There is no (after-gdb-run) hook and even if I call it after my-gud-run
   with a delay it does not work. So it only works if any other of my-gud
   commands are given and is called for each one of them
  " 
  (interactive)
  (walk-windows (lambda (window) 
                  (setq bname (buffer-name (window-buffer window)))
                  (when (string-match "input/output of.*" bname)
                    (set-window-dedicated-p window nil)
                  )
                )
   )
)



(defun my-gud-cmd (c)
  "Send the given command to gdb also undedicating windows"
  (interactive)
  (gud-basic-call c)
  (undedicate-gud-windows)
)


(defun my-gud-call (s)
  "Send a command given by prompt to the debugger"
  (interactive "sCommand to send to the debugger: ")
  (setq cmd (format "%s" s))
  (my-gud-cmd cmd)
)

(defun my-gud-print (s)
  "Prints the value of a variable given by prompt"
  (interactive "sVariable to print: ")
  (setq cmd (format "print %s" s))
  (my-gud-cmd cmd)
)

(defun my-gud-set (var val)
  "Sets the given variable to a given value"
  (interactive "sVariable to set: ")
  (interactive "sValue to set: ")
  (setq cmd (format "set %s=%s" var val))
  (my-gud-cmd cmd)
)

(defun cycle-c-buffers ()
  "Cycles through all c-buffers and sets the keymap"
  (setq l (buffer-list))
  (while l
    (setq buff (pop l))
    (switch-to-buffer buff)
    (when (string= "c-mode" major-mode)
      (use-local-map old-map)
    )
  )
)


;; (setq my-prefix "C-d") ; this will be the prefix for some of the gdb commands
(setq my-prefix "\C-d") ; this will be the prefix for some of the gdb commands
(defun on-gdb-load()
  "Sets the keymap to have when we load gdb"
  (setq old-map (copy-keymap c-mode-map))
  ;; (define-key c-mode-map (kbd my-prefix) nil)
  ;; (define-key c-mode-map (kbd "C-e") 'my-gud-set)
  ;; (define-key c-mode-map (kbd "C-f") (lambda () (interactive) (my-gud-cmd "finish")))
  ;; (define-key c-mode-map (kbd "C-n") (lambda () (interactive) (my-gud-cmd "next")))
  ;; (define-key c-mode-map (kbd "C-s") (lambda () (interactive) (my-gud-cmd "step")))
  ;; (define-key c-mode-map (kbd "C-r") (lambda () (interactive) (my-gud-cmd "run")))
  ;; (define-key c-mode-map (kbd "C-l") 'gud-print)
  ;; (define-key c-mode-map (kbd "C-p") 'my-gud-print)
  ;; (define-key c-mode-map (kbd (format "%s c" my-prefix)) (lambda () (interactive) (my-gud-cmd "continue")))
  ;; (define-key c-mode-map (kbd (format "%s %s" my-prefix my-prefix)) 'my-gud-call)

  (define-key c-mode-map my-prefix nil)
  (define-key c-mode-map "\C-e" 'my-gud-set)
  (define-key c-mode-map "\C-f" (lambda () (interactive) (my-gud-cmd "finish")))
  (define-key c-mode-map "\C-n" (lambda () (interactive) (my-gud-cmd "next")))
  (define-key c-mode-map "\C-s" (lambda () (interactive) (my-gud-cmd "step")))
  (define-key c-mode-map "\C-r" (lambda () (interactive) (my-gud-cmd "run")))
  (define-key c-mode-map "\C-l" 'gud-print)
  (define-key c-mode-map "\C-p" 'my-gud-print)
  (define-key c-mode-map (format "%s c" my-prefix) (lambda () (interactive) (my-gud-cmd "continue")))
  (define-key c-mode-map (format "%s %s" my-prefix my-prefix) 'my-gud-call)
)


(defun on-gdb-unload()
  "When gud is killed reset the c-mode-map
     This is achieved by cycling through all c-mode-buffers
     and setting the keymap there
  "
  (when (string= "gud-mode" major-mode)
    (setq c-mode-map (copy-keymap old-map))
    (cycle-c-buffers)
  )
)
(add-hook 'gdb-mode-hook 'on-gdb-load)
(add-hook 'kill-buffer-hook 'on-gdb-unload)



(provide 'lk-gud)
