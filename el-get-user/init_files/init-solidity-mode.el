(require 'flycheck)
(require 'solidity-mode)
(setq solidity-solc-path "/home/lefteris/ew/solidity/build/solc/solc")
(add-to-list 'flycheck-checkers 'solidity-checker)
