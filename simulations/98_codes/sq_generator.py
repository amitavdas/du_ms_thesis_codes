#!/usr/bin/env python
# coding: utf-8

# In[102]:


import numpy as np
import scipy as sp
import fileinput
import re
import matplotlib.pyplot as plt


# In[103]:


# rdf_from_trajectory.dat
[r, gr] = np.loadtxt('rdf_from_trajectory.dat', usecols=(0, 1), unpack=True)
N = len(r)


# In[104]:


fig1, ax1 = plt.subplots()
ax1.scatter(r, gr, color='#1f77b4', s=1)
plt.savefig('rdf_from_rdf.pdf')


# In[108]:


#volume_finder = re.compile(r'^\s+\d+\s+T=\s+([0-9.]+)\s+E=')
# -1.1817552638752176 51.26578466627521 xlo xhi
# -1.1817552638752176 51.26578466627521 ylo yhi
# -1.1817552638752176 51.26578466627521 zlo zhi

volume_finder = re.compile(r'^(-?\d*\.\d*)\s(-?\d*\.\d*)\s(.lo)\s(.hi)')
natoms_finder = re.compile(r'^(\d*)\satoms')

with fileinput.input(files=('final_output.data'), encoding="utf-8") as file:
    for line in file:
        extractor = volume_finder.match(line)
        if extractor != None :
            if extractor.group(3) == 'xlo':
                x1 = float(extractor.group(1))
                x2 = float(extractor.group(2))
                xlength = x2 - x1
            if extractor.group(3) == 'ylo':
                y1 = float(extractor.group(1))
                y2 = float(extractor.group(2))
                ylength = y2 - y1
            if extractor.group(3) == 'zlo':
                z1 = float(extractor.group(1))
                z2 = float(extractor.group(2))
                zlength = z2 - z1
        extractor = natoms_finder.match(line)
        if extractor != None :
            number_of_atoms = float(extractor.group(1))

print('xlength: ', xlength)
print('ylength: ', ylength)
print('zlength: ', zlength)

volume = xlength * ylength * zlength
print('number of atoms: ', number_of_atoms)
print('volume:  ', volume)
rho = number_of_atoms / volume
print('number density: ', rho)


# In[109]:


def generator(q_i):
    integrand = (gr - 1) * np.sin(q_i*r)*(r/q_i)
    integral = sp.integrate.simpson(integrand, r)
    return integral

sq_generator = np.vectorize(generator)
q = np.arange(1, 101) * 0.1
sq = 1 + ( sq_generator(q) * 4 * np.pi * rho )


# In[110]:


print("q length: ", len(q))
print("sq length: ", len(sq))

fig2, ax2 = plt.subplots()
ax2.scatter(q, sq, color='#1f77b4', s=1)
plt.savefig('sq_from_rdf.pdf')


# In[111]:


q_mask = q > 2.0
q_f = q[q_mask]
sq_f = sq[q_mask]

np.savetxt('sq_from_rdf_from_trajectory.dat', np.column_stack((q_f, sq_f)), newline='\n', fmt='%.18E', delimiter='  ')

