;; (add-hook 'org-mode-hook 'variable-pitch-mode)
;; (add-hook 'org-agenda-finalize-hook 'variable-pitch-mode)
 (add-hook 'text-mode-hook 'olivetti-mode)
 (add-hook 'org-mode-hook 'olivetti-mode)
 (add-hook 'org-agenda-finalize-hook 'olivetti-mode)
     (defun org-line-wrap ()
     (spacemacs/toggle-visual-line-navigation-on)
     (setq-local word-wrap nil))

 (add-hook 'org-mode-hook 'org-line-wrap)
 (setq olivetti-body-width 80)