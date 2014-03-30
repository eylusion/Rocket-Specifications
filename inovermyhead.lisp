;; gonna over simplify the shit out of everything
;; example calculations for 300psi chamber pressure and a thrust of 20 lbs.
;; using gaseous oxygen and hydrocarbons (gasoline) specifications.
;; using a mixture o-f-ratio of 2.5 gives us a specific impulse of 260secs.
;; Chamber temp of 6202R otherwise known as 5742f
;; ideal-gas-constant being gas constant of 65 for oxy/hydrocarbon
;; gravitational-constant average gravity area-throat sea level
;; atmospheric-pressure sea level atmospheric pressure
;; Chamber Length chamber-residence-time assumption of 60
;; Minimum allowable working stress of Copper is material-stress = 8000
;; DeltaT = Temperature difference of coolent entering jacket assume 40degF
;; Assume average-heat-transfer = 3 Btu/in squared - sec, for water cooled small copper rocket engine
;; Assume water velocity coolant-velocity = 30ft/sec
;; rho of water coolant-density = 62.4lb/ft3
;; these starting values will be hard coded for now.

;; Starting values
(defvar chamber-pressure 300)
(defvar thrust-force 20)
(defvar o-f-ratio 2.5)
(defvar specific-impulse 260)
(defvar gamma 1.2)
(defvar chamber-temperature 6202)
(defvar ideal-gas-constant 65)
(defvar gravitational-constant 32.2)
(defvar atmospheric-pressure 14.7)
(defvar chamber-residence-time 60)
(defvar material-stress 16000)
(defvar average-heat-transfer 3)
(defvar DeltaT 40)
(defvar coolant-velocity 30)
(defvar coolant-density 62.4)


;; Calculations
;; Step 1
;; total-propellent-flow = Total Propellent Flow Rate in lb/sec
(defvar total-propellent-flow
  (/ thrust-force specific-impulse))

;; fuel-flow-rate = Fuel Flow Rate in lb/sec
(defvar fuel-flow-rate
  (/ total-propellent-flow
    (1+ o-f-ratio)))

;; oxidizer-flow-rate = Oxygen Flow Rate in lb/sec
(defvar oxidizer-flow-rate
  (- total-propellent-flow fuel-flow-rate))

;; Step 2
;; Throat Temperature in Rankine(DegR) (DegR + 460 = Fahrenheit)
(defvar temperature-throat
  (* chamber-temperature
     (/ 1 (+ 1 (/ (- gamma 1)
                  2)))))

;; Step 3
;; Nozzle Throat Pressure in pounds per square inch
(defvar pressure-throat
  (* chamber-pressure
     (expt (+ 1 (/ (- gamma 1)
                   2))
                (- (/ gamma
                      (- gamma 1))))))

;; Step 4
;; Nozzle Throat Area in inches squared
(defvar area-throat
  (* (/ total-propellent-flow
        pressure-throat)
     (expt (/ (* ideal-gas-constant temperature-throat)
              (* gamma gravitational-constant))
           .5)))

;; Step 5
;; Throat Diameter in inches
(defvar diameter-throat
  (expt (/ (* 4 area-throat)
           pi)
        1/2))

;; Step 6
;; Mach Exit Squared
(defvar exit-mach
  (*  (/  2
          (-  gamma
              1))
      (-  (expt (/  chamber-pressure
                    atmospheric-pressure)
                (/  (-  gamma
                        1)
                    gamma))
          1)))

;; Step 6a
;; Nozzle Exit Area in inches squared
(defvar area-nozzle-exit
  (* (/ area-throat
        (sqrt exit-mach))
     (expt  (/ (+ (* (/ (- gamma 1)
                        2)
                     exit-mach)
                  1)
                  (/ (+ gamma 1)
                     2))
            (/ (+ gamma 1)
               (* (- gamma 1)
                  2)))))

;; Step 7
;; Nozzle Exit Diameter in inches
(defvar diameter-exit
  (expt (/ (* 4 area-nozzle-exit)
           pi)
        1/2))

;; Step 8
;; Chamber Length for complete combustion in inches
;; (defvar chamber-residence-time
;;  (/  volume-chamber
;;      area-throat))

;; Step 8a
;; Combustion chamber volume in inches cubed
(defvar volume-chamber
  (* chamber-residence-time area-throat))

;; Step 8b
;; Chamber Diameter generally 5 times throat diameter in inches
(defvar diameter-chamber
  (* 5 diameter-throat))

;; Step 8c
;; Combustion chamber cross-sectional area in inches squared
(defvar area-chamber
  (/  (* pi
        (expt diameter-chamber
              2))
      4))

;; Step 9
;; Chamber Length in inches
(defvar chamber-length
  (/ volume-chamber
      (* 1.1
         area-chamber)))

;; Step 10
;; Chamber wall thickness in inches increase to allow for welding/brazing and working purposes.
(defvar wall-thickness
  (/  (* chamber-pressure diameter-chamber)
      material-stress))

;; Step 11
;; Area of heat transference in inches squared
(defvar heat-transfer-area
  (*  pi
      (+  diameter-chamber
          (*  2
              wall-thickness))
      chamber-length
      1.1))

;; Step 11a
;; Total Heat Transferred in Btu/sec
(defvar heat-transferred
  (* average-heat-transfer heat-transfer-area))

;; Step 12
;; Cooling water flow rate in lb/sec
(defvar coolent-flow-rate
  (/ heat-transferred DeltaT))

;; Step 13 (Errors in resource material so I cannot double check my equations leaving this out for now.
;; Annular Flow Passage of coolant annular-flow-passage
;; D1 is the outer diameter of the combustion chamber and D2 is the inner diameter of the cooling jacket
;;(defvar D1
;;  (+ diameter-chamber
;;    (* 2 wall-thickness)))
;;(defvar D2
;;  (sqrt (/ (* 4 coolent-flow-rate)
;;           (+ (* coolant-velocity coolant-density pi)
;;              (expt d1 2)))))
;; annular-flow-passage = ((pi)/4) (D22 - D12) 
;; (defvar annular-flow-passage
;;    (*  (/ pi 4)
;;        (- (expt D2 2) (expt D1 1))))


(defun main ()
  (progn
    (princ "Application to list design specifications for a small copper rocket engine." )
    (princ #\newline)
    (princ "Gonna over simplify the shit out of everything")
    (princ #\newline)
    (princ "example calculations for 300psi chamber pressure and a thrust of 20 lbs" )
    (princ #\newline)
    (princ "using gaseous oxygen and hydrocarbons (gasoline) specifications" )
    (princ #\newline)
    (princ "using a mixture o-f-ratio of 2.5 gives us a specific impulse of 260secs" )
    (princ #\newline)
    (princ "Chamber temp of 6202R otherwise known as 5742f" )
    (princ #\newline)
    (princ "ideal-gas-constant being gas constant of 65 for oxy/hydrocarbon" )
    (princ #\newline)
    (princ "gravitational-constant average gravity area-throat sea level" )
    (princ #\newline)
    (princ "atmospheric-pressure sea level atmospheric pressure" )
    (princ #\newline)
    (princ "Chamber Length chamber-residence-time assumption of 60" )
    (princ #\newline)
    (princ "Minimum allowable working stress of Copper is material-stress = 8000" )
    (princ #\newline)
    (princ "DeltaT = Temperature difference of coolent entering jacket assume 40degF" )
    (princ #\newline)
    (princ "Assume average-heat-transfer = 3 Btu/in squared - sec, for water cooled small copper rocket engine" )
    (princ #\newline)
    (princ "Assume water velocity coolant-velocity = 30ft/sec" )
    (princ #\newline)
    (princ "rho of water coolant-density = 62.4lb/ft3" )
    (princ #\newline)
    (princ "these starting values will be hard coded for now" )
    (princ #\newline)
    (princ (format nil "Total Propellent flow rate ~D in pounds per second." total-propellent-flow))
    (princ (format nil "Total Fuel flow rate ~D in pounds per second." fuel-flow-rate))
    (princ (format nil "Total Oxidizer \(Gaseous Oxygen\) flow rate ~D in pounds per second." oxidizer-flow-rate))
    ))
