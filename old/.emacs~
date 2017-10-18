;; Don't break hardlink when editing files
(setq backup-by-copying-when-linked t)

;;Hide the toolbar
(tool-bar-mode -1)

;; =============== add load path ====================>
(add-to-list 'load-path "~/.emacs.d/")

;(add-to-list 'load-path "~/.emacs.d/color-theme/")
;custom-theme-load-path(add-to-list 'load-path "~/.emacs.d/color-theme/themes/")

;;Customize-theme
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;;Use solarized theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized-light t)

(add-to-list 'default-frame-alist '(font . "Monaco-14"))

;;For markdown mode
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Mardown file" t)

(setq auto-mode-alist
      (cons '("\\.text" . markdown-mode) auto-mode-alist))


;yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/global-mode 1)

(put 'narrow-to-region 'disabled nil)

;;R
(add-to-list 'load-path "~/.emacs.d/ess/lisp")
(require 'ess-site)

; automatically get the correct mode 
auto-mode-alist (append (list '("\\.R$" . R-mode)
			      '("\\.r$" . R-mode)
	                )
		      auto-mode-alist)

;;For perl (PDE)
(add-to-list 'load-path "~/.emacs.d/pde/lisp")
(load "pde-load")


;;Turn off the annoying beep in emacs
(setq visible-bell t)

;; Set the font
;; Font is set earlier in this file
; (set-default-font "Menlo Regular-14")  
; (set-default-font "Monaco Regular-14")

;;Comment or uncomment currrent line no matter it is highlighted or not
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))
;;Key binding
(global-set-key "\M-;" 'comment-or-uncomment-region-or-line)


;;line number
;(global-linum-mode t)

;auto-completion.el
;(require 'auto-complete)
;(global-auto-complete-mode t)


;TODO
;(setq todo-file-do "~/todo/do") 
;(setq todo-file-done "~/todo/done") 
;(setq todo-file-top "~/todo/top") 

;color-theme
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-classic)
;(load-file "~/.emacs.d/themes/color-theme-cobalt.el")
;(color-theme-bharadwaj-slate)

;;Change comint keys
;(require 'comint)
;(define-key comint-mode-map (kbd "M-") 'comint-next-input)
;(define-key comint-mode-map (kbd "M-") 'comint-previous-input)
;(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
;(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)

;pylookup
;(autoload 'pylookup-lookup "pylookup")
;(autoload 'pylookup-update "pylookup")
;(setq pylookup-program "~/.emacs.d/pylookup/pylookup.py")
;(setq pylookup-db-file "~/.emacs.d/pylookup/pylookup.db")
;(global-set-key "\C-ch" 'pylookup-lookup)

;; ;;autopair
;; (autoload 'autopair-global-mode "autopair" nil t)
;; (autopair-global-mode)
;; (add-hook 'lisp-mode-hook
;;           #'(lambda () (setq autopair-dont-activate t)))
;; ;I also have the following to in my .emacs to make autopair work with python single and triple quotes:
;; (add-hook 'python-mode-hook
;;           #'(lambda ()
;;               (push '(?' . ?')
;;                     (getf autopair-extra-pairs :code))
;;               (setq autopair-handle-action-fns
;;                     (list #'autopair-default-handle-action
;;                           #'autopair-python-triple-quote-action))))

;;pep8 and pylint
;(require 'python-pep8)

;; path to the python interpreter, e.g.: ~rw/python27/bin/python2.7
;(setq py-python-command "python")
;(autoload 'python-mode "python-mode" "Python editing mode." t)





;; Pretty colors
;(set-background-color "black")
;(set-foreground-color "green")
;(set-cursor-color "green")

;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(tool-bar-mode nil))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#042028")
 '(background-mode dark)
 '(cursor-color "#708183")
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(foreground-color "#708183"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
