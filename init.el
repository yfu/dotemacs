(set-frame-font "menlo 14" nil t)

;; Saving Emacs Sessions, just like TextMate
(desktop-save-mode 1)

(put 'downcase-region 'disabled nil)

;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
