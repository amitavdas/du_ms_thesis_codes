ti_vq_data = '../data/[01][Ti]/vq.dat'
 v_vq_data = '../data/[02][V]/vq.dat'
cr_vq_data = '../data/[03][Cr]/vq.dat'
mn_vq_data = '../data/[04][Mn]/vq.dat'
fe_vq_data = '../data/[05][Fe]/vq.dat'
co_vq_data = '../data/[06][Co]/vq.dat'
ni_vq_data = '../data/[07][Ni]/vq.dat'
cu_vq_data = '../data/[08][Cu]/vq.dat'

#set terminal eps enhanced background rgb 'white' size 2.1, 2.1 font 'Times New Roman,10pt'
set terminal eps enhanced background rgb 'white' \
    size 6, 3                                    \
    font "Times New Roman,12pt"

set encoding iso_8859_1

set output 'vq.eps'

# set title "BS Potential Profile For Various LFF for Ti"

#: range
xr_uf = 0
xr_ut = 30

yr_uf = 0.0
yr_ut = 0.15

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

#: multiplot
set multiplot

#: tics
set format x ""
set xtics 7 nomirror
set mxtics 4

set ytics 0.025 font "Times New Roman,12pt"
set ytics nomirror
set mytics 2

#: line styles

l_w = 3

set style line 11 dt 3 lw l_w lc "#4878d0"
set style line 12 dt 2 lw l_w lc "#ee854a"
set style line 13 dt 1 lw l_w lc "#6acc64"
set style line 14 dt 4 lw l_w lc "#d65f5f"
set style line 15 dt 5 lw l_w lc "#956cb4"

#: margin
#: l r b t
set margins 1, 0, 0, 0

#: x y
dx = 0.225 
dy = 0.488

s_dx = 0.22
s_dy = 0.4

s_z_dx = 0.15
s_z_dy = 0.2


#: offsets
dx_o = 0.09
dy_o = 0.07

dx_zo = 0.055
dy_zo = 0.17

#: dy offset for bottom plots
dy_o_b = 0.13


#: legends
set key at screen 0.8645, 1.0115 horizontal columns 6

#: labels
unset ylabel
unset xlabel

label_x = 0.85
label_y = 0.15

set origin 0 + dx_o, dy * 1 + dy_o
set size s_dx, s_dy

set label 98 "{/Times-Italic q} ({\305}^{-1})" right at graph 2.23, -1.30 font "Times New Roman,14"
set label 99 "{/Times-Italic u(q)}"     right at graph -0.37, 0.095 rotate by 90 font "Times New Roman,14"

set label 1 'Ti' at graph label_x, label_y font "Times New Roman,12"

set xtics nomirror
set ytics nomirror

plot ti_vq_data u 1:5  w l ls 14 title "VS",   \
     ti_vq_data u 1:3  w l ls 12 title "RT",   \
     ti_vq_data u 1:2  w l ls 11 title "IU",   \
     ti_vq_data u 1:6  w l ls 15 title "FD",   \
     ti_vq_data u 1:4  w l ls 13 title "SK",  \

unset key # right bottom

unset label 98
unset label 99

set origin 0 + dx_o + dx_zo, dy * 1 + dy_o + dy_zo
set size s_z_dx, s_z_dy

set xr [2.5 to 4.5 ]
set yr [0.064 to 0.075]

unset label 1

unset xtics
unset ytics

plot ti_vq_data u 1:5  w l ls 14 title "VS",   \
     ti_vq_data u 1:3  w l ls 12 title "RT",   \
     ti_vq_data u 1:2  w l ls 11 title "IU",   \
     ti_vq_data u 1:6  w l ls 15 title "FD",   \
     ti_vq_data u 1:4  w l ls 13 title "SK",  \

set origin dx * 1 + dx_o, dy * 1 + dy_o
set size s_dx, s_dy

set label 2 'V' at graph label_x, label_y font "Times New Roman,12"

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

set format y ""

set xtics nomirror
set ytics nomirror

plot  v_vq_data u 1:5  w l ls 14 title "VS",   \
      v_vq_data u 1:3  w l ls 12 title "RT",   \
      v_vq_data u 1:2  w l ls 11 title "IU",   \
      v_vq_data u 1:6  w l ls 15 title "FD",   \
      v_vq_data u 1:4  w l ls 13 title "SK"

set origin dx * 1 + dx_o + dx_zo, dy * 1 + dy_o + dy_zo
set size s_z_dx, s_z_dy

set xr [2.85 to 4.45 ]
set yr [0.0745 to 0.082]

unset label 2

unset xtics
unset ytics

plot  v_vq_data u 1:5  w l ls 14 title "VS",   \
      v_vq_data u 1:3  w l ls 12 title "RT",   \
      v_vq_data u 1:2  w l ls 11 title "IU",   \
      v_vq_data u 1:6  w l ls 15 title "FD",   \
      v_vq_data u 1:4  w l ls 13 title "SK"

set origin dx * 2 + dx_o, dy * 1 + dy_o
set size s_dx, s_dy

set label 3 'Cr' at graph label_x, label_y font "Times New Roman,12"

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

set xtics nomirror
set ytics nomirror

plot cr_vq_data u 1:5  w l ls 14 title "VS",   \
     cr_vq_data u 1:3  w l ls 12 title "RT",   \
     cr_vq_data u 1:2  w l ls 11 title "IU",   \
     cr_vq_data u 1:6  w l ls 15 title "FD",   \
     cr_vq_data u 1:4  w l ls 13 title "SK",  \

set origin dx * 2 + dx_o + dx_zo, dy * 1 + dy_o + dy_zo
set size s_z_dx, s_z_dy

set xr [3.05 to 5.10 ]
set yr [0.0585 to 0.065]

unset label 3

unset xtics
unset ytics

plot cr_vq_data u 1:5  w l ls 14 title "VS",   \
     cr_vq_data u 1:3  w l ls 12 title "RT",   \
     cr_vq_data u 1:2  w l ls 11 title "IU",   \
     cr_vq_data u 1:6  w l ls 15 title "FD",   \
     cr_vq_data u 1:4  w l ls 13 title "SK",  \

set xtics font "Times New Roman,12pt"

set origin dx * 3 + dx_o, dy * 1 + dy_o
set size s_dx, s_dy

set label 4 'Mn' at graph label_x, label_y font "Times New Roman,12"

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

set xtics nomirror
set ytics nomirror

plot mn_vq_data u 1:5  w l ls 14 title "VS",   \
     mn_vq_data u 1:3  w l ls 12 title "RT",   \
     mn_vq_data u 1:2  w l ls 11 title "IU",   \
     mn_vq_data u 1:6  w l ls 15 title "FD",   \
     mn_vq_data u 1:4  w l ls 13 title "SK",  \

set origin dx * 3 + dx_o + dx_zo, dy * 1 + dy_o + dy_zo
set size s_z_dx, s_z_dy

set xr [3.17 to 5.19 ]
set yr [0.0485 to 0.0535]

unset label 4

unset xtics
unset ytics

plot mn_vq_data u 1:5  w l ls 14 title "VS",   \
     mn_vq_data u 1:3  w l ls 12 title "RT",   \
     mn_vq_data u 1:2  w l ls 11 title "IU",   \
     mn_vq_data u 1:6  w l ls 15 title "FD",   \
     mn_vq_data u 1:4  w l ls 13 title "SK",  \


set format x ""
unset xlabel

set ytics border
set format y

unset ylabel

set origin 0 + dx_o, dy_o_b
set size s_dx, s_dy

set format x

set label 5 'Fe' at graph label_x, label_y font "Times New Roman,12"

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

set xtics nomirror
set ytics nomirror

plot fe_vq_data u 1:5  w l ls 14 title "VS",   \
     fe_vq_data u 1:3  w l ls 12 title "RT",   \
     fe_vq_data u 1:2  w l ls 11 title "IU",   \
     fe_vq_data u 1:6  w l ls 15 title "FD",   \
     fe_vq_data u 1:4  w l ls 13 title "SK",  \

set origin dx * 0 + dx_o + dx_zo, dy * 0 + dy_o_b + dy_zo
set size s_z_dx, s_z_dy

set xr [3.27 to 5.25 ]
set yr [0.0645 to 0.0710]

unset label 5

unset xtics
unset ytics

plot fe_vq_data u 1:5  w l ls 14 title "VS",   \
     fe_vq_data u 1:3  w l ls 12 title "RT",   \
     fe_vq_data u 1:2  w l ls 11 title "IU",   \
     fe_vq_data u 1:6  w l ls 15 title "FD",   \
     fe_vq_data u 1:4  w l ls 13 title "SK",  \


set origin dx * 1 + dx_o, dy_o_b
set size s_dx, s_dy

set format y ""

set label 6 'Co' at graph label_x, label_y font "Times New Roman,12"

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

set xtics nomirror
set ytics nomirror

plot co_vq_data u 1:5  w l ls 14 title "VS",   \
     co_vq_data u 1:3  w l ls 12 title "RT",   \
     co_vq_data u 1:2  w l ls 11 title "IU",   \
     co_vq_data u 1:6  w l ls 15 title "FD",   \
     co_vq_data u 1:4  w l ls 13 title "SK",  \

set origin dx * 1 + dx_o + dx_zo, dy * 0 + dy_o_b + dy_zo
set size s_z_dx, s_z_dy

set xr [3.5 to 5.9]
set yr [0.073 to 0.0785]

unset label 6

unset xtics
unset ytics

plot co_vq_data u 1:5  w l ls 14 title "VS",   \
     co_vq_data u 1:3  w l ls 12 title "RT",   \
     co_vq_data u 1:2  w l ls 11 title "IU",   \
     co_vq_data u 1:6  w l ls 15 title "FD",   \
     co_vq_data u 1:4  w l ls 13 title "SK",  \

set origin dx * 2 + dx_o, dy_o_b
set size s_dx, s_dy

set label 7 'Ni' at graph label_x, label_y font "Times New Roman,12"

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

set xtics nomirror
set ytics nomirror

plot ni_vq_data u 1:5  w l ls 14 title "VS",   \
     ni_vq_data u 1:3  w l ls 12 title "RT",   \
     ni_vq_data u 1:2  w l ls 11 title "IU",   \
     ni_vq_data u 1:6  w l ls 15 title "FD",   \
     ni_vq_data u 1:4  w l ls 13 title "SK",  \

set origin dx * 2 + dx_o + dx_zo + 0.04, dy * 0 + dy_o_b + dy_zo * 1.225
set size s_z_dx * 0.73, s_z_dy * 0.8

set xr [3.67 to 6.25 ]
set yr [0.0810 to 0.0865]

unset label 7

unset xtics
unset ytics

plot ni_vq_data u 1:5  w l ls 14 title "VS",   \
     ni_vq_data u 1:3  w l ls 12 title "RT",   \
     ni_vq_data u 1:2  w l ls 11 title "IU",   \
     ni_vq_data u 1:6  w l ls 15 title "FD",   \
     ni_vq_data u 1:4  w l ls 13 title "SK",  \

set xtics font "Times New Roman,12pt"

set origin dx * 3 + dx_o, dy_o_b
set size s_dx, s_dy

unset label 7
set label 8 'Cu' at graph label_x, label_y font "Times New Roman,12"

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

set xtics nomirror
set ytics nomirror

plot cu_vq_data u 1:5  w l ls 14 title "VS",   \
     cu_vq_data u 1:3  w l ls 12 title "RT",   \
     cu_vq_data u 1:2  w l ls 11 title "IU",   \
     cu_vq_data u 1:6  w l ls 15 title "FD",   \
     cu_vq_data u 1:4  w l ls 13 title "SK",  \

set origin dx * 3 + dx_o + dx_zo + 0.04, dy * 0 + dy_o_b + dy_zo * 1.225
set size s_z_dx * 0.73, s_z_dy * 0.8

set xr [4.27 to 7.25 ]
set yr [0.097 to 0.102]

unset label 8

unset xtics
unset ytics

plot cu_vq_data u 1:5  w l ls 14 title "VS",   \
     cu_vq_data u 1:3  w l ls 12 title "RT",   \
     cu_vq_data u 1:2  w l ls 11 title "IU",   \
     cu_vq_data u 1:6  w l ls 15 title "FD",   \
     cu_vq_data u 1:4  w l ls 13 title "SK",  \
