;;; tree-sitter --- my tree-sitter configuration
;;; Commentary:
;;;
;;; A nice tutorial: https://www.masteringemacs.org/article/how-to-get-started-tree-sitter
;;; Code:
(require 'tree-sitter)
(require 'tree-sitter-langs)

;; you need to do M-x treesit-install-language-grammar for each language
(setq treesit-language-source-alist
      '((typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
	(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
	))

;; can also use the below for bulk install
;; from https://www.masteringemacs.org/article/how-to-get-started-tree-sitter
; (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))


(setq major-mode-remap-alist
      '((typescript-mode . typescript-ts-mode)))

;; associate ts file with typescript treesitter
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
