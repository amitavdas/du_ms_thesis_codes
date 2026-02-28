#!/usr/bin/env python3

import numpy as np
import glob
import matplotlib.pyplot as plt

#: averaging
#avg_rdf = np.loadtxt('gr/gr.0', skiprows=2, usecols=(1))
counter = 0
avg_rdf = 0
for rdf_file in glob.iglob('gr/gr.*'):
    avg_rdf = avg_rdf + np.loadtxt(rdf_file, skiprows=2, usecols=(1))
    counter += 1

#print(counter)
#: do the averaging
avg_rdf = avg_rdf / counter

#: load the x axis values
r_rdf = np.loadtxt('gr/gr.0', skiprows=2, usecols=(0))

counter = 0
std_d_rdf = 0
for rdf_file in glob.iglob('gr/gr.*'):
    std_d_rdf = std_d_rdf + (np.loadtxt(rdf_file, skiprows=2, usecols=(1)) - avg_rdf)**2
    counter += 1
std_d_rdf = np.sqrt(std_d_rdf / counter)

np.savetxt('rdf_from_trajectory.dat', np.column_stack((r_rdf, avg_rdf, std_d_rdf)), newline='\n', fmt='%s')

avg_g_sigma_index = avg_rdf.argmax()
avg_g_sigma = avg_rdf[avg_g_sigma_index]
avg_sigma = r_rdf[avg_g_sigma_index]

print("g(sigma): ", avg_g_sigma)
print("sigma: ", avg_sigma)

fig1, ax2 = plt.subplots()
ax2.plot(r_rdf, avg_rdf, color='#C0392B')
ax2.fill_between(r_rdf, avg_rdf+std_d_rdf, avg_rdf-std_d_rdf, color='cyan', alpha=0.2)
ax2.set_title('Pair Correlation Function')
ax2.set_xlabel('r (Angstorm)')
ax2.set_ylabel('g(r)')
plt.savefig('rdf_from_trajectory.pdf')
