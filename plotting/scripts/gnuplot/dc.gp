dc_data    = '../data/miscellaneous/dc.dat'

set terminal eps enhanced background rgb 'white' \
    size 3.3, 3                                  \
    font "Times New Roman,12pt"

set encoding iso_8859_1

set output 'dc.eps'

# set title "BS Potential Profile For Various LFF for Ti"

#: range
set xr [0 to  9]
set yr [1 to 13]

#: tics
set xtics 3 nomirror
set mxtics 3

set ytics 2 font "Times New Roman,12pt"
set ytics nomirror
set mytics 2

#: line styles

#: colors

#4878d0
#ee854a
#6acc64
#d65f5f
#956cb4
#8c613c
#dc7ec0
#797979
#d5bb67
#82c6e2

set style line 11 pt 2  dt '.'   lw 5 lc "#82c6e2"
set style line 12 pt 4  dt '_'   lw 5 lc "#ee854a"
set style line 13 pt 6  dt '.._' lw 5 lc "#6acc64"
set style line 14 pt 8  dt '._.' lw 5 lc "#1f77b4"
set style line 15 pt 10 dt '_._' lw 5 lc "#956cb4"

set style line 16 pt 12 dt 7 lw 5 lc "#8c613c"
set style line 17 pt 14 dt 9 lw 5 lc "#dc7ec0"

set style line 21 pt 16 ps 1    lw 4  lc "red"
set style line 22 pt 90 ps 0.25 lw 12 lc "blue"
set style line 23 pt 13 ps 0.25 lw 12 lc "#000080"

#: legends
#set key horizontal maxcols 3

#: labels
set ylabel "Diffusion Coefficient, {/Times-Italic D} ({{10}^{-5}}{cm}^{2}/s)" font "Times New Roman,14"
set xlabel "Metals" font "Times New Roman,14"

set xtics ("Ti" 1, "V" 2, "Cr" 3, "Mn" 4, "Fe" 5, "Co" 6, "Ni" 7, "Cu" 8)

plot dc_data u 2:3  w lp ls 11 title "VS",         \
     dc_data u 2:5  w lp ls 12 title "RT",         \
     dc_data u 2:7  w lp ls 13 title "IU",         \
     dc_data u 2:9  w lp ls 14 title "FD",         \
     dc_data u 2:11 w lp ls 15 title "SK",         \
     dc_data u 2:16 w lp ls 17 title "Theo.",      \
     dc_data u 2:13 w lp ls 16 title "Sim.",       \
     dc_data u 2:18 w  p ls 21 title "Ref. Sim.",  \
     dc_data u 2:19 w  p ls 22 title "Ref. Sim.",  \
     dc_data u 2:17 w  p ls 23 title "Exp.",       \
