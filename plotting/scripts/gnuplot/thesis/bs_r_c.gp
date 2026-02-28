bs_r_c_data = '../../data/miscellaneous/bs_r_c.dat'

set terminal eps enhanced background rgb 'white' \
    size 4, 4                                    \
    font "Times New Roman,12pt"

set encoding iso_8859_1

set output 'bs.rc.eps'

# set title "BS Potential Profile For Various LFF for Ti"

#: range
xr_uf = 1.5
xr_ut = 5.15

yr_uf = -0.08
yr_ut = 0.12

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

#: tics
#set format x ""
set xtics 0.5, 0.73 font "Times New Roman,12pt"
set xtics nomirror
set mxtics 2

set ytics -0.12, 0.04 font "Times New Roman,12pt"
set ytics nomirror
set mytics 2

#: line styles

l_w = 5
set style line 11 dt (5,  10)                       lw l_w lc "black"
set style line 12 dt (5,  7, 15, 7) 		    lw l_w lc "black"
set style line 13 dt (5,  3, 5, 3, 0, 10)           lw l_w lc "black"
set style line 14 dt (5,  3, 5, 3, 5, 3, 0, 10)     lw l_w lc "black"
set style line 15 dt (5,  3, 5, 7, 15, 7)           lw l_w lc "black"
set style line 16 dt (30, 7, 15, 7, 5, 7)           lw l_w lc "black"
set style line 17 dt (30, 10)                       lw l_w lc "black"
set style line 18 dt (10,  3, 10, 3, 10, 3, 10, 20) lw l_w lc "black"

set xlabel "{/Times-Italic r} (\305)"          font "Times New Roman,14"
set ylabel "{/Times-Italic u}_{eff}(r) (a.u.)" font "Times New Roman,14"

set multiplot

set grid
set size square

set tmargin 3

set key tmargin center offset 0, -0.3 horizontal maxrows 1 columns 3 \
           samplen 5 font "Times New Roman,14"

plot bs_r_c_data u 1:2  w l ls 11 title "R_c = 0.92",   \
              '' u 3:4  w l ls 12 title "R_c = 0.87",   \
              '' u 5:6  w l ls 13 title "R_c = 0.82"

unset key

plot 0 w l lw 1 lc "black"