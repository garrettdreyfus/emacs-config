(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#19171c" "#be4678" "#2a9292" "#a06e3b" "#576ddb" "#955ae7" "#576ddb" "#8b8792"])
 '(custom-enabled-themes poet-dark)
 '(custom-safe-themes
   '("70f5a47eb08fe7a4ccb88e2550d377ce085fedce81cf30c56e3077f95a2909f2" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" "28a104f642d09d3e5c62ce3464ea2c143b9130167282ea97ddcc3607b381823f" "b0334e8e314ea69f745eabbb5c1817a173f5e9715493d63b592a8dc9c19a4de6" "146061a7ceea4ccc75d975a3bb41432382f656c50b9989c7dc1a7bb6952f6eb4" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "3de3f36a398d2c8a4796360bfce1fa515292e9f76b655bb9a377289a6a80a132" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "fec45178b55ad0258c5f68f61c9c8fd1a47d73b08fb7a51c15558d42c376083d" "fede08d0f23fc0612a8354e0cf800c9ecae47ec8f32c5f29da841fe090dfc450" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "31e9b1ab4e6ccb742b3b5395287760a0adbfc8a7b86c2eda4555c8080a9338d9" "69e7e7069edb56f9ed08c28ccf0db7af8f30134cab6415d5cf38ec5967348a3c" "a85e40c7d2df4a5e993742929dfd903899b66a667547f740872797198778d7b5" "60e09d2e58343186a59d9ed52a9b13d822a174b33f20bdc1d4abb86e6b17f45b" "732ccca2e9170bcfd4ee5070159923f0c811e52b019106b1fc5eaa043dff4030" "0961d780bd14561c505986166d167606239af3e2c3117265c9377e9b8204bf96" "a61109d38200252de49997a49d84045c726fa8d0f4dd637fce0b8affaa5c8620" "c614d2423075491e6b7f38a4b7ea1c68f31764b9b815e35c9741e9490119efc0" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" default))
 '(evil-undo-system 'undo-tree)
 '(ls-lisp-verbosity nil)
 '(orb-insert-frontend 'helm-bibtex)
 '(org-agenda-window-setup 'current-window)
 '(org-file-apps
   '((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "evince %s")))
 '(org-format-latex-options
   '(:foreground default :background default :scale 1.6 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-publish-project-alist '((publishing-directory . "~/org-roam/exports/")))
 '(org-roam-server-mode t)
 '(package-selected-packages
   '(neotree apropospriate-theme origami evil-vimish-fold poet-theme soothe-theme olivetti org-bullets org-noter org-download eyebrowse centaur-tabs cl-libify yasnippet-classic-snippets minimap vterm ample-theme eradio swiper-helm helm-bibtexkey undo-tree dashboard org-roam-server ivy-bibtex org-roam-bibtex org-ref evil-magit base16-theme treemacs projectile evil-org helm evil))
 '(projectile-mode t nil (projectile))
 '(tramp-password-prompt-regexp
   "^.*\\(\\(?:adgangskode\\|contrase\\(?:\\(?:ny\\|\303\261\\)a\\)\\|geslo\\|h\\(?:\\(?:as\305\202\\|esl\\)o\\)\\|iphasiwedi\\|Token\\|jelsz\303\263\\|l\\(?:ozinka\\|\303\266senord\\)\\|m\\(?:ot de passe\\|\341\272\255t kh\341\272\251u\\)\\|p\\(?:a\\(?:rola\\|s\\(?:ahitza\\|s\\(?: phrase\\|code\\|ord\\|phrase\\|wor[dt]\\)\\|vorto\\)\\)\\|in\\)\\|s\\(?:alasana\\|enha\\|lapta\305\276odis\\)\\|wachtwoord\\|\320\273\320\276\320\267\320\270\320\275\320\272\320\260\\|\320\277\320\260\321\200\320\276\320\273\321\214\\|\327\241\327\241\327\236\327\224\\|\331\203\331\204\331\205\330\251 \330\247\331\204\330\263\330\261\\|\340\244\227\340\245\201\340\244\252\340\245\215\340\244\244\340\244\266\340\244\254\340\245\215\340\244\246\\|\340\244\266\340\244\254\340\245\215\340\244\246\340\244\225\340\245\202\340\244\237\\|\340\246\227\340\247\201\340\246\252\340\247\215\340\246\244\340\246\266\340\246\254\340\247\215\340\246\246\\|\340\246\252\340\246\276\340\246\270\340\246\223\340\247\237\340\246\276\340\246\260\340\247\215\340\246\241\\|\340\250\252\340\250\276\340\250\270\340\250\265\340\250\260\340\250\241\\|\340\252\252\340\252\276\340\252\270\340\252\265\340\252\260\340\253\215\340\252\241\\|\340\254\252\340\255\215\340\254\260\340\254\254\340\255\207\340\254\266 \340\254\270\340\254\231\340\255\215\340\254\225\340\255\207\340\254\244\\|\340\256\225\340\256\237\340\256\265\340\257\201\340\256\232\340\257\215\340\256\232\340\257\212\340\256\262\340\257\215\\|\340\260\270\340\260\202\340\260\225\340\261\207\340\260\244\340\260\252\340\260\246\340\260\256\340\261\201\\|\340\262\227\340\263\201\340\262\252\340\263\215\340\262\244\340\262\252\340\262\246\\|\340\264\205\340\264\237\340\264\257\340\264\276\340\264\263\340\264\265\340\264\276\340\264\225\340\265\215\340\264\225\340\265\215\\|\340\266\273\340\267\204\340\267\203\340\267\212\340\266\264\340\266\257\340\266\272\\|\341\236\226\341\236\266\341\236\200\341\237\222\341\236\231\341\236\237\341\236\230\341\237\222\341\236\204\341\236\266\341\236\217\341\237\213\\|\343\203\221\343\202\271\343\203\257\343\203\274\343\203\211\\|\345\257\206[\347\240\201\347\242\274]\\|\354\225\224\355\230\270\\)\\).*: ? *"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-scheduled ((t (:foreground "dark orange"))))
 '(variable-pitch ((t (:family "Source Serif Pro")))))
