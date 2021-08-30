(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" default))
 '(evil-undo-system 'undo-tree)
 '(package-selected-packages
   '(helm-bibtexkey undo-tree dashboard org-roam-server ivy-bibtex org-roam-bibtex org-ref evil-magit base16-theme treemacs evil-org helm evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

(use-package evil
:ensure t
:init
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
:config
(evil-mode 1))

(use-package evil-collection
:after evil
:ensure t
:config
(evil-collection-init))
    (use-package base16-theme )
    (use-package eradio)
    (use-package evil-org )
    (use-package org-download)
    (use-package evil-org-agenda )
    (use-package origami 
	:hook (global-origami-mode))
    (use-package helm )
    (use-package neotree )
    (use-package evil-leader )
    ;(use-package evil-magit )
    (use-package org-roam-server )
    (use-package org-bullets)
    (use-package olivetti)
    (use-package helm-bibtex)
    (use-package evil-org-agenda)
    (use-package org)
    (use-package ivy)
    (use-package eyebrowse)
    (use-package magit)
    (use-package poet-theme)
    (use-package apropospriate)
    (require 'ls-lisp)
    (setq ls-lisp-use-insert-directory-program nil)
    (use-package undo-tree
    )
    (use-package org-roam
	:after org
	:hook (org-mode . org-roam-mode)
	:custom
	(org-roam-directory "/home/gdreyfus/org-roam/")
	:bind
	("C-c n l" . org-roam)
	("C-c n t" . (lambda () (interactive) (find-file "~/org-roam/20201020103239-daily.org")))
	("C-c n f" . org-roam-find-file)
	("C-c n i" . org-roam-insert)
	("C-c n b" . org-roam-buffer-activate)
	("C-c n c" . org-roam-capture)
	("C-c n g" . org-roam-show-graph))
    (use-package org-roam-bibtex
	:after org-roam
	:load-path "~/.emacs.d/lib/org-roam-bibtex/"
	:hook (org-roam-mode . org-roam-bibtex-mode))
    (use-package dashboard :ensure t :config (dashboard-setup-startup-hook))

(evil-mode 1)
(with-eval-after-load 'evil-maps (define-key evil-motion-state-map (kbd "RET") nil))
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(evil-org-agenda-set-keys)
(evil-leader/set-key
	"m a" 'org-agenda
	"a a" 'org-archive-done-tasks
	"f s" 'save-buffer
	"<SPC>" 'execute-extended-command
	"g s" 'magit-status-here
	"b b" 'helm-recentf
	"w d" 'evil-window-delete
	"w v" 'evil-window-vsplit
	"t l" 'toggle-truncate-lines
	"m i c" 'orb-insert
	"b n" 'next-buffer
	"b p" 'previous-buffer
	"r p" 'eradio-play
	"r s" 'eradio-stop
	"n f" 'org-roam-find-file
	"n i" 'org-roam-insert
	"c r" 'comment-region
	"c l" 'comment-line
	"c d" 'org-deadline
	"l w 0 " 'eyebrowse-switch-to-window-config-0
	"l w 1 " 'eyebrowse-switch-to-window-config-1
	"l w 2 " 'eyebrowse-switch-to-window-config-2
	"l w 3 " 'eyebrowse-switch-to-window-config-3
	"l w 4 " 'eyebrowse-switch-to-window-config-4
	"l w 5 " 'eyebrowse-switch-to-window-config-5
	"l w 6 " 'eyebrowse-switch-to-window-config-6
	"l w 7 " 'eyebrowse-switch-to-window-config-7
	"l w 8 " 'eyebrowse-switch-to-window-config-8
	"l w 9 " 'eyebrowse-switch-to-window-config-9
	"e" 'mu4e
	"p t" 'neotree-toggle)

(setq org-todo-keywords
	    '((sequence "TODO" "INPROGRESS" "WAITING" "|" "DONE")))
    (setq org-todo-keyword-faces
	    '(("TODO" . "red") ("INPROGRESS" . "orange") ("WAITING" . (:foreground "blue" :weight bold))))
(setq org-ellipsis "  ")
(add-hook 'org-mode-hook 'evil-org-mode)

(setq org-agenda-block-separator (string-to-char " "))
(setq org-deadline-warning-days 0)
(setq org-agenda-files (list "/home/gdreyfus/org-roam/20200915220906-topobaric.org"
    "/home/gdreyfus/org-roam/20200930130018-school.org" 
    "/home/gdreyfus/org-roam/20201002151401-argo_moc.org"
    "/home/gdreyfus/org-roam/20201020103239-daily.org"
    "/home/gdreyfus/org-roam/20201008200919-deep_inverse_modeling.org"
    "/home/gdreyfus/org-roam/20200915230739-gradapps.org"))
'(org-agenda-prefix-format "   %-6:c ~>  ")
'(org-agenda-show-all-dates nil)
'(org-agenda-skip-timestamp-if-deadline-is-shown t)
'(org-agenda-todo-ignore-with-date t)
(setq org-agenda-start-on-weekday nil)

(setq org-roam-completion-system 'ivy)
(defconst org-roam-packages
 '(org-roam org-roam-bibtex))

(setq dashboard-items '((recents . 10)))
(setq dashboard-set-footer nil)
(setq dashboard-center-content t)
(setq dashboard-set-init-info nil)

(setq org-ref-default-bibliography (list "/home/gdreyfus/Zotero/library.bib")
    org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex)
(setq bibtex-completion-bibliography (list "/home/gdreyfus/Zotero/library.bib")
			bibtex-completion-pdf-field "file")

(add-hook 'org-mode-hook 'variable-pitch-mode)
;; (add-hook 'org-agenda-finalize-hook 'variable-pitch-mode)
 (add-hook 'text-mode-hook 'olivetti-mode)
 (add-hook 'org-mode-hook 'olivetti-mode)
 (add-hook 'org-agenda-finalize-hook 'olivetti-mode)
 (defun org-line-wrap () (setq-local word-wrap nil))

 (add-hook 'org-mode-hook 'org-line-wrap)
 (add-hook 'org-mode-hook 'org-bullets-mode)
 (setq olivetti-body-width 80)

(setq eradio-channels '(("def con - soma fm" . "https://somafm.com/defcon256.pls")
                      ("cafe - lainon"     . "https://lainon.life/radio/cafe.ogg.m3u")
                      ("deep space one"     . "http://somafm.com/m3u/deepspaceone130.m3u")
                      ("7 inch soul"     . "http://somafm.com/m3u/7soul130.m3u")
		      ("left coast 70s" . "http://somafm.com/m3u/seventies130.m3u")
		      ("groove salad" . "http://somafm.com/m3u/groovesalad130.m3u")
		      ("mostwanted" . "http://5.39.71.159:8169/listen.pls" )
		      ("jazz24" . "https://live.wostreaming.net/playlist/ppm-jazz24aac256-ibc1.m3u")))

(load-theme 'base16-tomorrow-night t)
   (eyebrowse-mode t)

   (setq-default truncate-lines t)
   (custom-set-variables '(ls-lisp-verbosity nil))
   (ivy-mode 1)
   (global-undo-tree-mode)
   (toggle-scroll-bar -1)
   (tool-bar-mode -1)
   (menu-bar-mode -1)
   (setq org-return-follows-link t)
   (add-to-list 'default-frame-alist
	       '(font . "Source Code Pro"))
   (setq-default ls-lisp-verbosity nil)
(setq line-number-mode t)

(require 'mu4e)
     (load-file "~/.emacs.d/lib/mu4e-thread-folding/mu4e-thread-folding.el")
     (define-key mu4e-headers-mode-map (kbd "<tab>")     'mu4e-headers-toggle-thread-folding)
     (define-key mu4e-headers-mode-map (kbd "<backtab>")     'mu4e-headers-fold-all)
	;; use mu4e for e-mail in emacs
	(setq mail-user-agent 'mu4e-user-agent)

	(setq mu4e-drafts-folder "/[Gmail].Drafts")
	(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
	(setq mu4e-trash-folder  "/[Gmail].Trash")

	(setq mu4e-update-interval 120)
	;; don't save message to Sent Messages, Gmail/IMAP takes care of this
	(setq mu4e-sent-messages-behavior 'delete)

	;; (See the documentation for `mu4e-sent-messages-behavior' if you have
	;; additional non-Gmail addresses and want assign them different
	;; behavior.)

	;; setup some handy shortcuts
	;; you can quickly switch to your Inbox -- press ``ji''
	;; then, when you want archive some messages, move them to
	;; the 'All Mail' folder by pressing ``ma''.

	(setq mu4e-maildir-shortcuts
	    '( (:maildir "/INBOX"              :key ?i)
	       (:maildir "/[Gmail].Sent Mail"  :key ?s)
	       (:maildir "/[Gmail].Trash"      :key ?t)
	       (:maildir "/[Gmail].Archive"      :key ?r)
	       (:maildir "/[Gmail].All Mail"   :key ?a)))

	;; allow for updating mail using 'U' in the main view:
	(setq mu4e-get-mail-command "offlineimap")

	;; something about ourselves
	(setq
	   user-mail-address "garrettdreyfus@gmail.com"
	   user-full-name  "Garrett Finucane"
	   mu4e-compose-signature
	    (concat
	      ""
	      ""))

	;; sending mail -- replace USERNAME with your gmail username
	;; also, make sure the gnutls command line utils are installed
	;; package 'gnutls-bin' in Debian/Ubuntu

	(require 'smtpmail)
	(setq message-send-mail-function 'smtpmail-send-it
	   starttls-use-gnutls t
	   smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
	   smtpmail-auth-credentials
	     '(("smtp.gmail.com" 587 "garrettdreyfus@gmail.com" nil))
	   smtpmail-default-smtp-server "smtp.gmail.com"
	   smtpmail-smtp-server "smtp.gmail.com"
	   smtpmail-smtp-service 587)

	;; alternatively, for emacs-24 you can use:
	;;(setq message-send-mail-function 'smtpmail-send-it
	;;     smtpmail-stream-type 'starttls
	;;     smtpmail-default-smtp-server "smtp.gmail.com"
	;;     smtpmail-smtp-server "smtp.gmail.com"
	;;     smtpmail-smtp-service 587)

	;; don't keep message buffers around
	(setq message-kill-buffer-on-exit t)
(setq mail-user-agent 'mu4e-user-agent)
   (require 'org-msg)
   (setq org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \\n:t"
	  org-msg-startup "hidestars indent inlineimages")

(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (org-element-property :begin (org-element-at-point))))
   "/DONE" 'tree))
