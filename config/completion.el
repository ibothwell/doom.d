(use-package company :ensure t
  :init (setq company-idle-delay 0.3
              company-tooltip-limit 10
              company-minimum-prefix-length 2
              company-tooltip-flip-when-above t)
  :config (global-company-mode 1)
  :diminish " α")