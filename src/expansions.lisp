
(in-package #:clith-std)


(defwith accessors (vars (instance-form) &body body)
  `(with-accessors ,vars ,instance-form
     ,@body))

(defwith compilation-unit (() (&rest options) &body body)
  `(with-compilation-unit ,options
     ,@body))

(defwith condition-restarts (() (condition-form restart-form) &body body)
  `(with-condition-restarts ,condition-form ,restart-form
     ,@body))

(defwith hash-table-iterator ((name) (hash-table) &body body)
  `(with-hash-table-iterator (,name ,hash-table)
     ,@body))

(defwith input-from-string ((var) (string &key index start end) &body body)
  `(with-input-from-string (,var ,string :index ,index :start ,start :end ,end)
     ,@body))

(defwith open-file ((stream) (filespec &rest options) &body body)
  `(with-open-file (,stream ,filespec ,@options)
     ,@body))

(defwith open-stream ((var) (stream) &body body)
  `(with-open-stream (,var ,stream)
     ,@body))

(defwith output-to-string ((var) (&rest args) &body body)
  `(with-output-to-string (,var ,@args)
     ,@body))

(defwith package-iterator ((name) (package-list-form &rest symbol-types) &body body)
  `(with-package-iterator (,name ,package-list-form ,@symbol-types)
     ,@body))

(defwith simple-restart ((name) (format-control &rest format-arguments) &body body)
  `(with-simple-restart (,name ,format-control ,@format-arguments)
     ,@body))

(defwith slots (vars (instance-form) &body body)
  `(with-slots ,vars ,instance-form
     ,@body))

(defwith standard-io-syntax (() () &body body)
  `(with-standard-io-syntax
     ,@body))


(defwith cl:make-broadcast-stream ((stream) (&rest streams) &body body)
  (with-gensyms (stream-sym)
    `(let* ((,stream-sym (make-broadcast-stream ,@streams))
            (,stream ,stream-sym))
       (unwind-protect
            (progn ,@body)
         (close ,stream-sym)))))

(defwith cl:make-concatenated-stream ((stream) (&rest input-streams) &body body)
  (with-gensyms (stream-sym)
    `(let* ((,stream-sym (make-concatenated-stream ,@input-streams))
            (,stream ,stream-sym))
       (unwind-protect
            (progn ,@body)
         (close ,stream-sym)))))

(defwith cl:make-echo-stream ((stream) (input-stream output-stream) &body body)
  (with-gensyms (stream-sym)
    `(let* ((,stream-sym (make-concatenated-stream ,input-stream ,output-stream))
            (,stream ,stream-sym))
       (unwind-protect
            (progn ,@body)
         (close ,stream-sym)))))

(defwith cl:make-string-input-stream ((stream) (string &optional start end) &body body)
  (with-gensyms (stream-sym)
    `(let* ((,stream-sym (make-string-input-stream ,string ,start ,end))
            (,stream ,stream-sym))
       (unwind-protect
            (progn ,@body)
         (close ,stream-sym)))))

(defwith cl:make-string-output-stream ((stream) (&key element-type) &body body)
  (with-gensyms (stream-sym)
    `(let* ((,stream-sym (make-string-output-stream :element-type ,element-type))
            (,stream ,stream-sym))
       (unwind-protect
            (progn ,@body)
         (close ,stream-sym)))))

(defwith cl:make-two-way-stream ((stream) (input-stream output-stream) &body body)
  (with-gensyms (stream-sym)
    `(let* ((,stream-sym (make-two-way-stream ,input-stream ,output-stream))
            (,stream ,stream-sym))
       (unwind-protect
            (progn ,@body)
         (close ,stream-sym)))))

(defwith cl:open ((stream) (filespec &rest options) &body body)
  `(with-open-file (,stream ,filespec ,@options)
     ,@body))
