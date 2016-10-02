;;; malinka-projects --- Set up malinka projects
;;; Commentary:
;; Set up all malinka projects to be loaded at startup

;;; Code:
(require 'malinka)

(add-hook 'c-mode-common-hook 'malinka-mode)

(malinka-define-project
 :name "rfbase"
 :root-directory "/home/lefteris/w/refulang/rfbase"
 :build-directory "/home/lefteris/w/refulang/rfbase/build"
 :configure-cmd "cmake .. -DCMAKE_BUILD_TYPE=Debug"
 :compile-cmd "make -j4"
 :test-cmd "./test.sh")

(malinka-define-project
 :name "refu"
 :root-directory "/home/lefteris/w/refulang/refu"
 :build-directory "/home/lefteris/w/refulang/refu/build"
 :configure-cmd "cmake .. -DCMAKE_BUILD_TYPE=Debug -DTEST=1"
 :compile-cmd "make -j4"
 :test-cmd "./test.sh")

(malinka-define-project
 :name "libweb3core"
 :root-directory "/home/lefteris/ew/libweb3core"
 :build-directory "/home/lefteris/ew/libweb3core/build"
 :configure-cmd "cmake .. -DCMAKE_BUILD_TYPE=Debug"
 :compile-cmd "make -j4"
 :test-cmd "NOTESTS")

(malinka-define-project
 :name "libethereum"
 :root-directory "/home/lefteris/ew/libethereum"
 :build-directory "/home/lefteris/ew/libethereum/build"
 :configure-cmd "cmake .. -DCMAKE_BUILD_TYPE=Debug"
 :compile-cmd "make -j4"
 :test-cmd "./test/testeth")

(malinka-define-project
 :name "webthree"
 :root-directory "/home/lefteris/ew/webthree"
 :build-directory "/home/lefteris/ew/webthree/build"
 :configure-cmd "cmake .. -DCMAKE_BUILD_TYPE=Debug"
 :compile-cmd "make -j4"
 :test-cmd "./test/testweb3")

(malinka-define-project
 :name "solidity"
 :root-directory "/home/lefteris/ew/solidity"
 :build-directory "/home/lefteris/ew/solidity/build"
 :configure-cmd "cmake .. -DCMAKE_BUILD_TYPE=Debug"
 :compile-cmd "make -j4"
 :test-cmd "./test/soltest")

(malinka-define-project
 :name "alethzero"
 :root-directory "/home/lefteris/ew/alethzero"
 :build-directory "/home/lefteris/ew/alethzero/build"
 :configure-cmd "cmake .. -DCMAKE_BUILD_TYPE=Debug"
 :compile-cmd "make -j4"
 :test-cmd "NOTESTS")

(malinka-define-project
 :name "mix"
 :root-directory "/home/lefteris/ew/mix"
 :build-directory "/home/lefteris/ew/mix/build"
 :configure-cmd "cmake .. -DCMAKE_BUILD_TYPE=Debug"
 :compile-cmd "make -j4"
 :test-cmd "NOTESTS")

(malinka-define-project
 :name "ethash"
 :root-directory "/home/lefteris/ew/ethash"
 :build-directory "/home/lefteris/ew/ethash/build"
 :configure-cmd "cmake .."
 :compile-cmd "make -j4"
 :test-cmd "cd /home/lefteris/ew/ethash && ./test/c/test.sh")

(provide 'malinka-projects)
;;; malinka-projects.el ends here
