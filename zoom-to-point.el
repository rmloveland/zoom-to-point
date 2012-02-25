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
;;  This is not an Emacs mode so much as two function definitions and
;;  a variable declaration.
;;
;;  That said, the functions at least do pretty much what they say:
;;  namely, they zoom to the point using the specified ``level" of
;;  zoom you require, with the now-enlarged text centered in the
;;  buffer.

;;  Specify the zoom-level as an integer in a prefix argument thus:

;;  C-u 6 M-x zoom-to-point

;;  To return to your previous code- or text-viewing experience, use

;;  C-u 6 M-x unzoom

;;  When zooming is no longer required, M-x unzoom returns to the
;;  selected text scale, also with point remaining at center.

(defvar *zoom-level* 3)

(defun zoom-to-point (zoom-level)
  (interactive "p")
  (let ((z (or zoom-level
	       *zoom-level*)))
    (save-excursion
      (text-scale-increase z)
      (recenter-top-bottom))))

(defun unzoom (zoom-level)
  (interactive "p")
  (let ((z (or zoom-level
	       *zoom-level*)))
    (save-excursion
      (text-scale-decrease z)
      (recenter-top-bottom))))
