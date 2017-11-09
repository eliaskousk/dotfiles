;;
;; Disable splash / startup screen / message
;;
(setq inhibit-splash-screen t)
;; OR
;; (setq inhibit-startup-message t)
;;

;;
;; Use Linux kernel identation for C
;;
(setq c-default-style "linux")

;;
;; Show file full path in title bar
;;
(setq-default frame-title-format
   (list '((buffer-file-name " %f"
             (dired-directory
              dired-directory
              (revert-buffer-function " %b"
              ("%b - Dir:  " default-directory)))))))

;;
;; Shows parenthesis 
;;
(show-paren-mode 1)

;;
;; Shows column number
;;
(column-number-mode t)

;;
;; No toolbar
;;
;(progn
;  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;  (menu-bar-mode -1)
;  (scroll-bar-mode -1)
;)
(tool-bar-mode -1)

;;
;; Enable line numbers
;;
(global-linum-mode t)
;;

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time<Plug>(neosnippet_expand

;;
;; Set script directory
;;
(defun prepend-path ( my-path )
(setq load-path (cons (expand-file-name my-path) load-path)))
(defun append-path ( my-path )
(setq load-path (append load-path (list (expand-file-name my-path)))))
;; Look first in the directory ~/.emacs.d/elisp for elisp files
(prepend-path "~/.emacs.d/elisp")
;;

;;
;; MELPA
;;
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;
;; Backup Files
;;
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

;;
;; Enable Verilog-Mode
;;
;; Load verilog mode only when needed
;(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
;; Any files that end in .v, .dv or .sv should be in verilog mode
;(add-to-list 'auto-mode-alist '("\\.[ds]?v\\'" . verilog-mode))
;; Any files in verilog mode should have their keywords colorized
;(add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1)))
;;

;;
;; VHDL Mode
;;

;(autoload 'vhdl-mode "vhdl-mode" "VHDL Mode" t)
;(setq auto-mode-alist (cons '("\\.vhdl?$" . vhdl-mode) auto-mode-alist))

;;
;; Xilinx UCF Mode
;; https://github.com/ewa/emacs-ucf-mode
;;
(autoload 'ucf-mode "ucf-mode" "Xilinx UCF mode" t)
(add-to-list 'auto-mode-alist '("\\.ucf\\'" . ucf-mode))

;;
;; Vivado Mode (XDC)
;; https://sites.google.com/site/jimw567/
;;
(setq auto-mode-alist (cons  '("\\.xdc\\'" . vivado-mode) auto-mode-alist))
(add-hook 'vivado-mode-hook '(lambda () (font-lock-mode 1)))
(autoload 'vivado-mode "vivado-mode")

;;
;; Load color-theme-solarized package's dark theme
;; Not used - replaced with solarized-theme package
;;
;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(frame-background-mode (quote dark)))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; )

;;
;; Solarized Theme (MELPA - solarized-theme package)
;;
(load-theme 'solarized-dark t)

;;
;; Color Identifiers Mode (MELPA - color-identifiers-mode package)
;;
;; Make it global for all supported file types
;; May slow down the editor, possibly disable when not really neeeded
;;
(add-hook 'after-init-hook 'global-color-identifiers-mode)

;;
;; Magit (MELPA - magit package)
;;
(global-set-key (kbd "C-x g") 'magit-status)

;;
;; CUA Mode
;;
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;;
;; XCscope (MELPA - xcscope package)
;;
(cscope-setup)

;; GGTags Mode (MELPA - ggtags package)
;;
;; Only for C
;;(add-hook 'c-mode-hook 'ggtags-mode)
;;
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

