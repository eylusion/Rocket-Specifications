;; gonna over simplify the shit out of everything
;; example calculations for 300psi chamber pressure and a thrust of 20 lbs.
;; using gaseous oxygen and hydrocarbons (gasoline) specifications.
;; using a mixture ratio of 2.5 gives us a specific impulse of 260secs.
;; these starting values will be hard coded for now.

;; Starting values
(defvar Pc 300)
(defvar F 20)
(defvar r 2.5)
(defvar Isp 260)
(defvar gamma 1.2)

;; Calculations
;; Wt = Total Propellent Flow Rate in lb/sec
(defvar Wt
  (/ F Isp))

;; Wf = Fuel Flow Rate in lb/sec
(defvar Wf
  (/ Wt
    (1+ r)))

;; Wo = Oxygen Flow Rate in lb/sec
(defvar Wo
  (- Wt Wf))
