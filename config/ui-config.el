(when window-system
  (require 'desktop)
  (desktop-save-mode 1)
  (defun my-desktop-save ()
    (interactive)
    ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
    (if (eq (desktop-owner) (emacs-pid))
        (desktop-save desktop-dirname)))
  (add-hook 'auto-save-hook 'my-desktop-save))

(diminish 'auto-fill-function "")
(after 'abbrev (diminish 'abbrev-mode " ⠤"))
(after 'hideshow (diminish 'hs-minor-mode ""))
(after 'yasnippet (diminish 'yas-minor-mode " ʏ"))

(use-package string-utils :ensure t)
(use-package dash :ensure t)

;; (use-package powerline :ensure t
;;   :init (setq powerline-default-separator 'wave)
;;   :config (progn
;;             (require 'powerline)
;;             (add-hook 'desktop-after-read-hook 'powerline-reset)
;;             (defface modes-ml-face '((t (:background "#002b36" :inherit mode-line)))
;;               "Powerline face for modes section of the mode-line"
;;               :group 'powerline)
;;             (defface file-ml-face '((t (:background "#586e75" :inherit mode-line)))
;;               "Powerline face for file and branch section of the mode-line"
;;               :group 'powerline)
;;             (defface line-ml-face '((t (:background "#93a1a1" :inherit mode-line)))
;;               "Powerline face for line number section of the mode-line"
;;               :group 'powerline)
;;             (defface pos-ml-face '((t (:background "#586e75" :inherit mode-line)))
;;               "Powerline face for file position section of the mode-line"
;;               :group 'powerline)
;;             (defface ml-fill-face '((t (:background "#93a1a1" :inherit mode-line)))
;;               "Powerline face used to fill the unused portion of the mode-line"
;;               :group 'powerline)
;;             (setq-default mode-line-format
;;                           '("%e"
;;                             (:eval
;;                              (let* ((file-name (buffer-file-name (current-buffer)))
;;                                     (active (powerline-selected-window-active))
;;                                     (separator-left (intern (format "powerline-%s-%s"
;;                                                                     (powerline-current-separator)
;;                                                                     (car powerline-default-separator-dir))))
;;                                     (separator-right (intern (format "powerline-%s-%s"
;;                                                                      (powerline-current-separator)
;;                                                                      (cdr powerline-default-separator-dir))))
;;                                     (lhs (list (powerline-major-mode 'modes-ml-face 'l)
;;                                                (powerline-process 'modes-ml-face 'l)
;;                                                (powerline-minor-modes 'modes-ml-face 'l)
;;                                                (powerline-raw " " 'modes-ml-face)
;;                                                (funcall separator-left 'modes-ml-face 'file-ml-face)

;;                                                (powerline-raw "[" 'file-ml-face)
;;                                                (powerline-raw (projectile-project-name) 'file-ml-face)
;;                                                (powerline-raw "] %b %*" 'file-ml-face)
;;                                                (powerline-raw (concat " "
;;                                                                       (when (and file-name vc-mode)
;;                                                                         (concat "(" (-> file-name
;;                                                                                         vc-working-revision
;;                                                                                         (string-utils-truncate-to 40))
;;                                                                                 ")")))
;;                                                               'file-ml-face 'r)
;;                                                (funcall separator-left 'file-ml-face 'ml-fill-face)))

;;                                     (rhs (list (powerline-raw global-mode-string 'ml-fill-face 'r)
;;                                                (funcall separator-right 'ml-fill-face 'pos-ml-face)
;;                                                (powerline-raw "%p " 'pos-ml-face 'l)
;;                                                (funcall separator-right 'pos-ml-face 'line-ml-face)

;;                                                (powerline-raw " %4l " 'line-ml-face 'r))))

;;                                (concat (powerline-render lhs)
;;                                        (powerline-fill 'ml-fill-face (powerline-width rhs))
;;                                        (powerline-render rhs))))))))

