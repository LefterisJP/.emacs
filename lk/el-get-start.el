;;; el-get-start --- My el-get initialization
;;; Commentary:
;; Initializes el-get, clones and installs it if it's not present
;; Then checks all the required packages and updates and installs them

;;; Code:
(require 'determine-location)

;; if we don't have el-get, install it
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; setup el-get directories
(setq el-get-user-package-directory "~/.emacs.d/el-get-user/init_files")
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(defun el-get-recompile-packages ()
  "Recompile all el-get downloaded packages."
  (interactive)
  (byte-recompile-directory "/home/lefteris/.emacs.d/el-get/"  nil 'force))

;; set extra makeflags for projects that support it
(setq el-get-parallel-make-args '("-j5"))

(defvar common-packages
  '(el-get                ; el-get is self hosting

    ; --- elisp improving libraries ---
    ; nice string manipulation library. https://github.com/magnars/s.el
    s
    ; A modern list library for emacs https://github.com/magnars/dash.el
    dash
    ; modern API for files and directories in Emacs https://github.com/rejeep/f.el
    f
    use-package           ; only use it for bind-key
    jedi                  ; needed by lsp-python and more
    elpy
    lsp-ui
    lsp-mode              ; languge server protocol mode. Should come before all places it's used
    lsp-pyright           ; lsp-mode client leveraging Pyright language server
    llvm-mode             ; mode for LLVM bitcode
    ;; android-mode          ; mode for android development
    anzu                  ; displays current/total matches info in the mode-line in search modes
    ag                    ; AG (The silver searcher) emacs frontend
    highlight-indentation ; for highlighting indentation
    highlight-symbol      ; for highlighting and navigating symbols
    solarized-emacs       ; solarized for emacs
    company-mode          ; complete anything mode
    ; rtags                 ; C/C++ tags Server/client package based on Clang
    ; malinka               ; C/C++ project management
    markdown-mode         ; a mark-down mode package for emacs
    rainbow-delimiters    ; highlights delimiters such as parentheses, brackets or braces according to their depth. Each successive level is highlighted in a different color.
    org-mode
    org-present           ; very simple org-mode presentation tool
    org-reveal            ; making presentations with org and reveal.js
    flycheck
    magit
    expand-region
    ace-jump-mode
    ;; sr-speedbar           ; same frame speedbar (testing it out)
    dockerfile-mode       ; emacs mode for docker files
    projectile
    helm-projectile
    ; flx
    ; haskell-mode          ; language mode for haskell
    solidity-mode
    cmake-mode
    go-mode
    web-mode             ; for editing html/css/javascript
    ; org2blog             ; for publishing from org-mode to wordpress
    helm                 ; incremental completion and selection narrowing framework
    yaml-mode            ; yaml editing mode, I use it a lot for ansible
    yasnippet            ; code snippets expansion
    smart-mode-line      ; a sexy mode-line for Emacs
    volatile-highlights  ; a very small package highlighting things that got yanked/deleted e.t.c.
    elisp-slime-nav      ; slime style tag navigation in elisp
    elisp-format         ; an elisp formatting tool
    rust-mode            ; for rust language support
    rustic               ; built on top of rust-mode
    multiple-cursors     ; multiple cursors in emacs!
    js2-mode
    py-isort
    tide
    vlf
    ))

(defvar el-get-packages-list)
(defvar work-only-packages '())
(defvar personal-only-packages '())
(if *at-work*
    (setq el-get-packages-list (append common-packages work-only-packages))
    (setq el-get-packages-list (append common-packages personal-only-packages)))

;; el-get does its magic to make sure all packages are there
(el-get 'sync el-get-packages-list)


(provide 'el-get-start)
;;; el-get-start ends here
