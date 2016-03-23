;;; lk-avatar.el --- My personal avatar for use in the scratch buffer  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Lefteris Karapetsas

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(defconst lk-avatar-file (locate-user-emacs-file "lefteris-avatar.png")
  "The path to my avatar.")

(defconst lk-avatar-url "http://lefteris.refu.co/images/profile3.png"
  "The URL of my avatar.")

;;;###autoload
(defun lk-insert-avatar ()
  "Insert my avatar into the current buffer."
  (interactive)
  (unless (file-exists-p lk-avatar-file)
    (url-copy-file lk-avatar-url lk-avatar-file
                   nil 'keep-time))
  (insert-image (create-image lk-avatar-file) "avatar")
  (insert "\n"))

;;;###autoload
(defun lk-insert-avatar-into-scratch ()
  "Insert my avatar into the scratch buffer."
  (with-current-buffer "*scratch*"
    (goto-char (point-max))
    (insert (format "%s\n\n" initial-scratch-message))
    (lk-insert-avatar)))

(provide 'lk-avatar)
;;; lk-avatar.el ends here
