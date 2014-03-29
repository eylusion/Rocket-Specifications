;; gonna over simplify the shit out of everything
;; example calculations for 300psi chamber pressure and a thrust of 20 lbs.
;; using gaseous oxygen and hydrocarbons (gasoline) specifications.
;; using a mixture ratio of 2.5 gives us a specific impulse of 260secs.
;; Chamber temp of 6202R otherwise known as 5742f
;; R being gas constant of 65 for oxy/hydrocarbon
;; gc average gravity at sea level
;; Patm sea level atmospheric pressure
;; Chamber Length L assumption of 60
;; Minimum allowable working stress of Copper is S = 8000
;; DeltaT = Temperature difference of coolent entering jacket assume 40degF
;; Assume qc = 3 Btu/in squared - sec, for water cooled small copper rocket engine
;; Assume water velocity vw = 30ft/sec
;; rho of water wrho = 62.4lb/ft3
;; these starting values will be hard coded for now.

;; Starting values
(defvar Pc 300)
(defvar F 20)
(defvar ratio 2.5)
(defvar Isp 260)
(defvar gamma 1.2)
(defvar Tc 6202)
(defvar R 65)
(defvar gc 32.2)
(defvar Patm 14.7)
(defvar L 60)
(defvar S 16000)
(defvar qc 3)
(defvar DeltaT 40)
(defvar vw 30)
(defvar wrho 62.4)


;; Calculations
;; Step 1
;; Wt = Total Propellent Flow Rate in lb/sec
(defvar Wt
  (/ F Isp))

;; Wf = Fuel Flow Rate in lb/sec
(defvar Wf
  (/ Wt
    (1+ ratio)))

;; Wo = Oxygen Flow Rate in lb/sec
(defvar Wo
  (- Wt Wf))

;; Step 2
;; Throat Temperature in Rankine(DegR) (DegR + 460 = Fahrenheit)
(defvar Tt
  (* Tc
     (/ 1 (+ 1 (/ (- gamma 1)
                  2)))))

;; Step 3
;; Nozzle Throat Pressure in pounds per square inch
(defvar Pt
  (* Pc
     (expt (+ 1 (/ (- gamma 1)
                   2))
                (- (/ gamma
                      (- gamma 1))))))

;; Step 4
;; Nozzle Throat Area in inches squared
(defvar At
  (* (/ Wt
        Pt)
     (expt (/ (* R Tt)
              (* gamma gc))
           .5)))

;; Step 5
;; Throat Diameter in inches
(defvar Dt
  (expt (/ (* 4 At)
           pi)
        1/2))

;; Step 6
;; Mach Exit Squared
(defvar Me
  (*  (/  2
          (-  gamma
              1))
      (-  (expt (/  Pc
                    Patm)
                (/  (-  gamma
                        1)
                    gamma))
          1)))

;; Step 6a
;; Nozzle Exit Area in inches squared
(defvar Ae
  (* (/ At
        (sqrt Me))
     (expt  (/ (+ (* (/ (- gamma 1)
                        2)
                     Me)
                  1)
                  (/ (+ gamma 1)
                     2))
            (/ (+ gamma 1)
               (* (- gamma 1)
                  2)))))

;; Step 7
;; Nozzle Exit Diameter in inches
(defvar De
  (expt (/ (* 4 Ae)
           pi)
        1/2))

;; Step 8
;; Chamber Length for complete combustion in inches
;; (defvar L
;;  (/  Vc
;;      At))

;; Step 8a
;; Combustion chamber volume in inches cubed
(defvar Vc
  (* L At))

;; Step 8b
;; Chamber Diameter generally 5 times throat diameter in inches
(defvar Dc
  (* 5 Dt))

;; Step 8c
;; Combustion chamber cross-sectional area in inches squared
(defvar Ac
  (/  (* pi
        (expt Dc
              2))
      4))

;; Step 9
;; Chamber Length in inches
(defvar Lc
  (/ Vc
      (* 1.1
         Ac)))

;; Step 10
;; Chamber wall thickness in inches increase to allow for welding/brazing and working purposes.
(defvar tw
  (/  (* Pc Dc)
      S))

;; Step 11
;; Area of heat transference in inches squared
(defvar A
  (*  pi
      (+  Dc
          (*  2
              tw))
      Lc
      1.1))

;; Step 11a
;; Total Heat Transferred in Btu/sec
(defvar Q
  (* qc A))

;; Step 12
;; Cooling water flow rate in lb/sec
(defvar w
  (/ Q DeltaT))

;; Step 13 (Errors in resource material so I cannot double check my equations leaving this out for now.
;; Annular Flow Passage of coolant afp
;; D1 is the outer diameter of the combustion chamber and D2 is the inner diameter of the cooling jacket
;;(defvar D1
;;  (+ Dc
;;    (* 2 tw)))
;;(defvar D2
;;  (sqrt (/ (* 4 w)
;;           (+ (* vw wrho pi)
;;              (expt d1 2)))))
;; afp = ((pi)/4) (D22 - D12) 
;; (defvar afp
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
    (princ "using a mixture ratio of 2.5 gives us a specific impulse of 260secs" )
    (princ #\newline)
    (princ "Chamber temp of 6202R otherwise known as 5742f" )
    (princ #\newline)
    (princ "R being gas constant of 65 for oxy/hydrocarbon" )
    (princ #\newline)
    (princ "gc average gravity at sea level" )
    (princ #\newline)
    (princ "Patm sea level atmospheric pressure" )
    (princ #\newline)
    (princ "Chamber Length L assumption of 60" )
    (princ #\newline)
    (princ "Minimum allowable working stress of Copper is S = 8000" )
    (princ #\newline)
    (princ "DeltaT = Temperature difference of coolent entering jacket assume 40degF" )
    (princ #\newline)
    (princ "Assume qc = 3 Btu/in squared - sec, for water cooled small copper rocket engine" )
    (princ #\newline)
    (princ "Assume water velocity vw = 30ft/sec" )
    (princ #\newline)
    (princ "rho of water wrho = 62.4lb/ft3" )
    (princ #\newline)
    (princ "these starting values will be hard coded for now" )
    (princ #\newline)
    (princ (format nil "Total Propellent flow rate ~D in pounds per second." Wt))
    (princ (format nil "Total Fuel flow rate ~D in pounds per second." Wf))
    (princ (format nil "Total Oxidizer \(Gaseous Oxygen\) flow rate ~D in pounds per second." Wo))
    ))
