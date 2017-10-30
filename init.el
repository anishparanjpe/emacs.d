;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(package-install 'auctex)

(package-install 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(package-install 'flycheck)
(global-flycheck-mode)

(package-install 'haskell-mode)

(require 'haskell-interactive-mode)
(require 'haskell-process)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(setq haskell-process-auto-import-loaded-modules t)
(setq haskell-process-log t)
(setq haskell-process-suggest-remove-import-lines t)
(setq haskell-process-type 'stack-ghci)

(package-install 'idris-mode)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(setq make-backup-files nil)

(setq inhibit-startup-screen t)

(setq indent-tabs-mode nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)

(column-number-mode t)

(setq fill-column 80)

(global-whitespace-mode t)

(set-frame-font "Monaco-14")
(load-theme 'leuven)

(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

(provide 'init)
;;; init.el ends here
