;;; org-ref-prettify-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "org-ref-prettify" "org-ref-prettify.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from org-ref-prettify.el

(autoload 'org-ref-prettify-mode "org-ref-prettify" "\
Toggle Org Ref Prettify mode.

If called interactively, enable Org-Ref-Prettify mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\\{org-ref-prettify-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'org-ref-prettify-edit-link-at-point "org-ref-prettify" "\
Edit the current citation link in the minibuffer.
WHERE means where the point should be put in the minibuffer.  If
it is nil, try to be smart about its placement; otherwise, it can
be one of: `type', `key', `page', `beg', or `end'.

\(fn &optional WHERE)" t nil)

(autoload 'org-ref-prettify-edit-link-at-mouse "org-ref-prettify" "\
Edit the citation link at mouse position in the minibuffer.
This should be bound to a mouse click EVENT type.
See `org-ref-prettify-edit-link-at-point' for the meaning of WHERE.

\(fn EVENT &optional WHERE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-prettify" '("org-ref-prettify-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-ref-prettify-autoloads.el ends here
