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
(defvar mach-exit-sqr
	(*	(/	2
			(- gamma 1))
	(-	(expt	(/ 	pressure-chamber
						pressure-atmosphere)
					(/	(- gamma 1)
						gamma))
			1)))
(defvar nozzle-exit-area
	(*	(/	area-nozzle-throat
			(sqrt mach-exit-sqr))
	(expt	(/	(+	(*	(/	(-	gamma 1)
							2)
						mach-exit-sqr)
					1)
				(/	(+ gamma 1)
					2))
			(/	(+	gamma 1)
				(*	(- gamma 1)
					2))
	)))
(defvar chamber-diameter
	(*	5 diameter-nozzle-throat))
(defvar chamber-area
	(/	(* pi (expt chamber-diameter 2))
		4))
;(defvar temp-ratio
;	(/	temp-chamber
;		temp-throat))
(defvar nozzle-exit-diameter
	(expt	(/	(*	4 nozzle-exit-area)
				pi)
			1/2))
(defvar combustion-chamber-L 60)
(defvar chamber-volume
	(*	combustion-chamber-L area-nozzle-throat))
(defvar chamber-area
	(/	(*	pi
			(expt chamber-diameter 2))))
(defvar chamber-length
	(/ chamber-volume
		(* 1.1 chamber-area)))	;; 1.1 is actually 1/10
(defvar chamber-wall-thickness 	;;Tw = PD/16000
	(/	(* pressure-chamber chamber-diameter)
		16000))
(defvar heat-transfer-area
	(* pi
		(+ chamber-diameter
			(* chamber-wall-thickness 2))
		chamber-length 1.1))
(defvar average-heat-transfer-rate 3)
(defvar heat-transfer-cooling
	(* average-heat-transfer-rate heat-transfer-area))
(defvar total-heat-transferred
	(* average-heat-transfer-rate heat-transfer-area))
(defvar temp-entering-jacket 50)
(defvar temp-leaving-jacket 90)
(defvar deltaT
	(- temp-leaving-jacket temp-entering-jacket))
(defvar cooling-flow-rate
	(/	total-heat-transferred deltaT))
(defvar cooling-flow-rate2 .755)
(defvar specific-heat-coolant 1.0)
(defvar coolant-velocity 30)
(defvar rho 62.4)
(defvar D1 1.56);;reduced
(defvar D2 1.475);;reduced
(defvar annular-flow-passage;;doesn't work
	(*	(/ pi 4)
		(- d2 (expt d1 2))))
(defvar fuel-flow-rate .022);lb/sec
(defvar oriface-discharge-coefficient .7)
(defvar fuel-injector-area )
(defvar oxygen-injector-area )
