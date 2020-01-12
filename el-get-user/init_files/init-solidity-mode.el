;;; init-solidity-mode --- my solidity-mode configuration
;;; Commentary:
;; Github: https://github.com/ethereum/emacs-solidity

;;; Code:
(require 'flycheck)
(setq solidity-solc-path "/home/lefteris/.local/bin/solc")
(setq solidity-solium-path "/home/lefteris/.npm-global/bin/solium")
(setq solidity-flycheck-solc-checker-active t)
;; (setq solidity-flycheck-solium-checker-active t)
(setq flycheck-solidity-solium-soliumrcfile "/home/lefteris/.emacs.d/solidity/.soliumrc.json")
(require 'solidity-flycheck)
(require 'solidity-mode)
(setq solidity-comment-style 'slash)
(add-hook 'solidity-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 (append '((company-solidity company-capf company-dabbrev-code))
                         company-backends))))
(provide 'init-solidity-mode)
;;; init-solidity-mode.el ends here
