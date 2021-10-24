;;; nano-agenda.el --- N Λ N O agenda -*- lexical-binding: t -*-

;; Copyright (C) 2021 Free Software Foundation, Inc.

;; Maintainer: Nicolas P. Rougier <Nicolas.Rougier@inria.fr>
;; URL: https://github.com/rougier/nano-agenda
;; Version: 0.1
;; Package-Requires: ((emacs "27.1"))
;; Keywords: convenience, org-mode, org-agenda

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <https://www.gnu.org/licenses/>.

;;; Commentary:
;; 
;; N Λ N O agenda is a minimal view of your org agenda files. It
;; displays a calendar view of current month (or the month
;; corresponding to the current selected date) alongside a view of
;; your agenda displaying timestamped entries. The agenda can be
;; navigated using arrows keys and killed using "q", "return" or
;; "escape".
;;
;; Usage example:
;;
;; M-x: nano-agenda
;;
;;; NEWS:
;;
;; Version 0.1
;; - Submission to ELPA
;;
;;; Code 
(require 'ts)
(require 'org)
(require 'cl-lib)
(require 'org-agenda)
(require 'org-duration)
(require 'calendar)
(require 'holidays)


(defgroup nano-agenda nil
  "N Λ N O agenda"
  :group 'nano)

(defgroup nano-agenda-faces nil
  "N Λ N O agenda faces"
  :group 'nano-agenda)

(defvar nano-agenda--current-selection (ts-now)
  "Current selected date")

(defvar nano-agenda--busy-levels (list)
  "Cached list of (date busy-level) for internal use")

(defface nano-agenda-default
  '((t :inherit default))
  "Default face"
  :group 'nano-agenda-faces)

(defface nano-agenda-selected
  '((t :inherit default :inverse-video t))
  "Face for the selected day"
  :group 'nano-agenda-faces)

(defface nano-agenda-today
  '((t :inherit (font-lock-string-face bold)))
  "Today face when not selected."
  :group 'nano-agenda-faces)

(defface nano-agenda-selected-today
  '((t :inherit (font-lock-string-face nano-strong) :inverse-video t))
  "Today face when selected."
  :group 'nano-agenda-faces)

(defface nano-agenda-weekend
  '((t :inherit font-lock-comment-face))
  "Weekend face"
  :group 'nano-agenda-faces)

(defface nano-agenda-holidays
  '((t :inherit font-lock-comment-face))
  "Holidays face"
  :group 'nano-agenda-faces)

(defface nano-agenda-outday
  '((t :inherit font-lock-comment-face))
  "Out day face"
  :group 'nano-agenda-faces)

(defface nano-agenda-day-name
  '((t :inherit font-lock-comment-face))
  "Day name face (on second line)"
  :group 'nano-agenda-faces)

(defface nano-agenda-month-name
  '((t :inherit bold))
  "Month name face (on first line)"
  :group 'nano-agenda-faces)

(defface nano-agenda-mouse
  '((t :inherit 'highlight ))
  "Mouse highlight face"
  :group 'nano-agenda-faces)

(defface nano-agenda-button
  '((t :inherit font-lock-comment-face))
  "Header button (left and right)"
  :group 'nano-agenda-faces)

(defun nano-agenda-forward-day ()
  (interactive)
  (setq nano-agenda--current-selection (ts-inc 'day 1 nano-agenda--current-selection))
  (nano-agenda-update))

(defun nano-agenda-backward-day ()
  (interactive)
  (setq nano-agenda--current-selection (ts-dec 'day 1 nano-agenda--current-selection))
  (nano-agenda-update))

(defun nano-agenda-forward-week ()
  (interactive)
  (setq nano-agenda--current-selection (ts-inc 'day 7 nano-agenda--current-selection))
  (nano-agenda-update))

(defun nano-agenda-backward-week ()
  (interactive)
  (setq nano-agenda--current-selection (ts-dec 'day 7 nano-agenda--current-selection))
  (nano-agenda-update))

(defun nano-agenda-forward-month ()
  (interactive)
  (setq nano-agenda--current-selection (ts-inc 'month 1 nano-agenda--current-selection))
  (nano-agenda-update))

(defun nano-agenda-backward-month ()
  (interactive)
  (setq nano-agenda--current-selection (ts-dec 'month 1 nano-agenda--current-selection))
  (nano-agenda-update))
  
(defun nano-agenda-forward-year ()
  (interactive)
  (setq nano-agenda--current-selection (ts-inc 'year 1 nano-agenda--current-selection))
  (nano-agenda-update))
    
(defun nano-agenda-backward-year ()
  (interactive)
  (setq nano-agenda--current-selection (ts-dec 'year 1 nano-agenda--current-selection))
  (nano-agenda-update))

(defun nano-agenda-goto-today ()
  (interactive)
  (setq nano-agenda--current-selection (ts-now))
  (nano-agenda-update))

(defun nano-agenda-goto (&optional date)
  (interactive)
  (setq nano-agenda--current-selection (or date (ts-now)))
  (nano-agenda-update))

(define-minor-mode nano-agenda-mode
  "Minor mode for nano-agenda."
  :init nil
  :keymap `((,(kbd "<left>")    . nano-agenda-backward-day)
            (,(kbd "<right>")   . nano-agenda-forward-day)
            (,(kbd "<up>")      . nano-agenda-backward-week)
            (,(kbd "<down>")    . nano-agenda-forward-week)
            (,(kbd "<S-left>")  . nano-agenda-backward-month)
            (,(kbd "<S-right>") . nano-agenda-forward-month)
            (,(kbd "<S-up>")    . nano-agenda-backward-year)
            (,(kbd "<S-down>")  . nano-agenda-forward-year)
            (,(kbd "r")         . nano-agenda-refresh)
            (,(kbd ".")         . nano-agenda-goto-today)
            (,(kbd "t")         . nano-agenda-goto-today)
            (,(kbd "C-g")       . nano-agenda-kill)
            (,(kbd "q")         . nano-agenda-kill)
            (,(kbd "<return>")  . nano-agenda-kill)
            (,(kbd "<escape>")  . nano-agenda-kill))

  (when nano-agenda-mode
    (setq buffer-read-only t)
    (setq cursor-type nil)))


(defun nano-agenda--center-string (string size)
  (let* ((padding (/ (- size (length string)) 2))
         (lpad (+ (length string) padding))
         (lformat (format "%%%ds" lpad))
         (rformat (format "%%%ds" (- size))))
    (format rformat (format lformat string))))


(defun nano-agenda ()
  "Create windows & buffers associated with the agenda (below current window).

          (before)                         (after) 
+--------------------------+     +--------------------------+
|                          |     |                          |
|                          |     |                          |
|                          | ->  |                          |
|                          |     +----------+---------------+
|                          |     | calendar | agenda        |
+--------------------------+     +----------+---------------+"

  (interactive)
  
  (let* ((calendar-buffer "*nano-calendar*")
         (agenda-buffer "*nano-agenda*")
         (calendar-window (get-buffer-window calendar-buffer))
         (agenda-window (get-buffer-window agenda-buffer)))

    ;; Create calendar window if necessary
    (unless calendar-window
      (when agenda-window
        (delete-window agenda-window)
        (setq agenda-window nil))
      (setq calendar-window (split-window nil -10 nil)))
    ;; (setq calendar-window (split-window nil -10 'above)))

    ;; Create agenda window if necessary
    (unless agenda-window
      (setq agenda-window (split-window calendar-window 25 'right)))

    ;; Setup calendar window
   (with-selected-window calendar-window
     (switch-to-buffer calendar-buffer)
     (set-window-dedicated-p calendar-window t)
     (set-window-margins calendar-window 1)
     (nano-agenda-mode t)
     (setq header-line-format nil)
     (setq window-size-fixed 'width))

   ;; Setup agenda window
   (with-selected-window agenda-window
     (switch-to-buffer agenda-buffer)
     (org-mode)
     (nano-agenda-mode t)
     (set-window-dedicated-p agenda-window t)
     (setq header-line-format nil))

   (nano-agenda-update)
   (select-window calendar-window)
   nil))


(defun nano-agenda-update ()
  "Update calendar and agenda according to selected date."
  
  (with-current-buffer "*nano-calendar*"
    (let ((inhibit-read-only t))
      (erase-buffer)
      (goto-char (point-min))
      (nano-agenda--populate-calendar)))

  (with-current-buffer "*nano-agenda*"
    (let ((inhibit-read-only t))
      (erase-buffer)
      (goto-char (point-min))
      (nano-agenda--populate-agenda))))
  

(defun nano-agenda-kill ()
  "Kill buffers and windows associated with the agenda."

  (interactive)
  (let* ((calendar-buffer "*nano-calendar*")
         (agenda-buffer "*nano-agenda*"))
    (if (get-buffer calendar-buffer)
        (kill-buffer calendar-buffer))
    (if (get-buffer agenda-buffer)
        (kill-buffer agenda-buffer))))

(defun nano-agenda-refresh ()
  "Reset the cache of busy levels."

  (interactive)
  (setq nano-agenda--busy-levels (list)))


(defun nano-agenda--busy-level (date)
  "Compute the busy level at a given date. This is done by
counting the number of timed entries. Computed levels are cached
for efficiency."
    
  (let* ((day   (ts-day   date))
         (month (ts-month date))
         (year  (ts-year  date))
         (date  (list month day year))
         (level 0)
         (entry (assoc date nano-agenda--busy-levels)))

    (if entry
        (cadr entry)
      (progn
        (dolist (file org-agenda-files)
          (dolist (entry (org-agenda-get-day-entries file date))
            (if (get-text-property 0 'time-of-day entry)
                (setq level (+ level 1)))))
        (add-to-list 'nano-agenda--busy-levels `(,date ,level))
        level))))


(defun nano-agenda--populate-agenda ()
  "Populate the agenda according to current selected date."

  (let* ((selected nano-agenda--current-selection)
         (day      (ts-day   selected))
         (month    (ts-month selected))
         (year     (ts-year  selected))
         (date     (list month day year))
         (holidays (calendar-check-holidays date))
         (entries '()))

    ;; Header (literal date + holidays (if any))
    (insert "\n")
    (insert (ts-format "*%A %-e %B %Y*" selected))
    (if holidays
        (insert (format " /(%s)/" (nth 0 holidays))))
    (insert "\n\n")

    ;; Body (only timed entries)

    ;; Collect all entries with 'time-of-day
    (dolist (file org-agenda-files)
      (dolist (entry (org-agenda-get-day-entries file date))
        (if (get-text-property 0 'time-of-day entry)
            (add-to-list 'entries entry))))

    ;; Sort entries
    (setq entries (sort entries #'(lambda (entry-1 entry-2)
                                    (< 
                                     (get-text-property 0 'time-of-day entry-1)
                                     (get-text-property 0 'time-of-day entry-2)))))

    ;; Display entries
    (dolist (entry (cl-subseq entries 0 (min 4 (length entries))))
;;    (dolist (entry entries)
      (let* ((text        (get-text-property 0 'txt entry))
             (time        (get-text-property 0 'time entry))
             (time-of-day (get-text-property 0 'time-of-day entry))
             (hours       (if time-of-day
                              (format "/%02dh —/" (floor (/ time-of-day 100)))
                            "     "))
             (minutes     (if time-of-day
                              (% time-of-day 100) -1))
             (duration    (get-text-property 0 'duration entry)))
        (insert (format "%s %s\n" hours text))))

    (if (> (length entries) 4)
        (insert (format "/+%S non-displayed event(s)/" (- (length entries) 4)))))

  
  (goto-char (point-min)))



(defun nano-agenda--populate-calendar ()
  "Populate the calendar according to the month of the current selected date."

  ;; Header with prev/next buttons
  ;; -----------------------------
  (let* ((selected nano-agenda--current-selection)
         (map-left (make-sparse-keymap))
         (map-right (make-sparse-keymap)))

    (define-key map-left (kbd "<down-mouse-1>") #'nano-agenda-backward-month)
    (define-key map-right (kbd "<down-mouse-1>") #'nano-agenda-forward-month)

    (insert "\n")
    (insert (propertize "<" 'face 'nano-agenda-button
                        'mouse-face 'nano-agenda-mouse
                        'help-echo "Previous month"
                        'keymap map-left))
    (insert (propertize (nano-agenda--center-string (format "%s %d"
                                                            (ts-month-name selected)
                                                            (ts-year selected)) 18)
                        'face 'nano-agenda-month-name))
    (insert (propertize ">" 'face 'nano-agenda-button
                        'mouse-face 'nano-agenda-mouse
                        'help-echo "Next month"
                        'keymap map-right))
    (insert "\n")
    (insert (propertize "Mo Tu We Th Fr "
                        'face 'nano-agenda-day-name))
    (insert (propertize "Sa Su"
                        'face 'nano-agenda-day-name))
    (insert "\n"))
  
  ;; Body with navigation keymap
  ;; ---------------------------
  (let* ((selected nano-agenda--current-selection)
         (today    (ts-now))
         (day      (ts-day   selected))
         (month    (ts-month selected))
         (year     (ts-year  selected))
         (start    (make-ts :year year :month month :day 1
                            :hour 0 :minute 0 :second 0))
         (dow      (mod (+ 6 (ts-dow start)) 7))
         (start    (ts-dec 'day dow start))
         (body     ""))

    (dotimes (row 6)
      (dotimes (col 7)
        (let* ((day (+ (* row 7) col))
               (date (ts-inc 'day day start))
               ;; Slow
               ;; (level (nano-agenda--busy-level date))
               (map (make-sparse-keymap))
               (is-today (and (= (ts-year date) (ts-year today))
                              (= (ts-doy date) (ts-doy today))))
               (is-selected (and (= (ts-year date) (ts-year selected))
                                 (= (ts-doy date) (ts-doy selected))))
               (is-selected-today (and is-selected is-today))
               (is-outday (not (= (ts-month date) month)))
               (is-holidays (calendar-check-holidays (list
                                                      (ts-month date)
                                                      (ts-day date)
                                                      (ts-year date))))
               (is-weekend (or (= (ts-dow date) 0) (= (ts-dow date) 6)))
               (face (cond (is-selected-today 'nano-agenda-selected-today)
                           (is-selected       'nano-agenda-selected)
                           (is-today          'nano-agenda-today)
                           (is-outday         'nano-agenda-outday)
                           (is-weekend        'nano-agenda-weekend)
                           (is-holidays       'nano-agenda-holidays)
                           (t                 'nano-agenda-default))))

          (define-key map (kbd "<down-mouse-1>")
            `(lambda() (interactive) (nano-agenda-goto ,date)))

            (insert (propertize (format "%2d" (ts-day date))
                                'face face
                                'mouse-face (cond (is-selected-today 'nano-agenda-selected-today)
                                                  (is-selected       'nano-agenda-selected)
                                                  (t                 'nano-agenda-mouse))
                                'help-echo (format "%s%s" (ts-format "%A %-e %B %Y" date)
                                                   (if is-holidays (format " (%s)" (nth 0 is-holidays))
                                                     ""))
                                'keymap map))
            (if (< col 6) (insert " "))))
      (if (< row 5) (insert "\n")))))

(provide 'nano-agenda)
;;; nano-agenda.el ends here
