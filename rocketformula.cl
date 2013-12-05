(defconstant *R* 65)
(defconstant *gravity* 32.2)

(defvar gamma 1.2)
(defvar thrust 20.0)
(defvar Isp 260.0)
(defvar pressure-atmosphere 14.7)
(defvar mixture-ratio 2.5)
(defvar total-propellant (/ thrust Isp))
(defvar fuel
  (/ total-propellant
    (+ mixture-ratio 1)))
(defvar oxygen
  (- total-propellant fuel))
(defvar temp-chamber 5742)
(defvar temp-chamber-R (+ temp-chamber 460))
(defvar temp-throat-R (* temp-chamber-R
  (/ 1 (+ 1 (/ (- gamma 1)
               2)))))
(defvar temp-throat (- temp-throat-R 460))
(defvar pressure-chamber 300)
(defvar pressure-throat 
  (* pressure-chamber
     (expt (+ 1 (/ (- gamma 1)
                   2))
     (- (/ gamma (- gamma 1))))))
(defvar area-nozzle-throat
    (* (/ total-propellant
          pressure-throat)
       (expt (/ (* *R*
                   temp-throat-R)
                (* gamma
                   *gravity*))
       1/2)))
(defvar diameter-nozzle-throat
    (expt (/ (* 4 area-nozzle-throat)
             pi)
          1/2))
(defvar Me2
    (* (/ 2 (- gamma 1))    
       (- 1 (expt (/ pressure-chamber
                     pressure-atmosphere)
                  (/ (1- gamma)
                     gamma)))))
(defvar area-nozzle-exit
    (* (/ area-nozzle-throat (sqrt me2))
       (expt (/ (+ 1 (* (/ (- gamma 1)
                           2)
                        Me2))
                (/ (+ 1 gamma)
                   2))
             (/ (+ 1 gamma)
                (* 2 (- gamma 1))))))
                
(defvar diameter-nozzle-exit )

(defvar chamber-length )

(defvar chamber-area )
  
(defvar chamber-volume )
  
(defvar chamber-diameter )
  
(defvar chamber-wall-thickness )
  
(defva heat-transfer-area )
  
(defvar heat-transfer-cooling )
  
(defvar cooling-flow-rate )
  
(defvar fuel-injector-area )
  
(defvar oxygen-injector-area )
  
