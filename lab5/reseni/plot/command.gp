reset
set terminal pngcairo size 1300, 1100 enhanced font 'Arial,15'
set output 'myplot^2.png'

set xlabel "Zreal [Ω]"
reset

set ylabel "Zim [Ω]"
set grid
set title "Impedanční charakteristika"

set style line 1 lc rgb "#0055cc" lw 1
set style line 2 lc rgb "#009900" lw 1
set style line 3 lc rgb "#d79921" lw 1
set style line 4 lc rgb "#458588" lw 1
set style line 5 lc rgb "#cc0000" lw 1 dt 3   # dashed

set key top center box

#  quadratic function

x0 = 343.285  # choose a scale near the middle of your x-range
n = 2

#f1(x) = a1 * (x/x0)**2 + b1*(x/x0) + c1
#f2(x) = a2 * (x/x0)**2 + b2*(x/x0) + c2
#
#f1(x)=a1*sqrt(b1-(x/x0)**2)
#f2(x)=a2*sqrt(b2-(x/x0)**2)
f1(x) = a1*(x/x0)**n+b1*(x/x0)**(n-1)+c1*(x/x0)**(n-2)+d1*(x/x0)+e1
f2(x) = a2*(x/x0)**n+b2*(x/x0)**(n-1)+c2*(x/x0)**(n-2)+d2*(x/x0)+e2



#log

#f1(x) = a1*log(x) + b1
#f2(x) = a2*log(x) + b2

   # Fit each block separately
   fit f1(x) 'data.txt' index 0 using 1:2 via a1,b1, c1, d1, e1
   fit f2(x) 'data.txt' index 1 using 1:2 via a2,b2, c2, d2, e2

   # Plot both datasets and their fits
   plot \
       'data.txt' index 0 using 1:2:(sprintf("+")) with labels font "Arial,15" tc rgb "black" offset 0,0 notitle , \
       f1(x) with lines ls 1 title "Výpočet", \
       'data.txt' index 1 using 1:2:(sprintf("+")) with labels font "Arial,15" tc rgb "black" offset 0,0 notitle, \
       f2(x) with lines ls 2 title "Teoretické hodnoty", \
       'data.txt' index 2 using 1:2:(sprintf("+")) with labels font "Arial,15" tc rgb "black" offset 0,0 notitle ,\
       'data.txt' index 2 using 1:2 with lines ls 5 title "průsečík"
#
#  plot \
#      'data.txt' index 0 using 1:2:(sprintf("+")) with labels font "Arial,15" tc rgb "black" offset 0,0 notitle, \
#      'data.txt' index 0 using 1:2 smooth bezier ls 1 title "Výpočet", \
#      \
#      'data.txt' index 1 using 1:2:(sprintf("+")) with labels font "Arial,15" tc rgb "black" offset 0,0 notitle, \
#      'data.txt' index 1 using 1:2 smooth bezier ls 2 title "Teoretické hodnoty", \
#      \
#      'data.txt' index 2 using 1:2:(sprintf("+")) with labels font "Arial,15" tc rgb "black" offset 0,0 notitle, \
#      'data.txt' index 2 using 1:2 smooth bezier ls 5 title "průsečík"


#  plot \
#      'data.txt' index 0 using 1:2:(sprintf("+")) with labels font "Arial,15" tc rgb "black" offset 0,0 notitle, \
#      'data.txt' index 0 using 1:2 smooth csplines ls 1 title "Výpočet", \
#      \
#      'data.txt' index 1 using 1:2:(sprintf("+")) with labels font "Arial,15" tc rgb "black" offset 0,0 notitle, \
#      'data.txt' index 1 using 1:2 smooth csplines ls 2 title "Teoretické hodnoty", \
#      \
#      'data.txt' index 2 using 1:2:(sprintf("+")) with labels font "Arial,15" tc rgb "black" offset 0,0 notitle, \
#      'data.txt' index 2 using 1:2 smooth csplines ls 5 title "průsečík"
#

unset output
