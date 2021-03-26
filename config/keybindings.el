(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(defun kill-buffer-and-frame ()
  (interactive)
  (kill-buffer)
  (delete-frame))
(global-set-key (kbd "C-x C-c") 'kill-buffer-and-frame)

;; Text size
(global-unset-key (kbd "C-x C-+")) ; don't zoom like this
(bind-key "C-s-+" 'text-scale-increase)
(bind-key "C-s--" 'text-scale-decrease)

(use-package beginend :ensure t
  :config (beginend-setup-all))

;; Search
;; Symbol lookup
(bind-key "C-c TAB" 'counsel-imenu)
;; swap search key assignment
(bind-key "C-S" 'isearch-forward)
(bind-key "C-s" 'counsel-grep-or-swiper)


;;navigation
(bind-key "M-a" 'beginning-of-defun)
(bind-key "M-e" 'end-of-defun)
