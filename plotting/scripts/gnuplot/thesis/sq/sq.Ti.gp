ti_sq_data = '../../data/[01][Ti]/sq.dat'
 v_sq_data = '../../data/[02][V]/sq.dat'
cr_sq_data = '../../data/[03][Cr]/sq.dat'
mn_sq_data = '../../data/[04][Mn]/sq.dat'
fe_sq_data = '../../data/[05][Fe]/sq.dat'
co_sq_data = '../../data/[06][Co]/sq.dat'
ni_sq_data = '../../data/[07][Ni]/sq.dat'
cu_sq_data = '../../data/[08][Cu]/sq.dat'

ti_sq_exp_data = '../../data/exp/3d_transition_sq/Ti_sq_Waseda1975.dat'
 v_sq_exp_data = '../../data/exp/3d_transition_sq/V_sq_Waseda1975.dat'
cr_sq_exp_data = '../../data/exp/3d_transition_sq/Cr_sq_Waseda1975.dat'
mn_sq_exp_data = '../../data/exp/3d_transition_sq/Mn_sq_Waseda1975.dat'
fe_sq_exp_data = '../../data/exp/3d_transition_sq/Fe_sq_Waseda1975.dat'
co_sq_exp_data = '../../data/exp/3d_transition_sq/Co_sq_Waseda1975.dat'
ni_sq_exp_data = '../../data/exp/3d_transition_sq/Ni_sq_Waseda1975.dat'
cu_sq_exp_data = '../../data/exp/3d_transition_sq/Cu_sq_Waseda1975.dat'


set terminal eps enhanced background rgb 'white' \
    size 3, 3                                    \
    font "Times New Roman,14pt"

set encoding iso_8859_1

set output 'sq.Ti.eps'

# set title "BS Potential Profile For Various LFF for Ti"

#: range
xr_uf = 1
xr_ut = 10

yr_uf = 0
yr_ut = 5.1

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

#: tics
#set format x ""
set xtics 2 nomirror
#set mxtics 1

set ytics 1
set ytics nomirror
#set mytics 0

#: line styles

l_w = 1
set style line 1  dt (1,  0)                        lw   2 lc "black"

set style line 11 dt (5,  10)                       lw l_w lc "black"
set style line 12 dt (5,  7, 15, 7) 		    lw l_w lc "black"
set style line 13 dt (5,  3, 5, 3, 0, 10)           lw l_w lc "black"
set style line 14 dt (5,  3, 5, 3, 5, 3, 0, 10)     lw l_w lc "black"
set style line 15 dt (5,  3, 5, 7, 15, 7)           lw l_w lc "black"
set style line 16 dt (30, 7, 15, 7, 5, 7)           lw l_w lc "black"
set style line 17 dt (30, 10)                       lw l_w lc "black"
set style line 18 dt (10,  3, 10, 3, 10, 3, 10, 20) lw l_w lc "black"

#: point styles
set style line 21 pt 6 ps 0.5 lw 3 lc "black"
set style line 22 pt 8 ps 0.8 lw 2   lc "black"

set xlabel "{/times-italic q} ({\305}^{-1})" offset 0, 0.25 font "Times New Roman, 14pt"
set ylabel "{/times-italic s(q)}" offset 0.5, 0 font "Times New Roman, 14pt"

set multiplot

#set grid
set size square

set margin 0, 0, 3, 3

set key tmargin center offset 0, 0.3 horizontal maxrows 2 columns 4 \
           samplen 5 font "Times New Roman,14"

plot ti_sq_data     u 1:2  w l ls 11 title "IU",   \
     ti_sq_data     u 1:3  w l ls 12 title "RT",   \
     ti_sq_data     u 1:4  w l ls 13 title "SK",   \
     ti_sq_data     u 1:5  w l ls 14 title "VS",   \
     ti_sq_data     u 1:6  w l ls 15 title "FD",   \
     ti_sq_data     u 7:8  w p ls 21 title "Sim.", \
     ti_sq_exp_data u 1:2 every 4 w p ls 22 title "Exp.", \

unset key

set origin 0.249, 0.25
set size 0.72, 0.72

set xr [2.3 to 3]
set yr [1.3  to 5.05]

unset xlabel
unset ylabel

unset xtics
unset ytics

plot ti_sq_data     u 1:2  w l ls 11 title "IU",   \
     ti_sq_data     u 1:3  w l ls 12 title "RT",   \
     ti_sq_data     u 1:4  w l ls 13 title "SK",   \
     ti_sq_data     u 1:5  w l ls 14 title "VS",   \
     ti_sq_data     u 1:6  w l ls 15 title "FD",   \
     ti_sq_data     u 7:8  w p ls 21 title "Sim.", \
     ti_sq_exp_data u 1:2 every 4 w p ls 22 title "Exp.", \