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

(define (debug option name arg seed)
  (if arg (sexuna-debug-file arg))
  (secuxna-debug #t)
  (or seed #f))

(define (help option name arg seed)
  (print #<<EOS
usage: kiksispehi [-:?]
                  [-d | --debug]
                  [-h | --help]
                  [-i | --input-file NAME]
                  [-o | --output-file NAME]
                  [-p | --profile]
                  [-w | --width N]
                  [-v | --version]
                  [file]*
EOS
  )
  (exit 0))

(define (input-file option name arg seed)
  (call-with-input-file arg current-input-port)
  (or seed #f))

(define (output-file option name arg seed)
  (call-with-output-file arg current-output-port)
  (or seed #f))

(define (profile option name arg seed)
  (if arg (sexuna-profile-file arg))
  (secuxna-profile #t)
  (or seed #f))

(define (version option name arg seed)
  (print (format "kiksispe'i version ~a" kiksispehi-version))
  (exit 0))

(define (width option name arg seed)
  (pretty-print-width (string->number arg))
  (or seed #f))

; handled by the Chicken runtime.
(define (runtime option name arg seed)
  (or seed #f))

(define options
  (list (option '(#\d "debug" "cfisisku")    #f #t debug)
        (option '(#\h "sidju" "help")        #f #f help)
        (option '(#\i         "input-file")  #t #f input-file)
        (option '(#\o         "output-file") #t #f output-file)
        (option '(#\p "junla" "profile")     #f #t profile)
        (option '(#\w         "width")       #t #f width)
        (option '(#\v         "version")     #f #f version)
        (option '(#\:)                       #t #f runtime)))

(define (usage option name args seed)
  (error (format "unrecognized option \"~a\"" name)))

(define (for-file name seed)
  (or seed (call-with-input-file name for-port)))

(define (for-port port)
  (let ((jalge    ((cfari-javni) port))
        (port     (current-output-port)))
    (if (not jalge)
        (secuxna-exit-status 1))
    (pretty-print jalge port)
    #t))

(define (main)
  (let ((args (cdr (argv))))
    (and (not (args-fold args options usage for-file #f))
         (for-port (current-input-port)))
    (exit (secuxna-exit-status))))
