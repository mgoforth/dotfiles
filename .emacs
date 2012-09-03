(setq inhibit-splash-screen t)
(setq mac-option-key-is-meta nil)
(setq mac-option-modifier 'control)
(setq mac-command-modifier 'meta)

;; (ido-mode t) ;; this started pissing me off when using Tramp

;; Rinari mode: http://rinari.rubyforge.org/
(add-to-list 'load-path "~/src/rinari")
(require 'rinari)

;; ri mode
(add-to-list 'load-path "~/.emacs_modes/yari")
(require 'yari)

;; yaml mode
(add-to-list 'load-path "~/.emacs_modes/yaml")
(require 'yaml-mode)
(add-hook 'yaml-mode-hook
	  (lambda () (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; erb mode
(add-to-list 'load-path "~/.emacs_modes/rhtml/") 
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
	  (lambda () (rinari-launch)))

;; ruby electric, auto completion
(add-to-list 'load-path "~/.emacs_modes/ruby")
(require 'ruby-electric)
(add-hook 'ruby-mode-hook
	  (lambda () (ruby-electric-mode t)))

(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))


;; Key Bindings
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "M-r") 'replace-string)
(global-set-key (kbd "M-h") 'yari)
(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M-_") 'text-scale-decrease)

;; nxhtml mode
;; (add-to-list 'load-path "~/.emacs_modes/nxhtml")
;; (setq 
;;  nxhtml-global-minor-mode t
;;  mumamo-chunk-coloring 'submode-colored
;;  nxhtml-skip-welcome t
;;  indent-region-mode t
;;  rng-nxml-auto-validate-flag nil
;;  nxml-degraded t)
;; (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" .eruby-nxhtml-mumamo))
      
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "apple" :family "Inconsolata")))))

;; create a backup file directory
(defun make-backup-file-name (file)
  (concat "~/.emacs_backups/" (file-name-nondirectory file) "~"))
