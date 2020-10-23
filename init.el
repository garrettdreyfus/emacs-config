(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(base16-atelier-cave))
 '(custom-safe-themes
   '("fede08d0f23fc0612a8354e0cf800c9ecae47ec8f32c5f29da841fe090dfc450" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "31e9b1ab4e6ccb742b3b5395287760a0adbfc8a7b86c2eda4555c8080a9338d9" "69e7e7069edb56f9ed08c28ccf0db7af8f30134cab6415d5cf38ec5967348a3c" "a85e40c7d2df4a5e993742929dfd903899b66a667547f740872797198778d7b5" "60e09d2e58343186a59d9ed52a9b13d822a174b33f20bdc1d4abb86e6b17f45b" "732ccca2e9170bcfd4ee5070159923f0c811e52b019106b1fc5eaa043dff4030" "0961d780bd14561c505986166d167606239af3e2c3117265c9377e9b8204bf96" "a61109d38200252de49997a49d84045c726fa8d0f4dd637fce0b8affaa5c8620" "c614d2423075491e6b7f38a4b7ea1c68f31764b9b815e35c9741e9490119efc0" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" default))
 '(evil-undo-system 'undo-tree)
 '(org-format-latex-options
   '(:foreground default :background default :scale 1.6 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-publish-project-alist '((publishing-directory . "~/org-roam/exports/")))
 '(org-roam-server-mode t)
 '(package-selected-packages
   '(eradio swiper-helm helm-bibtexkey undo-tree dashboard org-roam-server ivy-bibtex org-roam-bibtex org-ref evil-magit base16-theme treemacs projectile evil-org helm evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-scheduled ((t (:foreground "dark orange")))))
