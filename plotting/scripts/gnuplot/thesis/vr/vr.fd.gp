ti_vr_data = '../../data/[01][Ti]/vr.dat'
 v_vr_data = '../../data/[02][V]/vr.dat'
cr_vr_data = '../../data/[03][Cr]/vr.dat'
mn_vr_data = '../../data/[04][Mn]/vr.dat'
fe_vr_data = '../../data/[05][Fe]/vr.dat'
co_vr_data = '../../data/[06][Co]/vr.dat'
ni_vr_data = '../../data/[07][Ni]/vr.dat'
cu_vr_data = '../../data/[08][Cu]/vr.dat'

set terminal eps enhanced background rgb 'white' \
    size 3, 3                                    \
    font "Times New Roman,12pt"

set encoding iso_8859_1

set output 'vr.FD.eps'

# set title "BS Potential Profile For Various LFF for Ti"

#: range
xr_uf = 2
xr_ut = 6

yr_uf = -0.0075
yr_ut = 0.0025

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

#: tics
#set format x ""
set xtics 1 nomirror
set mxtics 4

set ytics 0.0025 font "Times New Roman,12pt"
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
set ylabel "{/Times-Italic u_{eff}(r)} (a.u.)" font "Times New Roman,14"

set multiplot

set grid
set size square

set tmargin 3

set key tmargin center offset 0, 0.3 horizontal maxrows 2 columns 4 \
           samplen 5 font "Times New Roman,14"

plot ti_vr_data u 1:6  w l ls 11 title "Ti",   \
      v_vr_data u 1:6  w l ls 12 title " V",   \
     cr_vr_data u 1:6  w l ls 13 title "Cr",   \
     mn_vr_data u 1:6  w l ls 14 title "Mn",   \
     fe_vr_data u 1:6  w l ls 15 title "Fe",   \
     co_vr_data u 1:6  w l ls 16 title "Co",   \
     ni_vr_data u 1:6  w l ls 17 title "Ni",   \
     cu_vr_data u 1:6  w l ls 18 title "Cu"

unset key

set origin 0.48, 0.135
set size 0.52, 0.52

set xr [2.4 to 3.3]
set yr [-0.0071  to -0.0045]

unset xlabel
unset ylabel

unset xtics
unset ytics

plot ti_vr_data u 1:6  w l ls 11 title "Ti",   \
      v_vr_data u 1:6  w l ls 12 title " V",   \
     cr_vr_data u 1:6  w l ls 13 title "Cr",   \
     mn_vr_data u 1:6  w l ls 14 title "Mn",   \
     fe_vr_data u 1:6  w l ls 15 title "Fe",   \
     co_vr_data u 1:6  w l ls 16 title "Co",   \
     ni_vr_data u 1:6  w l ls 17 title "Ni",   \
     cu_vr_data u 1:6  w l ls 18 title "Cu"
