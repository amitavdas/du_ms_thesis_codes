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
    font "Times New Roman,14pt"

set encoding iso_8859_1

set output 'vr.V.eps'

# set title "BS Potential Profile For Various LFF for Ti"

#: range
xr_uf = 2
xr_ut = 10

yr_uf = -0.0075
yr_ut = 0.005

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

#: tics
#set format x ""
set xtics 2 nomirror
set mxtics 4
                                                                                                      
set ytics 0.0025 font "Times New Roman,12pt"
set ytics nomirror
set mytics 2

#: line styles

l_w = 2
set style line 11 dt (5,  10)                       lw l_w lc "black"
set style line 12 dt (5,  7, 15, 7)                 lw l_w lc "black"
set style line 13 dt (5,  3, 5, 3, 0, 10)           lw l_w lc "black"
set style line 14 dt (5,  3, 5, 3, 5, 3, 0, 10)     lw l_w lc "black"
set style line 15 dt (5,  3, 5, 7, 15, 7)           lw l_w lc "black"
set style line 16 dt (30, 7, 15, 7, 5, 7)           lw l_w lc "black"
set style line 17 dt (30, 10)                       lw l_w lc "black"
set style line 18 dt (10,  3, 10, 3, 10, 3, 10, 20) lw l_w lc "black"

#: point styles
set style line 21 pt 6 ps 0.5 lw 3 lc "black"
set style line 22 pt 8 ps 0.8 lw 2   lc "black"


set xlabel "{/Times-Italic r} (\305)"          font "Times New Roman,14"
set ylabel "{/Times-Italic u_{eff}(r)} (a.u.)" font "Times New Roman,14"

set multiplot

#set grid
set size square

set margin 8, 0, 3, 3

set key tmargin center offset 5.5, 0.3 horizontal maxrows 2 columns 4 \
           samplen 5 font "Times New Roman,14"

plot  v_vr_data u 1:5  w l ls 14 title "VS",   \
      v_vr_data u 1:3  w l ls 12 title "RT",   \
      v_vr_data u 1:2  w l ls 11 title "IU",   \
      v_vr_data u 1:6  w l ls 15 title "FD",   \
      v_vr_data u 1:4  w l ls 13 title "SK"