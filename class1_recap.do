* CLASS 1 RECAP

describe
summarize
list in 1/10

* Converting  the quarterly time variable from text into a Stata time variable.

gen tq = quarterly(t, "YQ")

* Display the quarterly time variable in year-quarter format.
* %tq is Stata's display format for quarterly dates.

format tq %tq

* Set the quarterly time variable for time-series analysis.

tsset tq

* visualize the movement of wpi overtime

tsline wpi

* Dickey-Fuller Test
* Used to test whether a time series has a unit root and is therefore non-stationary.

dfuller wpi, trend 

* p-value > 0.05: fail to reject the null hypothesis of a unit root.
* WPI is non-stationary in levels.

* First difference: measures the change in WPI from one quarter to the next.

gen d_wpi = D.wpi

* checking whether the first difference of wpi is stationary.

dfuller d_wpi

* p-value < 0.05: reject the null hypothesis of a unit root.
* First difference of WPI is stationary, so WPI is I(1).

* Graph of first-differenced WPI: visual check of the stationary series.

tsline d_wpi

* Inflation measures the percentage change in WPI from the previous quarter.

gen inflation = (wpi - l.wpi)/l.wpi * 100

list inflation in 1/10

* Graphing  inflation over time to examine its movement and fluctuations.

tsline inflation

* Log-difference of WPI: measures the change in log WPI and gives an approximate inflation rate.

gen inflation1 = D.ln_wpi

* Compare percentage-change inflation with log-difference inflation.

list inflation inflation1 in 1/10

* Comparison of percentage inflation and log-difference inflation over time.

tsline inflation inflation1  * (misleading)

* Convert log-difference inflation from decimal to percentage form for comparison.

gen inflation1_pct = inflation1*100

* Compare inflation measures on the same percentage scale.

tsline inflation inflation1_pct







