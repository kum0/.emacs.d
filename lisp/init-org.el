;;; Code:


(use-package org
  :ensure nil
  :custom-face (org-ellipsis ((t (:foreground nil))))
  :preface
  (defun hot-expand (str &optional mod)
    "Expand org template.

STR is a structure template string recognised by org like <s. MOD is a
string with additional parameters to add the begin line of the
structure element. HEADER string includes more parameters that are
prepended to the element after the #+HEADER: tag."
    (let (text)
      (when (region-active-p)
        (setq text (buffer-substring (region-beginning) (region-end)))
        (delete-region (region-beginning) (region-end)))
      (insert str)
      (if (fboundp 'org-try-structure-completion)
          (org-try-structure-completion) ; < org 9
        (progn
          ;; New template expansion since org 9
          (require 'org-tempo nil t)
          (org-tempo-complete-tag)))
      (when mod (insert mod) (forward-line))
      (when text (insert text))))
  :bind
  (
   ;; ("C-c a" . org-agenda)
   ;; ("C-c b" . org-switchb)
   :map org-mode-map
   ("<" . (lambda ()
            "Insert org template."
            (interactive)
            (if (or (region-active-p) (looking-back "^\s*" 1))
                (org-hydra/body)
              (self-insert-command 1)))))
  :hook
  ((org-mode . (lambda ()
                 "Beautify org symbols."
                 (push '("[ ]" . ?☐) prettify-symbols-alist)
                 (push '("[X]" . ?☑) prettify-symbols-alist)
                 (push '("[-]" . ?⛝) prettify-symbols-alist)
                 
                 (push '("#+ARCHIVE:" . ?📦) prettify-symbols-alist)
                 (push '("#+AUTHOR:" . ?👤) prettify-symbols-alist)
                 (push '("#+CREATOR:" . ?💁) prettify-symbols-alist)
                 (push '("#+DATE:" . ?📆) prettify-symbols-alist)
                 (push '("#+DESCRIPTION:" . ?⸙) prettify-symbols-alist)
                 (push '("#+EMAIL:" . ?🖂) prettify-symbols-alist)
                 (push '("#+OPTIONS:" . ?⛭) prettify-symbols-alist)
                 (push '("#+SETUPFILE:" . ?⛮) prettify-symbols-alist)
                 (push '("#+TAGS:" . ?🏷) prettify-symbols-alist)
                 (push '("#+TITLE:" . ?🕮) prettify-symbols-alist)
                 
                 (push '("#+BEGIN_SRC" . ?✎) prettify-symbols-alist)
                 (push '("#+END_SRC" . ?□) prettify-symbols-alist)
                 (push '("#+BEGIN_QUOTE" . ?») prettify-symbols-alist)
                 (push '("#+END_QUOTE" . ?«) prettify-symbols-alist)
                 (push '("#+HEADERS" . ?☰) prettify-symbols-alist)
                 (push '("#+RESULTS:" . ?💻) prettify-symbols-alist)
                 
                 (prettify-symbols-mode 1)))
   (org-indent-mode . (lambda()
                        (diminish 'org-indent-mode)
                        (make-variable-buffer-local 'show-paren-mode)
                        (setq show-paren-mode nil))))
  :custom
  (org-agenda-files '("~/org"))
  (org-todo-keywords '((sequence "TODO(t)" "DOING(i)" "HANGUP(h)" "|" "DONE(d)" "CANCEL(c)")
                       (sequence "⚑(T)" "🏴(I)" "❓(H)" "|" "✔(D)" "✘(C)")))
  (org-todo-keyword-faces '(("HANGUP" . warning)
                            ("❓" . warning)))
  (org-priority-faces '((?A . error)
                        (?B . warning)
                        (?C . success)))
  (org-tags-column -80)
  (org-log-done 'time)
  (org-catch-invisible-edits 'smart)
  (org-startup-indented t)
  (org-ellipsis (if (char-displayable-p ?) "  " nil))
  (org-pretty-entities nil)
  (org-hide-emphasis-markers t)
  :config
  ;; Add new template
  (add-to-list 'org-structure-template-alist '("n" . "note"))

  ;; Add gfm/md backends
  (use-package ox-gfm)
  (add-to-list 'org-export-backends 'md)

  (with-eval-after-load 'counsel
    (bind-key [remap org-set-tags-command] #'counsel-org-tag org-mode-map))

  ;; Prettify UI
  (use-package org-bullets
    :hook (org-mode . org-bullets-mode)
    :custom
    (org-bullets-bullet-list '("⚫" "⚫" "⚫" "⚫")))

  (use-package org-fancy-priorities
    :diminish
    :hook
    (org-mode . org-fancy-priorities-mode)
    :custom
    (org-fancy-priorities-list
     (if (char-displayable-p ?⯀)
         '("⯀" "⯀" "⯀" "⯀")
       '("HIGH" "MEDIUM" "LOW" "OPTIONAL"))))

  ;; Babel
  (setq org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t)

  (defvar load-language-list '((emacs-lisp . t)
                               (perl . t)
                               (python . t)
                               (ruby . t)
                               (js . t)
                               (css . t)
                               (sass . t)
                               (C . t)
                               (java . t)
                               (plantuml . t)))

  ;; ob-sh renamed to ob-shell since 26.1.
  (cl-pushnew '(shell . t) load-language-list)
  
  (use-package ob-go
    :init (cl-pushnew '(go . t) load-language-list))

  (org-babel-do-load-languages 'org-babel-load-languages
                               load-language-list)

  ;; Table of contents
  (use-package toc-org
    :hook (org-mode . toc-org-mode))

  ;; Preview
  (use-package org-preview-html
    :diminish)
)


(provide 'init-org)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here