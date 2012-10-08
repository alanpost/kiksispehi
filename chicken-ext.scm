;;;;
;;;; kiksispe'i - la kiksispe'i cu ctuca fi la'e lu lo do ckiku ma zvati
;;;;            |  li'u lu'u 
;;;;            `-> A "Where are Your Keys?" teacher
;;;;
;;;; Copyright (c) 2010 ".alyn.post." <alyn.post@lodockikumazvati.org>
;;;;
;;;; Permission to use, copy, modify, and/or distribute this software for any
;;;; purpose with or without fee is hereby granted, provided that the above
;;;; copyright notice and this permission notice appear in all copies.
;;;;
;;;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;;;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;;;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;;;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;;;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;;;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;;;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
;;;;

(module kiksispehi
  (kiksispehi-version
   kiksispehi-version-major
   kiksispehi-version-minor
   kiksispehi-version-patch)

(import chicken)
(import scheme)

(require-library jbogenturfahi)

(require-library irc)
(require-library sqlite3)

(import jbogenturfahi)

(import irc)
(import sqlite3)

(include "kiksispehi.scm")
(include "version.scm"))
