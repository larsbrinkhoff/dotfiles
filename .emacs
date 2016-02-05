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
      version-control t)

;;;(byte-compile-disable-warning 'cl-functions)

(display-time)
(winner-mode 1)
(require 'jka-compr)

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(font-lock-global-modes nil)
 '(global-font-lock-mode nil nil (font-lock)))
