set term tikz size 15,7
set output "../timeout.tikz"
set xlabel "time of day"
set timefmt "%s"
set format x "%H:%M"
set xdata time
set ylabel "timeout [ms]"
set key left
set xtic 1800
set xrange [1626681600:1626696000]
set logscale y
plot 'timeout.csv' using 1:2 with lines title "timeout" dt 5, 'timeout.csv' using 1:3 with lines title "timebase"
