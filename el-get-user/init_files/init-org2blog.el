;;; init-org2blog --- my org2blog configuration
;;; Commentary:
;;; An org mode to wordpress publishing module
;;; For more details or customization options visit:
;;; https://github.com/punchagan/org2blog
;;;
;;; Code:
(require 'netrc)

(setq blog (netrc-machine (netrc-parse "~/.netrc") "my-wordpress-blog" t))
(setq org2blog/wp-blog-alist
      '(("my-wordpress-blog"
         :url "http://blog.refu.co/xmlrpc.php"
         :username "Lefteris")))


