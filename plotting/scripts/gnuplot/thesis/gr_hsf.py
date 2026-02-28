#!/usr/bin/env python3

import numpy as np
import matplotlib.pyplot as plt

rdf_file = '../../data/miscellaneous/gr_hsf.dat'
[ r, gr ] = np.loadtxt(rdf_file, skiprows=0, usecols=(0, 1), unpack=True)

fig, ax = plt.subplots(figsize=(4, 4))
ax.plot(r, gr, linewidth=1, color='black')
ax.set_aspect('equal') # square plot
#ax.set_title('Pair Correlation Function')
ax.set_xbound(0, 6)
ax.set_ybound(0, 6)
ax.set_xticks(np.arange(0, 6))
ax.set_yticks(np.arange(0, 6))
ax.set_xlabel(r'r/$\sigma$')
ax.set_ylabel('$g(r)$')
plt.savefig('gr_hsf.pdf')
