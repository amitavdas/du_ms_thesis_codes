ti_vq_data = '../../data/[01][Ti]/vq.dat'
 v_vq_data = '../../data/[02][V]/vq.dat'
cr_vq_data = '../../data/[03][Cr]/vq.dat'
mn_vq_data = '../../data/[04][Mn]/vq.dat'
fe_vq_data = '../../data/[05][Fe]/vq.dat'
co_vq_data = '../../data/[06][Co]/vq.dat'
ni_vq_data = '../../data/[07][Ni]/vq.dat'
cu_vq_data = '../../data/[08][Cu]/vq.dat' 

set terminal eps enhanced background rgb 'white' \
    size 2.5, 2.5                                \
    font "Times New Roman,14pt"

set encoding iso_8859_1

set output 'vq.Fe.color.eps'

# set title "BS Potential Profile For Various LFF for Ti"

#: range
xr_uf = 0
xr_ut = 30
 
yr_uf = 0.0
yr_ut = 0.15

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

#: tics
set xtics 7 nomirror
set mxtics 4
                                                                                                      
set ytics 0.025 font "Times New Roman,12pt"
set ytics nomirror
set mytics 2

#: line styles

l_w = 4
set style line 11 dt 1 lw l_w lc "#82c6e2"
set style line 12 dt 1 lw l_w lc "#ee854a"
set style line 13 dt 1 lw l_w lc "#6acc64"
set style line 14 dt 1 lw l_w lc "#1f77b4"
set style line 15 dt 1 lw l_w lc "#956cb4"
set style line 16 dt 1 lw l_w lc "#797979"
set style line 17 dt 1 lw l_w lc "#d5bb67"
set style line 18 dt 1 lw l_w lc "#000080"

#: point styles
set style line 21 pt 6 ps 0.5 lw 3 lc "black"
set style line 22 pt 8 ps 0.8 lw 2   lc "black"


set xlabel "{/Times-Italic q} ({\305}^{-1})"   font "Times New Roman,14"
set ylabel "{/Times-Italic u(q)}"              font "Times New Roman,14"

set multiplot

#set grid
set size square

set margin 8, 0, 3, 3

#set key tmargin center offset 5.5, 0.3 horizontal maxrows 2 columns 4 \
#           samplen 5 font "Times New Roman,14"
unset key

plot fe_vq_data u 1:5  w l ls 14 title "VS",   \
     fe_vq_data u 1:3  w l ls 12 title "RT",   \
     fe_vq_data u 1:2  w l ls 11 title "IU",   \
     fe_vq_data u 1:6  w l ls 15 title "FD",   \
     fe_vq_data u 1:4  w l ls 13 title "SK",  \
                   
unset key
     
set origin 0.249, 0.25
set size 0.72, 0.72
     
set xr [3.27 to 5.25]
set yr [0.0645  to 0.0710]
     
unset xlabel
unset ylabel
     
unset xtics
unset ytics

plot fe_vq_data u 1:5  w l ls 14 title "VS",   \
     fe_vq_data u 1:3  w l ls 12 title "RT",   \
     fe_vq_data u 1:2  w l ls 11 title "IU",   \
     fe_vq_data u 1:6  w l ls 15 title "FD",   \
     fe_vq_data u 1:4  w l ls 13 title "SK",  \
                   
