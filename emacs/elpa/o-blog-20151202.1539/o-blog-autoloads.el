;;; o-blog-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "o-blog" "o-blog.el" (22928 54717 0 0))
;;; Generated autoloads from o-blog.el

(autoload 'o-blog-publish "o-blog" "\
Publish FILE using o-blog BACKEND.

If FILE is not provided, try to guess FILE and BACKEND from
current buffer.

\(fn &optional FILE BACKEND)" t nil)

(autoload 'o-blog-publish-async "o-blog" "\
Publish FILE synchronously using BACKEND.

\(fn FILE)" nil nil)

;;;***

;;;### (autoloads nil "o-blog-i18n" "o-blog-i18n.el" (22928 54717
;;;;;;  0 0))
;;; Generated autoloads from o-blog-i18n.el

(autoload 'ob:gettext "o-blog-i18n" "\
Return part of `o-blog-i18n' that matches TEXT in LANG.

If LANG is not defined, the blog \"#+LANGUAGE:\" header would be
used. If not found, English (en) is used as a fall-back.

\(fn TEXT &optional LANG)" nil nil)

;;;***

;;;### (autoloads nil nil ("o-blog-backend-markdown.el" "o-blog-backend-org.el"
;;;;;;  "o-blog-backend.el" "o-blog-entry.el" "o-blog-framework.el"
;;;;;;  "o-blog-obsolete.el" "o-blog-pkg.el" "o-blog-tag.el" "o-blog-utils.el")
;;;;;;  (22928 54717 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; o-blog-autoloads.el ends here
