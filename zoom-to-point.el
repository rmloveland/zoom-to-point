;; Copyright (C) 2012 Rich Loveland

;; Author: Rich Loveland  <loveland.richard@gmail.com>
;; Keywords: automation, convenience
;; Version: 0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;  * ZOOM-TO-POINT

;; This is not an Emacs ``mode" so much as two convenient function
;; definitions and a slightly less convenient variable declaration (e.g.,
;; =zoom-to-point=, =unzoom=, and =*zoom-level*=).

;; That said, the functions at least do pretty much what they say:
;; namely, they zoom towards and away from the point using the specified ``level" of
;; zoom you require, with the now-larger or -smaller text centered in the
;; buffer.

;; Specify the zoom-level in the parameter =*default-zoom-level*=. For now, type

;; #+BEGIN_SRC emacs-lisp
;;   (defvar *default-zoom-level* 3)
;; #+END_SRC

;; into the =*scratch*= buffer and evaluate it.

;; Then zoom in on whatever you're aimed at with

;; #+BEGIN_EXAMPLE
;; M-x zoom-to-point
;; #+END_EXAMPLE

;; To return to your previous code- or text-viewing experience, use

;; #+BEGIN_EXAMPLE
;; M-x unzoom
;; #+END_EXAMPLE

;; This interface is clunky and represents a minimal first working
;; version. Expect changes, or better yet, contribute some!
;; This is not an Emacs mode so much as two function definitions and

(defvar *default-zoom-level* 3)

(defun zoom-to-point ()
  (interactive)
  (save-excursion
    (text-scale-increase *default-zoom-level*)
    (recenter-top-bottom)))

(defun unzoom ()
  (interactive)
  (save-excursion
    (text-scale-decrease *default-zoom-level*)
    (recenter-top-bottom)))

(provide 'zoom-to-point)
