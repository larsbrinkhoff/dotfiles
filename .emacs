(require 'cl)

(dolist (x '(narrow-to-region eval-expression upcase-region downcase-region
	     scroll-left))
  (put x 'disabled nil))

(dolist (x '(menu-bar-mode tool-bar-mode scroll-bar-mode global-font-lock-mode))
  (when (fboundp x)
    (funcall x -1)))

(setq backup-by-copying-when-linked t
      backup-by-copying-when-mismatch t
      calendar-latitude 57.7069		;57°42'24"
      calendar-location-name "Gothenburg"
      calendar-longitude 11.9629	;11°57'46"
      calendar-week-start-day 1
      delete-old-versions t
      display-time-24hr-format t
      display-time-interval 10
      kept-new-versions 9
      kept-old-versions 5
      lisp-indent-function #'common-lisp-indent-function
      next-line-add-newlines nil
      scroll-conservatively 3
      scroll-step 1
      user-mail-address "lars@nocrew.org"
      version-control t
      line-move-visual nil)

(setq-default indent-tabs-mode nil)

(add-hook 'shell-mode
	  (lambda ()
	    (local-set-key (kbd "C-z") 'comint-stop-subjob)))

;; For ITS assembly language files.
(fset 'midas-mode 'asm-mode)

;;;(byte-compile-disable-warning 'cl-functions)

(display-time)
(winner-mode 1)
(require 'jka-compr)

(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(custom-set-variables
 '(font-lock-global-modes nil)
 '(global-font-lock-mode nil nil (font-lock)))

(when (file-accessible-directory-p "~/quicklisp")
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "sbcl"))

(when (ignore-errors (require 'package))
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (package-initialize))
(put 'narrow-to-page 'disabled nil)

(defun who-cares-if-its-tabs-or-spaces ()
  "Indent using TABs or spaces depending on the file contents."
  (save-excursion
    (beginning-of-buffer)
    (setq indent-tabs-mode (search-forward "\t" nil t))))

(add-hook 'c-mode-hook 'who-cares-if-its-tabs-or-spaces)
(add-hook 'c++-mode-hook 'who-cares-if-its-tabs-or-spaces)
