dc_data    = '../data/miscellaneous/dc.dat'

set terminal eps enhanced background rgb 'white' \
    size 4, 3                                    \
    font "Times New Roman,12pt"

set encoding iso_8859_1

set output 'dc.eps'

# set title "BS Potential Profile For Various LFF for Ti"

#: range
set xr [0 to  9]

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

set style line 11 pt 1 dt '.'   lw 2 lc "#4878d0"
set style line 12 pt 2 dt '_'   lw 2 lc "#ee854a"
set style line 13 pt 3 dt '.._' lw 2 lc "#6acc64"
set style line 14 pt 4 dt '._.' lw 2 lc "#d65f5f"
set style line 15 pt 5 dt '_._' lw 2 lc "#956cb4"

set style line 16 pt 6 dt 7 lw 2 lc "#8c613c"
set style line 17 pt 7 dt 9 lw 2 lc "#dc7ec0"


set style line 31 pt 1 dt '..__'   lw 2 lc "#4878d0"
set style line 32 pt 2 dt '...___' lw 2 lc "#ee854a"
set style line 33 pt 3 dt '._.._'  lw 2 lc "#6acc64"
set style line 34 pt 4 dt '..__.'  lw 2 lc "#d65f5f"
set style line 35 pt 5 dt '.___.'  lw 2 lc "#956cb4"

set style line 21 pt 25 ps 0.25 lw 12 lc "#797979"
set style line 22 pt 90 ps 0.25 lw 12 lc "#d5bb67"
set style line 23 pt 13 ps 0.25 lw 12 lc "#82c6e2"

#: legends
#set key horizontal maxcols 3

#: labels
set ylabel "Diffusion Coefficient, {/Times-Italic D} ({{10}^{-5}}{cm}^{2}/s)" font "Times New Roman,14"
set xlabel "Metals" font "Times New Roman,14"

set xtics ("Ti" 1, "V" 2, "Cr" 3, "Mn" 4, "Fe" 5, "Co" 6, "Ni" 7, "Cu" 8)

#plot dc_data u 2:3  w lp ls 11 title "VS",         \
#     dc_data u 2:5  w lp ls 12 title "RT",         \
#     dc_data u 2:7  w lp ls 13 title "IU",         \
#     dc_data u 2:9  w lp ls 14 title "FD",         \
#     dc_data u 2:11 w lp ls 15 title "SK",         \
#     dc_data u 2:4  w lp ls 31 title "VS-CS",      \
#     dc_data u 2:6  w lp ls 32 title "RT-CS",      \
#     dc_data u 2:8  w lp ls 33 title "IU-CS",      \
#     dc_data u 2:10 w lp ls 34 title "FD-CS",      \
#     dc_data u 2:12 w lp ls 35 title "SK-CS",      \
#     dc_data u 2:16 w lp ls 17 title "Theo.",      \
#     dc_data u 2:13 w lp ls 16 title "Sim.",       \
#     dc_data u 2:18 w  p ls 21 title "Ref. Sim.",  \
#     dc_data u 2:19 w  p ls 22 title "Ref. Sim.",  \
#     dc_data u 2:17 w  p ls 23 title "Exp.",       \


plot dc_data u 2:4  w lp ls 31 title "VS-CS",      \
     dc_data u 2:6  w lp ls 32 title "RT-CS",      \
     dc_data u 2:8  w lp ls 33 title "IU-CS",      \
     dc_data u 2:10 w lp ls 34 title "FD-CS",      \
     dc_data u 2:12 w lp ls 35 title "SK-CS",      \
     dc_data u 2:16 w lp ls 17 title "Theo.",      \
     dc_data u 2:13 w lp ls 16 title "Sim.",       \
     dc_data u 2:18 w  p ls 21 title "Ref. Sim.",  \
     dc_data u 2:19 w  p ls 22 title "Ref. Sim.",  \
     dc_data u 2:17 w  p ls 23 title "Exp.",       \