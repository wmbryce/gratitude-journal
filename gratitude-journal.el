;;; gratitude-journal.el --- Frobnicate and bifurcate flanges


;; Author: Michael Bryce<jrh@example.com>
;; Version: 0.1
;; Keywords: Journal, Gratitude

…

;;; Commentary:

;; This is just a simple program to prompt the user to practice gratifulness each day
…

;;;###autoload
(defun printToTestBuffer (question answerFormat)
  (let ((answer (read-from-minibuffer question)))
    (insert (format answerFormat answer))
    )
  )

(defun insert-current-date () (interactive)
        (insert (shell-command-to-string "echo -n $(date +%m/%d/%Y)")))

;;; Code:
(defun gratitude-journal ()
    (interactive)
    (find-file-literally "~/org/gratitude_journal.org")
    (goto-char (point-max))
    (insert (format "\n\n* "))
    (insert-current-date)
    (printToTestBuffer "What is something that you are grateful for today? " "\n\n Today I am grateful for: \n 1. %s")
    (printToTestBuffer "What is something else that you are grateful for? " "\n 2. %s")
    (printToTestBuffer "What is something else that you are grateful for? " "\n 3. %s")
    (printToTestBuffer "What is something that would make to great? " "\n\n Things that would make today great: \n 1.%s")
    (printToTestBuffer "And another thing? " "\n 2. %s")
    (printToTestBuffer "Final thing? " "\n 3. %s")
    (printToTestBuffer "Ok give yourself a compliment: I am " "\n\n I am %s")
    (printToTestBuffer "Ok one more: I am " "\n I am %s")
    (printToTestBuffer "Thanks for checking in. This is a practice that builds a happier life" "")
    (save-buffer)
    )
