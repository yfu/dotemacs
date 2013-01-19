;; Don't break hardlink when editing files
(setq backup-by-copying-when-linked t)

;;Hide the toolbar
(tool-bar-mode -1)

;;Key binding
(setq mac-command-modifier 'super) ; sets the Command key as Super
;; (global-set-key "\M-;" 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "s-;") 'comment-or-uncomment-region-or-line)
;;Auto completion using hippe-expand
(global-set-key "\M- " 'hippie-expand)
;; TODO
;;Bind the compile-dwim-run to s-r

;; Set the PATH variable for emacs because emacs inherits this value
;; from its parent process, maybe "launchd" process.
(setenv "PATH" "/Users/yfu/perl5/perlbrew/bin:/Users/yfu/perl5/perlbrew/perls/perl-5.16.2/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:/Users/yfu/Dropbox/Courses/Rotation/bin:/Users/yfu/.rvm/bin")

;; =============== add load path ====================>
(add-to-list 'load-path "~/.emacs.d/")

;;Use solarized theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(if window-system
    (load-theme 'solarized-light t)
  (load-theme 'solarized-dark nil) ;; Do NOT load any theme in terminal
)

(setq default-frame-alist
      '((top . 200) (left . 400)
        (width . 80) (height . 40)
        (font . "Monaco-15")))
;(add-to-list 'default-frame-alist '(font . "Monaco-14"))
;(add-to-list 'default-frame-alist '(top . 200) (left . 400)
;                                    (width . 80) (height . 40))

;;For markdown mode
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Mardown file" t)

(setq auto-mode-alist
      (cons '("\\.text" . markdown-mode) auto-mode-alist))

;yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)

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
;; Add key bindings for PDE
;; I prefer to use command + R as the shortcut for running this script
(eval-after-load 'pde
  '(define-key pde-cperl-map (kbd "s-r") 'compile-dwim-run))

;;Turn off the annoying beep in emacs
(setq visible-bell t)

;;Comment or uncomment currrent line no matter it is highlighted or not
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))


;;line number
;(global-linum-mode t)

;auto-completion.el
;(require 'auto-complete)
;(global-auto-complete-mode t)


;TODO
;(setq todo-file-do "~/todo/do") 
;(setq todo-file-done "~/todo/done") 
;(setq todo-file-top "~/todo/top") 

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
