;;; nano-modeline-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "nano-modeline" "nano-modeline.el" (0 0 0 0))
;;; Generated autoloads from nano-modeline.el

(defvar nano-modeline-mode nil "\
Non-nil if Nano-Modeline mode is enabled.
See the `nano-modeline-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `nano-modeline-mode'.")

(custom-autoload 'nano-modeline-mode "nano-modeline" nil)

(autoload 'nano-modeline-mode "nano-modeline" "\
Toggle nano-modeline minor mode

If called interactively, enable Nano-Modeline mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nano-modeline" '("nano-modeline")))

;;;***

;;;### (autoloads nil nil ("nano-modeline-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; nano-modeline-autoloads.el ends here
