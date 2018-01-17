set terminal pdfcairo size 20cm, 15cm
  set output "multi.pdf"
  set multiplot
  set grid
#  set origin 0,0
  set multiplot layout 2,2 columnsfirst

#Energie dissipée
j0=system("cat J0");	
plot "out.dat" u ($1/j0) w l t "J/J0" lw 3
unset format
#L
  plot "out.dat" u 2 w l t "Augmented Lagrangian"  lw 3

#Volume périmètre
  volc=system("cat voltarget");
plot "out.dat" u 3 w l t "V" lw 3, "out.dat" u (volc+0*$3) w l t "Vtarget"  lw 3

  #
  unset logscale
  plot "out.dat" u 4 w l t "Lagrange multiplier"  lw 3
  unset multiplot

unset multiplot
set logscale y
set grid
plot "out.dat" u 5 w lp