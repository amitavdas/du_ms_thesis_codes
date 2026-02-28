set arrow 1 from 2.42274,0.719056 to 2.42274,0.7051 head filled size screen 0.02,15 lw 2 lc rgb "black" front

lwca = 'LWCA.RES'

set terminal eps enhanced background rgb 'white' \
    size 2.39, 2.39                                    \
    font "Times New Roman,14pt"

set encoding iso_8859_1

set output 'sigma.eps'

#: range
xr_uf = 2.41
xr_ut = 2.430

yr_uf = 0.705
yr_ut = 0.740

set xr [xr_uf to xr_ut]
set yr [yr_uf to yr_ut]

#: tics
set ytics 0.0, 0.007 nomirror
set xtics 0.0, 0.004 nomirror

#: line styles

l_w = 5
set style line 11 dt (5,  10)                       lw l_w lc "black"
set style line 12 dt (5,  3, 15, 3) 		    lw l_w lc "black"

set xlabel "{/Times-Italic r} (\305)" offset 0, 0.5 font "Times New Roman,14"
set ylabel "{/Times-Italic in unit}" offset 2, 0 font "Times New Roman,14"

set grid
set size square

set key tmargin center offset 0, 0.05 horizontal maxrows 1 columns 2 \
           samplen 5 font "Times New Roman,14"

set margin 7.5, 3.7, 0.9, 0

pl lwca u 1:2 w l ls 11 title "{/Symbol b}u(r)", \
   ""   u 1:3 w l ls 12 title "{/Symbol F}(r)"