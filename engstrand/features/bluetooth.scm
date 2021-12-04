(define-module (engstrand features bluetooth)
               #:use-module (rde features)
               #:use-module (rde features predicates)
               #:use-module (gnu packages linux)
               #:use-module (gnu services desktop)
               #:use-module (engstrand utils)
               #:export (feature-bluetooth))

; TODO: add user to group lp
(define* (feature-bluetooth
           #:key
           (auto-enable? #t))
         "Configure and run the bluetoothd daemon."

         (define (get-system-services config)
           (list
             (bluetooth-service
               #:bluez bluez
               #:auto-enable? auto-enable?)))

         (feature
           (name 'bluetooth)
           (system-services-getter get-system-services)))
