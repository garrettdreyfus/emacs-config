;;; eradio-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "eradio" "eradio.el" (0 0 0 0))
;;; Generated autoloads from eradio.el

(defvar eradio-channels 'nil "\
Eradio's radio channels.")

(custom-autoload 'eradio-channels "eradio" t)

(autoload 'eradio-stop "eradio" "\
Stop the radio player." t nil)

(autoload 'eradio-toggle "eradio" "\
Toggle the radio player." t nil)

(autoload 'eradio-play "eradio" "\
Play a radio channel, do what I mean.

\(fn &optional URL)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eradio" '("eradio-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; eradio-autoloads.el ends here
