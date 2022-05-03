;;; Functions --- Useful elisp functions
;;; Commentary:
;; This is a file which loads useful Emacs functions
;; at startup
;;

;;; Code:

;; inhibit free variable and function warnings
(defvar current-indentation-spaces)

(declare-function remove-if-not "cl.el")
(declare-function decf "cl.el")
(declare-function incf "cl.el")


(defun my-indent-region (N)
  "Indent the region by N current indentation spaces."
  (interactive "p")
  (if mark-active
      (progn (indent-rigidly (min (mark) (point)) (max (mark) (point)) (* N current-indentation-spaces))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(defun my-unindent-region (N)
  "Unindent the region by N current indentation spaces."
  (interactive "p")
  (if mark-active
      (progn (indent-rigidly (min (mark) (point)) (max (mark) (point)) (* N (- current-indentation-spaces)))
             (setq deactivate-mark nil))
    (self-insert-command N)))
(global-set-key (kbd "C->") 'my-indent-region)
(global-set-key (kbd "C-<") 'my-unindent-region)

;--- Windmove START
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;----Toggle window dedication START ----
; Code taken from: http://stackoverflow.com/a/65992/110395
(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not."
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window
                                 (not (window-dedicated-p window))))
       "Window '%s' is dedicated"
     "Window '%s' is normal")
   (current-buffer)))
;bind it to the Home key
(global-set-key [home] 'toggle-window-dedicated)


;; kills all other buffers except the current one
(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))

;; reverts all buffers, by rereading the files they are all visiting
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files.") )

;; Duplicates a line
;; code borrowed from http://emacs-fu.blogspot.com/2010/01/duplicating-lines-and-commenting-them.html
(defun djcb-duplicate-line (&optional commentfirst)
  "Duplicate selected line.  If COMMENTFIRST is non-nil comment the original."
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (let ((str (buffer-substring (region-beginning) (region-end))))
    (when commentfirst
    (comment-region (region-beginning) (region-end)))
    (insert
      (concat (if (= 0 (forward-line 1)) "" "\n") str "\n"))
    (forward-line -1)))

(global-set-key (kbd "C-c d") 'djcb-duplicate-line)


;; Mark whole line
(defun mark-line ()
  "Mark a line."
  (interactive)
  (beginning-of-line)
  (push-mark (point) nil t)
  (end-of-line))
(global-set-key (kbd "C-c l") 'mark-line)

;; mark current defun (block)
(global-set-key (kbd "C-c j") 'mark-defun)
(global-set-key (kbd "M-s r") 'replace-string)


(defun pretty-print-json ()
  "Pretty print json files."
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool"
                             (buffer-name) t)))

(defun calc-eval-region (arg beg end)
  "Calculate the region ('BEG'-END) and replace it with its result.
With prefix ARG non-nil, echo the result instead"
  (interactive "P\nr")
  (let* ((expr (buffer-substring-no-properties beg end))
         (result (calc-eval expr)))
    (if (not (null arg))
        (message "%s = %s" expr result)
      (delete-region beg end)
      (save-excursion
        (insert result)))))
(global-set-key (kbd "C-c C-q") 'calc-eval-region)

;; Increase/decrease font size with Ctrl + mouse wheel
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

(defun lk-insert-byte (byte)
  "Give a decimal number of a BYTE to insert it raw in a buffer."
  (interactive "s")
  (insert (byte-to-string (string-to-number byte))))


(defun lk-plus-x% (val perc)
  "Increase VAL by PERC."
  (+ val (* val perc)))

(defun lk-minus-x% (val perc)
  "Decrease VAL by PERC."
  (- val (* val perc)))

(defun json-to-single-line (beg end)
  "Collapse prettified json in region between BEG and END to a single line

Taken from https://stackoverflow.com/questions/39861580/emacs-program-to-collapse-json-to-single-line
"
  (interactive "r")
  (if (use-region-p)
      (save-excursion
        (save-restriction
          (narrow-to-region beg end)
          (goto-char (point-min))
          (while (re-search-forward "[[:space:]\n]+" nil t)
            (replace-match ""))))
    (print "This function operates on a region")))

(provide 'load-functions)
;;; load-functions.el ends here
