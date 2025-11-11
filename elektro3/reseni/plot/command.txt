reset
set terminal pngcairo size 1300, 1100 enhanced font 'Arial,15'
set output 'myplot-log.png'

set xlabel "U{CE}"
set ylabel "Ic"
set grid

set style line 1 lc rgb "#0055cc" lw 1
set style line 2 lc rgb "#009900" lw 1
set style line 3 lc rgb "#d79921" lw 1
set style line 4 lc rgb "#458588" lw 1
set style line 5 lc rgb "#cc0000" lw 1 dt 3   # dashed

set key top left box

#  quadratic function

#
#f1(x) = a1*x**3 + b1*x + c1
#f2(x) = a2*x**3 + b2*x + c2
#f3(x) = a1*x**3 + b3*x + c3
#f4(x) = a1*x**3 + b4*x + c4
#

#log

c1 = 500
f1(x) = a1*log(x * c1) + b1
f2(x) = a2*log(x * c1) + b2
f3(x) = a3*log(x * c1) + b3
f4(x) = a4*log(x * c1) + b4


# Fit each block separately
fit f1(x) 'data.txt' index 0 using 1:2 via a1,b1
fit f2(x) 'data.txt' index 1 using 1:2 via a2,b2
fit f3(x) 'data.txt' index 2 using 1:2 via a3,b3
fit f4(x) 'data.txt' index 3 using 1:2 via a4,b4

# Plot both datasets and their fits
plot \
    'data.txt' index 0 using 1:2:(sprintf("+")) with labels font "Arial,15" tc rgb "black" offset 0,0 notitle , \
    f1(x) with lines ls 1 title "50kΩ", \
    'data.txt' index 1 using 1:2:(sprintf("+")) with labels font "Arial,15" tc rgb "black" offset 0,0 notitle, \
    f2(x) with lines ls 2 title "60kΩ", \
    'data.txt' index 2 using 1:2:(sprintf("+")) with labels font "Arial,15" tc rgb "black" offset 0,0 notitle , \
    f3(x) with lines ls 3 title "70kΩ", \
    'data.txt' index 3 using 1:2:(sprintf("+")) with labels font "Arial,15" tc rgb "black" offset 0,0 notitle , \
    f4(x) with lines ls 4 title "80kΩ"

unset output
