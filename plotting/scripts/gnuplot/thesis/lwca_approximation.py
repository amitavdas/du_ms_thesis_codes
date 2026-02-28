#!/usr/bin/env python3

import numpy  as np
import pandas as pd
import matplotlib.pyplot as plt

data_file = '../../data/miscellaneous/lwca_approximation.dat'
df = pd.read_table(data_file, usecols=(0, 1, 2, 3), sep=r'\s+', header=None)
x1, y1, x2, y2 = df[0], df[1], df[2], df[3]

fig, ax = plt.subplots(figsize=(5, 5))
ax.plot(x1, y1, linewidth=1, color='black')
ax.plot(x2, y2, linewidth=1, color='black', dashes=(10, 5, 5, 5))
ax.axhline(y = 0, color='black', linewidth=0.5, dashes=(2, 2))
#ax.set_aspect('equal') # square plot
#ax.set_title('Pair Correlation Function')
#ax.set_xbound(0, 6)
ax.set_ybound(-35, 35)
#ax.set_xticks(np.arange(0, 6))
#ax.set_yticks(np.arange(0, 6))
ax.set_xlabel(r'r/$\sigma$')
ax.set_ylabel(r'$C(r)/\AA^3$')
plt.savefig('lwca_approximation.pdf')
