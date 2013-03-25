;; Don't break hardlink when editing files
(setq backup-by-copying-when-linked t)

;;Hide the toolbar
(if window-system
    (tool-bar-mode -1)
  (menu-bar-mode -1)
)

;;Key binding
(setq mac-command-modifier 'super) ; Sets the Option key as Meta
(setq mac-option-modifier 'meta) ; Set the Command key as Super
;; (global-set-key "\M-;" 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "s-;") 'comment-or-uncomment-region-or-line)
;;Auto completion using hippe-expand
(global-set-key "\M-TAB" 'hippie-expand)

;; TODO
;;Bind the compile-dwim-run to s-r

;; Set the PATH variable for emacs because emacs inherits this value
;; from its parent process, maybe "launchd" process.
(setenv "PATH" "/Users/yfu/perl5/perlbrew/bin:/Users/yfu/perl5/perlbrew/perls/perl-5.16.2/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:/Users/yfu/Dropbox/Courses/Rotation/bin:/Users/yfu/.rvm/bin")
;; Emacs uses its own exec-path for binaries instead of the above path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("/usr/texbin")))
(add-to-list 'exec-path "/usr/local/mysql/bin")


;; =============== add load path ====================>
(add-to-list 'load-path "~/.emacs.d/")

;;Use solarized theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(if window-system
    (load-theme 'solarized-light t)
  ;;(load-theme 'solarized-dark nil) ;; Do NOT load any theme in terminal
)

(setq default-frame-alist
      '((top . 200) (left . 400)
        (width . 80) (height . 40)
        (font . "Monaco-14")))

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
;(add-to-list 'load-path "~/.emacs.d/pde/lisp")
;(load "pde-load")
;; Add key bindings for PDE
;; I prefer to use command + R as the shortcut for running this script
;(eval-after-load 'pde
;  '(define-key pde-cperl-map (kbd "s-r") 'compile-dwim-run))

;;For cperl mode
;;; cperl-mode is preferred to perl-mode                                        
(defalias 'perl-mode 'cperl-mode)

;; Mode compile (this can provide a smart command for compiling files
;; according to major mode
;;mode-compile
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cr" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)


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


;; scroll one line at a time (less "jumpy" than defaults)
;; (require 'smooth-scroll)
;; (smooth-scroll-mode t)

;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time    
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a time

;; IDO mode
(require 'ido)
(ido-mode t)

(when (> emacs-major-version 23)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives 
	       '("melpa" . "http://melpa.milkbox.net/packages/")
	       'APPEND))

;; Auto Complete mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")

;; For flyspell mode
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

;; Org-mode
(setq load-path (cons "~/.emacs.d/org/lisp" load-path))
(setq load-path (cons "~/.emacs.d/org/contrib/lisp" load-path))
;; Set the location of you Org files on your local system
(setq org-directory "~/Dropbox/org/")
;; Set the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/GTD.org")
;; Set to <your Dropbox root directory>/MobileOrg
(setq org-mobile-directory "~/Dropbox/mobileOrg/")
;; Set up capture
(setq org-default-notes-file (concat org-directory "GTD.org"))
(define-key global-map "\C-cc" 'org-capture)
;; I do not need the single-letter shortcut right now
;; They actually make flagging slower for me.
;; Use the single-letter shortcut when I use more states for TODO item
;; (setq org-todo-keywords
;;            '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))
(setq org-todo-keywords
           '((sequence "TODO(t)" "WAITING(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
;; Autowrap
(add-hook 'org-mode-hook
	  (lambda ()
	    (toggle-truncate-lines)))



;;line-num
(require 'line-num)

;; Remember recent files opened, across sessions
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 50)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; sql-mysql
(setq sql-mysql-program "/usr/local/mysql/bin/mysql")
(setq sql-user "yfu")
(setq sql-server "bioed.bu.edu")


;; Check for shebang magic in file after save, make executable if found.
;; (setq my-shebang-patterns 
;;       (list "^#!/usr/.*/perl\\(\\( \\)\\|\\( .+ \\)\\)-w *.*" 
;; 	    "^#!/usr/.*/sh"
;; 	    "^#!/usr/.*/bash"
;; 	    "^#!/bin/sh"
;; 	    "^#!/bin/bash"
;; 	    "^#!/usr/.*/python"))
;; (add-hook 
;;  'after-save-hook 
;;  (lambda ()
;;    (if (not (= (shell-command (concat "test -x " (buffer-file-name))) 0))
;;        (progn 
;; 	 ;; This puts message in *Message* twice, but minibuffer
;; 	 ;; output looks better.
;; 	 (message (concat "Wrote " (buffer-file-name)))
;; 	 (save-excursion
;; 	   (goto-char (point-min))
;; 	   ;; Always checks every pattern even after
;; 	   ;; match.  Inefficient but easy.
;; 	   (dolist (my-shebang-pat my-shebang-patterns)
;; 	     (if (looking-at my-shebang-pat)
;; 		 (if (= (shell-command  
;; 			 (concat "chmod u+x " (buffer-file-name)))
;; 			0)
;; 		     (message (concat 
;; 			       "Wrote and made executable " 
;; 			       (buffer-file-name))))))))
;;      ;; This puts message in *Message* twice, but minibuffer output
;;      ;; looks better.
;;      (message (concat "Wrote " (buffer-file-name))))))

;; Mark the script as executable after save. It should also work in TRAMP mode
(defun make-script-executable ()
  "If file starts with a shebang, make `buffer-file-name' executable"
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-min))
      (when (and (looking-at "^#!")
		 (not (file-executable-p buffer-file-name)))
	(set-file-modes buffer-file-name
			(logior (file-modes buffer-file-name) #o100))
	(message (concat "Made " buffer-file-name " executable"))))))

(add-hook 'after-save-hook 'make-script-executable)


;; (when window-system          ; start speedbar if we're using a window system
    ;; (speedbar t))

;; Desktop-save-mode: like the "Recover" introduced in Lion
;;(desktop-save-mode t);

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#042028")
 '(background-mode dark)
 '(cursor-color "#708183")
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(foreground-color "#708183")
 '(fringe-mode nil nil (fringe))
 '(global-ede-mode nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; AUCTeX
;;(load "auctex.el" nil t t) ;No need as the package-install cares about this
;;(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(add-hook 'LaTeX-mode-hook 
          (lambda () 
            (turn-on-reftex) 
            (setq reftex-plug-into-AUCTeX t))) 
(setq TeX-PDF-mode t) 
(setq TeX-view-program-selection 
      '(((output-dvi style-pstricks) 
         "dvips and PDF Viewer") 
        (output-dvi "PDF Viewer") 
        (output-pdf "PDF Viewer") 
        (output-html "Safari"))) 
(setq TeX-view-program-list 
      '(("dvips and PDF Viewer" "%(o?)dvips %d -o && open %f") 
        ("PDF Viewer" "open %o") 
        ("Safari" "open %o"))) 

(setq gnus-select-method '(nnimap "gmail"
				  (nnimap-address "imap.gmail.com")
				  (nnimap-server-port 993)
				  (nnimap-stream ssl)))
 ;; Make Gnus NOT ignore [Gmail] mailboxes
    (setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; Set the default method to connect to remote host.
;; In case ssh does not work, try other methods like:
;; C-x C-f /scpc:yfu@remote.host:file/location
(setq tramp-default-method "ssh")

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(scroll-bar-mode -1)
; (require 'autopair)
; (autopair-global-mode)


