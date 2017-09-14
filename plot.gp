set terminal pdfcairo size 10cm, 10cm font "Arial,10"


  set output "multi.pdf"
  set multiplot
  set grid
#  set origin 0,0
  set multiplot layout 2,2 columnsfirst
set xtics 0,100,400
set lmargin 5
set rmargin 5
set tmargin 1
set bmargin 1.5
#Energie dissipée
j0=system("cat J0");	
plot "out.dat" u ($1/j0) w l t "J/J0" lw 4
unset format
#L
  plot "out.dat" u 2 w l t "Aug. Lagrangian"  lw 4

#Volume périmètre
  volc=system("cat voltarget");
  set lmargin 1
plot "out.dat" u 3 w l t "V" lw 4, "out.dat" u (volc+0*$3) w l t "Vtarget"  lw 4

  #
  unset logscale
  plot "out.dat" u 4 w l t "Lagrange multiplier"  lw 4
  unset multiplot

unset multiplot
set logscale y
set grid
plot "out.dat" u 5 w lp