(message "init.el loaded successfully !")


(use-package treemacs
  :ensure t
  :defer t
  :bind
  ("M-0" . treemacs-select-window)
  ("C-x t 1" . treemacs-delete-other-windows)
  ("C-x t t" . treemacs))

;; Set up compilation command for C++
(setq compile-command "g++ -Wall -std=c++11 main.cpp -o main && ./main.exe")(defun compile-cpp ()
  "Compile the current C++ file."
  (interactive)
  (setq compile-command (format "g++ -Wall -std=c++11 %s -o %s && %s"
                                (buffer-file-name)
                                (file-name-sans-extension (buffer-file-name))
                                (file-name-sans-extension (buffer-file-name))))
  (call-interactively 'compile))


;; Configure basic C++ style and indentation
(add-hook 'c++-mode-hook
          (lambda ()
            (setq c-basic-offset 4)       ;; 4 spaces for indentation
            (setq tab-width 4)
            (c-set-style "linux")         ;; Or use "bsd" or "stroustrup" for other styles
            (setq indent-tabs-mode nil))) ;; Use spaces instead of tabs

;; Enable Company mode for auto-completion
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0)) ;; Quick popup suggestions

;; Set up Flycheck for syntax checking
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Enable Flycheck and Company in C++ mode
(add-hook 'c++-mode-hook
          (lambda ()
            (flycheck-mode)
            (company-mode)))

( require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi-deuteranopia))
 '(custom-safe-themes
   '("7b602fe4a324dc18877dde647eb6f2ff9352566ce16d0b888bfcb870d0abfd70" "937401a2e532f2c8c881b6b3f20d9d4b6b9405bccf72ea6289c9d3f4507eb1ab" "a75aff58f0d5bbf230e5d1a02169ac2fbf45c930f816f3a21563304d5140d245" "2e7dc2838b7941ab9cabaa3b6793286e5134f583c04bde2fba2f4e20f2617cf7" "d41229b2ff1e9929d0ea3b4fde9ed4c1e0775993df9d998a3cdf37f2358d386b" "faf642d1511fb0cb9b8634b2070a097656bdb5d88522657370eeeb11baea4a1c" "fbf73690320aa26f8daffdd1210ef234ed1b0c59f3d001f342b9c0bbf49f531c" default))
 '(package-selected-packages '(flycheck treemacs modus-themes ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
