;;; Code:


(use-package aweshell
  :commands
  (aweshell-new)
  :init
  (add-hook 'eshell-exit-hook #'(lambda ()
                                  (if (> (count-windows) 1)
                                      (delete-window))))
  :load-path "site-lisp/shell")


(defun kumo-eshell()
  (interactive)
  (let ((w (split-window-below)))
    (select-window w)
    (aweshell-new)))


(provide 'init-eshell)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init-eshell.el ends here
