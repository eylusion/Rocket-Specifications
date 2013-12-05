(defconstant *R* 65)
(defconstant gravity 32.2)
(defconstant gamma 1.2)
(defvar thrust 20.0
  )
(defvar Isp 260.0
  )
(defvar mixture-ratio 2.5
  )
(defvar total-propellant
    (/ thrust Isp)
  )
(defvar fuel (/ total-propellant (+ mixture-ratio 1))
  )
(defvar oxygen (- total-propellant fuel)
  )
(defvar temp-chamber 5742
  )
(defvar temp-throat (* temp-chamber (/ 1 (+ 1 (/ (- gamma 1) 2 ))))
  )
(defvar pressure-chamber 300
  )
(defvar pressure-throat (expt (* pressure-chamber (+ 1 (/ (- gamma 1) 2)))(- (/ gamma (- gamma 1))))
  )
(defvar area-nozzle-throat
    (expt
     (*
      (/ total-propellant
         pressure-throat)
      (/
       (* *R*
          temp-throat)
       (* gamma
          gravity)))
     1/2)
  )

(defvar test
    (expt
     (*
      (/ .077
         169)
      9500)
     1/2)
  )

(defvar diameter-nozzle-throat
    (expt
     (/
      (* 4
         area-nozzle-throat)
      pi)
     1/2)
  )

(defvar diameter-nozzle-exit ()
  )
(defvar area-nozzle-exit ()
  )
(defvar chamber-length ()
  )
(defvar chamber-area ()
  )
(defvar chamber-volume ()
  )
(defvar chamber-diameter ()
  )
(defvar chamber-wall-thickness ()
  )
(defvar heat-transfer-area ()
  )
(defvar heat-transfer-cooling ()
  )
(defvar cooling-flow-rate ()
  )
(defvar fuel-injector-area ()
  )
(defvar oxygen-injector-area ()
  )