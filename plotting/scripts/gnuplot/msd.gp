ti_msd_data = '../data/[01][Ti]/msd.dat'
 v_msd_data = '../data/[02][V]/msd.dat'
cr_msd_data = '../data/[03][Cr]/msd.dat'
mn_msd_data = '../data/[04][Mn]/msd.dat'
fe_msd_data = '../data/[05][Fe]/msd.dat'
co_msd_data = '../data/[06][Co]/msd.dat'
ni_msd_data = '../data/[07][Ni]/msd.dat'
cu_msd_data = '../data/[08][Cu]/msd.dat'

#set terminal eps enhanced background rgb 'white' size 2.1, 2.1 font 'Times New Roman,10pt'
set terminal eps enhanced background rgb 'white' \
    size 3.346, 2.509                            \
    font "Times New Roman,12pt"

set encoding iso_8859_1

set output 'msd.eps'

# set title "BS Potential Profile For Various LFF for Ti"

#: range
#set xr [2 to 6]
#set yr [-0.0035 to 0.005]

#: multiplot
set multiplot

#: tics
#set format x ""
set xtics 200 nomirror
set mxtics 4

set ytics 500 nomirror
set mytics 4

#: line styles
set palette model RGB file seaborn_palette

set style line 11 dt (5 ,  5) pt 1  lw 2 lc "#4878d0"
set style line 12 dt (10 , 5) pt 4  lw 2 lc "#ee854a"
set style line 13 dt (15 , 5) pt 6  lw 2 lc "#6acc64"
set style line 14 dt (20,  5) pt 8  lw 2 lc "#d65f5f"
set style line 15 dt (5 , 5 ) pt 10 lw 2 lc "#956cb4"
set style line 16 dt (5 , 10) pt 2  lw 2 lc "#8c613c"
set style line 17 dt (5 , 15) pt 14 lw 2 lc "#dc7ec0"
set style line 18 dt (5 , 20) pt 12 lw 2 lc "#797979"
                        
set key left offset 3, 0

set xlabel "time, {/Times-Italic t} (ps)" font "Times New Roman,14"
set ylabel "Mean Squared Displacement ({\305}^{2})" font "Times New Roman,14"


plot ti_msd_data u 1:2 every 10 w lp ls 11 title "Ti",   \
      v_msd_data u 1:2 every 10 w lp ls 12 title "V",    \
     cr_msd_data u 1:2 every 10 w lp ls 13 title "Cr",   \
     mn_msd_data u 1:2 every 10 w lp ls 14 title "Mn",   \
     fe_msd_data u 1:2 every 10 w lp ls 15 title "Fe",   \
     co_msd_data u 1:2 every 10 w lp ls 16 title "Co",   \
     ni_msd_data u 1:2 every 10 w lp ls 17 title "Ni",   \
     cu_msd_data u 1:2 every 10 w lp ls 18 title "Cu",
