#!/usr/bin/env -S runvenv runner 

import numpy as np

[position, potential_1] = np.loadtxt('BRET.DAT', usecols=(0, 1), unpack=True)

potential = potential_1 * 27.21139

force = -1 * np.gradient(potential, position)

index = np.arange(len(position)) + 1

np.savetxt('bs.dat', np.column_stack((index, position, potential, force)), newline='\n', fmt=['%d', '%.18f', '%.18f', '%.18f'], delimiter='  ')
