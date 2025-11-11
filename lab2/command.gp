ůreset
set terminal pngcairo size 800,600 enhanced font 'Arial,10'
set output 'myplot.png'

set xlabel "Hmax [A/m]"
set ylabel "Bmax [T]"
set grid

set style line 1 lc rgb "#b16286" lw 2
set key top right box

plot \
    'data.txt' using 1:2 with lines smooth bezier ls 1 notitle, \
    'data.txt' using 1:2:(sprintf("+")) with labels font "Arial,10" tc rgb "black" offset 0,0 notitle
