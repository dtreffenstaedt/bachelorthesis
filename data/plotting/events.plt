set term tikz size 15,7
set output "../events.tikz"
set xlabel "time of day"
set timefmt "%s"
set format x "%H:%M"
set xdata time
set ylabel "event numbers"
set key top left
set xtic 1800
set xrange [1626681600:1626696000]
set yrange [1:20000]
set logscale y
plot 'events.csv' using 1:2 with lines title "incoming", 'events.csv' using 1:3 with lines title "coincidences" dt 5
