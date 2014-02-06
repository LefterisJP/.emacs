;;; refu-docs-publishing.el --- Code to publish refu documentation to html pages
;;; Commentary:
;;;
;;; Code:

(require 'ox-publish)
(setq org-publish-project-alist
        '(("refudocs"
           :components ("refudocs-content" "refudocs-static"))
          ("refudocs-content"
           :base-directory "/home/lefteris/w/refu/documentation/"
           :base-extension "org"
           :publishing-directory "/ssh:refu:~/public_html/refulang/"
           :recursive t
           :publishing-function org-html-publish-to-html
           :export-with-tags nil
           :headline-levels 4
           :table-of-contents nil
           :section-numbers nil
           :sub-superscript nil
           :todo-keywords nil
           :author nil
           :creator-info nil
           :html-preamble nil
           :html-postamble nil
           :style "This is raw html for stylesheet <link>'s"
           :timestamp t
           :exclude-tags ("noexport" "todo")
           :auto-preamble t)
          ("refudocs-static"
           :base-directory "/home/lefteris/w/refu/documentation/"
           :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|otf"
           :publishing-directory "/ssh:refu:~/public_html/refulang/"
           :recursive t
           :publishing-function org-publish-attachment)))

(provide 'refu-docs-publishing)
;;; refu-docs-publishing.el ends here
