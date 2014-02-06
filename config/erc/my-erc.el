;;; my-erc.el --- My configuration for the Emacs iRc Client
;;; Commentary:
;;  More information: http://www.gnu.org/software/emacs/manual/html_mono/erc.htm
;;; Code:

(require 'erc)

;; activate specific modules
(setq erc-modules (append erc-modules '(services)))
(erc-update-modules)
             
;; Join some channels whenever connecting to Freenode
(setq erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#ethereum" "#snappy")))

;; Set defaults for server and nickname
(setq erc-server "irc.freenode.net")
(setq erc-nick "LefterisJP")

;; check channels
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))
;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))


;; Interpret mIRC-style color commands in IRC chats
(setq erc-interpret-mirc-color t)
;; Kill buffers for channels after /part
(setq erc-kill-buffer-on-part t)
;; Kill buffers for private queries after quitting the server
(setq erc-kill-queries-on-quit t)
;; Kill buffers for server messages after quitting the server
(setq erc-kill-server-buffer-on-quit t)

(provide 'my-erc)
;;; my-erc.el ends here
