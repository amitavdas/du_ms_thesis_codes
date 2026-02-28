ti_gr_data = '../../data/[01][Ti]/gr.dat'
 v_gr_data = '../../data/[02][V]/gr.dat'
cr_gr_data = '../../data/[03][Cr]/gr.dat'
mn_gr_data = '../../data/[04][Mn]/gr.dat'
fe_gr_data = '../../data/[05][Fe]/gr.dat'
co_gr_data = '../../data/[06][Co]/gr.dat'
ni_gr_data = '../../data/[07][Ni]/gr.dat'
cu_gr_data = '../../data/[08][Cu]/gr.dat'

e1_gr_data = '../../data/exp/Cu_Fe_Co_Ni.dat'
e2_gr_data = '../../data/exp/Ti_V_Cr_Mn.dat'
Cu_geysermans1998 = '../../data/exp/Cu.N-body.sim.gr.dat'

set terminal eps enhanced background rgb 'white' \
    size 3, 3                                    \
    font "Times New Roman,14pt"

set encoding iso_8859_1

set output 'gr.Cu.eps'

# set title "BS Potential Profile For Various LFF for Ti"

#: range
xr_uf = 2
xr_ut = 10

yr_uf = 0
yr_ut = 4.2

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
set style line 21 pt 6  ps 0.5 lw 3 lc "black"
set style line 22 pt 8  ps 0.8 lw 2 lc "black"
set style line 23 pt 12 ps 0.8 lw 2 lc "black"

set xlabel "{/times-italic r} (\305)" offset 0, 0.25 font "Times New Roman, 14pt"
set ylabel "{/times-italic g(r)}" offset 0.5, 0 font "Times New Roman, 14pt"

set multiplot

#set grid
set size square

set margin 0, 0, 3, 3

set key tmargin center offset 0, 0.3 horizontal maxrows 2 columns 4 \
           samplen 5 font "Times New Roman,14"

plot        cu_gr_data u 1:2         w l ls 11 title "IU",   \
            cu_gr_data u 1:3         w l ls 12 title "RT",   \
            cu_gr_data u 1:4         w l ls 13 title "SK",   \
            cu_gr_data u 1:5         w l ls 1  title "VS",   \
            cu_gr_data u 1:6         w l ls 17 title "FD",   \
            cu_gr_data u 7:8         w p ls 21 title "Sim.", \
            e1_gr_data u 1:2         w p ls 22 title "Exp.", \
     Cu_geysermans1998 u 1:2 every 5 w p ls 23 title "GS"   

unset key

set origin 0.249, 0.25
set size 0.72, 0.72

set xr [2.3 to 2.85]
set yr [1.3  to 4.2]

unset xlabel
unset ylabel

unset xtics
unset ytics

plot        cu_gr_data u 1:2         w l ls 11 title "IU",   \
            cu_gr_data u 1:3         w l ls 12 title "RT",   \
            cu_gr_data u 1:4         w l ls 13 title "SK",   \
            cu_gr_data u 1:5         w l ls 1  title "VS",   \
            cu_gr_data u 1:6         w l ls 17 title "FD",   \
            cu_gr_data u 7:8         w p ls 21 title "Sim.", \
            e1_gr_data u 1:2         w p ls 22 title "Exp.", \
     Cu_geysermans1998 u 1:2 every 5 w p ls 23 title "GS"   