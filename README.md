# optiflow
Optiflow is an implementation of a shape-optimization method for two-dimensional incompressible flows.

#### Installation

1. You will need a recent FreeFem++ installation, see http://www.freefem.org/ff++/. This program was written and tested with FreeFem++ 3.42 and should work properly with any subsequent version.

2. Download the zip archive at https://github.com/flomnes/optiflow/archive/master.zip or clone this repository
   ```
   git clone https://github.com/flomnes/optiflow.git
   ```
   then navigate to the decompressed directory :
   ```
   cd optiflow-master
   ```
   or
   ```
   cd optiflow
   ```

#### Usage

Seven examples can be found in the file run_case.sh. The general syntax is
```
FreeFem++-nw main.edp [--config numconfig] [--resu resfolder] [numerical parameters]
```

The basic options are:
```
--config	configuration number, from 1 to 5
--resu		folder in which the files and results will be saved, created if non-existent
```
Numerical paramters:
```
--navsto	1=Navier-Stokes, 0=Stokes
--raffinit	required edge size when remeshing : hmax=raffinit, hmin=raffinit/sqrt(2)
--optraff	1=remesh if necessary, 0=no remeshing
--minarea	remesh if any element has an area less than minarea
--binit		initial value for b
--btarget	final value for b : b is no longer updated if b >= btarget
--tau		value of tau, step of the gradient method
--l0		initial value of the Lagrange multiplier
--gamma		value of the regularization parameter
--jjmax		maximal number of outer iterations
--errc		value for the stopping criterion \eps_{stop} on the residual
--beta		0 for perimeter constraint, 1 for volume constraint (default)
--delta		Select the functional : 0 for the dissipated energy, 1 for the least-square profile at the outlet
--cv		Ratio (required constraint value)/(initial constraint value). 1 for an identical initial and required volume or perimeter
--alpha		Update ratio for b : b^{n+1}=alpha*b^n
--save		1=save all figures in the result directory, 0=save nothing at all
--saveevery n	figures will be saved every n iterations
```
#### Notes
1. If gnuplot is installed, you can plot relevant data from a result directory. Simply copy plot.gp from the project root the result directory and execute
   ` gnuplot plot.gp `.
A file called "multi.pdf" will be generated.

2. Crashes may occur for because of mesh self-intersections. You may try to choose a smaller value for `tau`. You can also increase the value of `minarea` so that remeshing will be done earlier.

#### Test-cases 6 & 7
Test-cases 6 and 7 are given as additional material. In test-case 6, a simple pipe is considered. On the left, fixed inlet, and on the right, an outlet allowed to move tangentially. In test-case 7, a double-pipe is considered, with an inlet on the left and two outlets on the right. The closing of one of the outlets entails mesh self-intersections.

#### Authors & contributors
* optiflow has been developped by Florian Omnès (Université Pierre et Marie-Curie), Yannick Privat (Université Pierre et Marie Curie, CNRS), Charles Dapogny (Université Grenobles-Alpes, CNRS) and Pascal Frey (Université Pierre et Marie Curie, Institut du Calcul et des Données)
* Anyone wishing to contribute is welcome to suggest modification through a push request.

#### License
optiflow is licensed under the terms of the LGPL (LICENSE.md)
