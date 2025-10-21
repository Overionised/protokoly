reset
set terminal pngcairo size 800,600 enhanced font 'Arial,12'
set output 'myplot.png'

set xlabel "Ud [V]"
set ylabel "Id [mA]"
set grid

# Define styles
set style line 1 lc rgb "#0055cc" lw 2  # Ud1
set style line 2 lc rgb "#009900" lw 2  # Ud2
set style line 3 lc rgb "#d79921" lw 2  # Ud3
set style line 4 lc rgb "#458588" lw 2  # Ud4
set style line 5 lc rgb "#cc0000" lw 1 dt 3   # UTO (red dashed)

# Labels for threshold voltages (place before plot)
set label "U_{T01}" at 0.72, -1 tc rgb "#cc0000" font ",8"
set label "U_{T02}" at 2.15, -1 tc rgb "#cc0000" font ",8"
set label "U_{T03}" at 2.13, -1 offset 1,1 tc rgb "#cc0000" font ",8"
set label "U_{T04}" at 2.02, -1  tc rgb "#cc0000" font ",8"

# Plot curves and UTO lines
plot 'data.txt' index 0 using 1:2 smooth unique with lines ls 1 title "Ud1 (V)", \
     'data.txt' index 1 using 1:2 smooth unique with lines ls 2 title "Ud2 (V)", \
     'data.txt' index 2 using 1:2 smooth unique with lines ls 3 title "Ud3 (V)", \
     'data.txt' index 3 using 1:2 smooth unique with lines ls 4 title "Ud4 (V)", \
     'data.txt' index 4 using 1:2 with lines ls 5 notitle, \
     'data.txt' index 5 using 1:2 with lines ls 5 notitle, \
     'data.txt' index 6 using 1:2 with lines ls 5 notitle, \
     'data.txt' index 7 using 1:2 with lines ls 5 notitle

