set term tikz size 15,7
set output "../buffer.tikz"
set xlabel "time of day"
set timefmt "%s"
set format x "%H:%M"
set xdata time
set ylabel "buffer size"
set nokey
set xtic 1800
set xrange [1626681600:1626696000]
set logscale y
plot 'buffer.csv' using 1:2 with lines
