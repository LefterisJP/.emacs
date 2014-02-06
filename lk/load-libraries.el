;;; Libraries --- Libraries I need, not managed by el-get
;;; Commentary:
;; All of Emacs standard libraries, not manages by el-get
;; that I need for my setup
;;

;;; Code:

;; Buffers visiting files with same name have unique names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

;---- WHITESPACE START ----
(require 'whitespace)
 ;;White space module for visualizing trailing spaces, tabs and newlines
;(autoload 'whitespace-mode           "whitespace" "Toggle whitespace visualization."        t)
;(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)
(setq whitespace-style '(space-mark trailing tabs newline tab-mark newline-mark face))
 ;;mapping of how the characters should look at whitespace
(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. ℯℊ (insert-char 182 1)
      '(
        (space-mark 32 [183] [46]) ; 32 SPACE 「 」,  46 FULL STOP 「.」
        (newline-mark 10 [182 10] [92 9])  ; 10 LINE FEED is Pilcrow
        (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
        ))

;; --- window resize from emacs wiki
(add-to-list 'load-path "~/.emacs.d/window-resize/")
(require 'emacs-wiki-window-resize)

;; load clang format integration and add a shortcut key
(load "/usr/share/clang/clang-format.el")
(defvar my-clang-format-style
  "{
AccessModifierOffset: -2,
AlignAfterOpenBracket: false,
AlignEscapedNewlinesLeft: false,
AlignOperands:   true,
AlignTrailingComments: true,
AllowAllParametersOfDeclarationOnNextLine: false,
AllowShortBlocksOnASingleLine: false,
AllowShortCaseLabelsOnASingleLine: false,
AllowShortIfStatementsOnASingleLine: false,
AllowShortLoopsOnASingleLine: false,
AllowShortFunctionsOnASingleLine: Inline,
AlwaysBreakAfterDefinitionReturnType: false,
AlwaysBreakBeforeMultilineStrings: false,
AlwaysBreakTemplateDeclarations: false,
BinPackParameters: true,
BinPackArguments: true,
BreakBeforeBinaryOperators: None,
BreakBeforeBraces: Linux,
BreakBeforeTernaryOperators: true,
BreakConstructorInitializersBeforeComma: true,
ColumnLimit:     80,
CommentPragmas:  '^ IWYU pragma:',
ConstructorInitializerAllOnOneLineOrOnePerLine: true,
ConstructorInitializerIndentWidth: 4,
ContinuationIndentWidth: 4,
Cpp11BracedListStyle: false,
DerivePointerAlignment: false,
DisableFormat: false,
ForEachMacros:   [ htable_foreach, rf_objset_foreach, darray_foreach, darray_foreach_reverse, Q_FOREACH, BOOST_FOREACH ],
IndentCaseLabels: false,
IndentWidth:     4,
IndentWrappedFunctionNames: false,
IndentFunctionDeclarationAfterType: false,
KeepEmptyLinesAtTheStartOfBlocks: false,
Language:        Cpp,
MaxEmptyLinesToKeep: 2,
NamespaceIndentation: None,
ObjCBlockIndentWidth: 2,
ObjCSpaceAfterProperty: false,
ObjCSpaceBeforeProtocolList: true,
PenaltyBreakBeforeFirstCallParameter: 19,
PenaltyBreakComment: 300,
PenaltyBreakString: 1000,
PenaltyBreakFirstLessLess: 120,
PenaltyExcessCharacter: 1000000,
PenaltyReturnTypeOnItsOwnLine: 60,
PointerAlignment: Right,
SpaceAfterCStyleCast: false,
SpaceBeforeAssignmentOperators: true,
SpaceBeforeParens: ControlStatements,
SpaceInEmptyParentheses: false,
SpacesBeforeTrailingComments: 2,
SpacesInAngles:  false,
SpacesInCStyleCastParentheses: false,
SpacesInContainerLiterals: false,
SpacesInParentheses: false,
SpacesInSquareBrackets: false,
Standard:        Auto,
TabWidth:        4,
UseTab:          Never
}")
(global-set-key [C-M-tab] (lambda ()
   (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list (point) (point))))
   (clang-format-region ( clang-format-region my-clang-format-style))))

(provide 'load-libraries)
;;; load-libraries.el ends here
