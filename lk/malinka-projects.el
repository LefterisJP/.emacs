;;; malinka-projects --- Set up malinka projects
;;; Commentary:
;; Set up all malinka projects to be loaded at startup

;;; Code:
;; (require 'malinka)

;; (add-hook 'c-mode-common-hook 'malinka-mode)

;; (malinka-define-project
;;  :name "rfbase"
;;  :root-directory "/home/lefteris/w/refulang/rfbase"
;;  :build-directory "/home/lefteris/w/refulang/rfbase/build"
;;  :configure-cmd "cmake .. -DCMAKE_BUILD_TYPE=Debug"
;;  :compile-cmd "make -j4"
;;  :test-cmd "./test.sh")

;; (malinka-define-project
;;  :name "refu"
;;  :root-directory "/home/lefteris/w/refulang/refu"
;;  :build-directory "/home/lefteris/w/refulang/refu/build"
;;  :configure-cmd "cmake .. -DCMAKE_BUILD_TYPE=Debug -DTEST=1"
;;  :compile-cmd "make -j4"
;;  :test-cmd "./test.sh")

;; (malinka-define-project
;;  :name "solidity"
;;  :root-directory "/home/lefteris/ew/solidity"
;;  :build-directory "/home/lefteris/ew/solidity/build"
;;  :configure-cmd "cmake .. -DCMAKE_BUILD_TYPE=Debug"
;;  :compile-cmd "make -j4"
;;  :test-cmd "./test/soltest")

(provide 'malinka-projects)
;;; malinka-projects.el ends here
