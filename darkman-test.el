;;; darkman-test.el --- Unit tests for darkman.el  -*- lexical-binding: t; -*-

;; Copyright (C) 2023 Aziz Ben Ali

;; Author: Aziz Ben Ali <tahaaziz.benali@esprit.tn>
;; Maintainer: Aziz Ben Ali <tahaaziz.benali@esprit.tn>
;; Homepage: https://darkman.grtcdr.tn
;; Version: 1.0.3
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;; Permission to use, copy, modify, and/or distribute this software for
;; any purpose with or without fee is hereby granted, provided that the
;; above copyright notice and this permission notice appear in all
;; copies.

;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
;; WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
;; WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
;; AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
;; DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
;; PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
;; TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
;; PERFORMANCE OF THIS SOFTWARE.

;;; Commentary:

;; darkman-test.el provides a set of unit tests to ensure that
;; darkman.el works as expected.

;;; Code:

(require 'ert)
(require 'darkman)

(defmacro darkman-with-themes (&rest body)
  "Evaluate BODY with a predefined ‘darkman-themes’ value."
  (declare (indent nil))
  `(let ((darkman-themes '(:light tango :dark tango-dark)))
     ,@body))

(ert-deftest darkman-test-lookup-theme ()
  "Test the return value of ‘darkman--lookup-theme’."
  (darkman-with-themes
   (should (equal (darkman--lookup-theme "dark") 'tango-dark))
   (should (equal (darkman--lookup-theme "light") 'tango))
   (should (equal (darkman--lookup-theme "dim") nil))))

(ert-deftest darkman-test-lookup-mode ()
  (darkman-with-themes
   (should (string-equal (darkman--lookup-mode "tango") "light"))
   (should (string-equal (darkman--lookup-mode "tango-dark") "dark"))
   (should (equal (darkman--lookup-mode "modus-vivendi") nil))))
