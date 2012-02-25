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
;;
;;  See the included file README.org for details and usage
;;  information. For now the code lives at
;;  https://github.com/rmloveland/zoom-to-point

(defvar *default-zoom-level* 3)

(defun zoom-toggle ()
  (interactive)
  (save-excursion
    (if (zoomed-p)
	(unzoom)
      (zoom-to-point))))

(defun zoom-to-point ()
  (interactive)
  (save-excursion
    (text-scale-increase *default-zoom-level*)
    (recenter)))

(defun unzoom ()
  (interactive)
  (save-excursion
    (text-scale-set 0)
    (recenter)))

(defun zoomed-p ()
  (interactive)
  (if (= text-scale-mode-amount 0)
      nil
    t))

(provide 'zoom-to-point)
