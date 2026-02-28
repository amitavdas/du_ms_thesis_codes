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
[r, gr] = np.loadtxt('grlw.dat', usecols=(0, 1), skiprows=2, unpack=True)
junk    = np.loadtxt('MONTO.DAT', usecols=(0), unpack=True)
N = len(r)


# In[104]:


fig1, ax1 = plt.subplots()
ax1.scatter(r, gr, color='#1f77b4', s=1)
plt.savefig('gr_from_grlw.pdf')


# In[108]:


#volume_finder = re.compile(r'^\s+\d+\s+T=\s+([0-9.]+)\s+E=')
# -1.1817552638752176 51.26578466627521 xlo xhi
# -1.1817552638752176 51.26578466627521 ylo yhi
# -1.1817552638752176 51.26578466627521 zlo zhi


rho = junk[3] 
print('number density: ', rho)


# In[109]:


def generator(q_i):
    integrand = (gr - 1) * np.sin(q_i*r)*(r/q_i)
    integral = sp.integrate.simpson(integrand, r)
    return integral

sq_generator = np.vectorize(generator)
q = np.arange(1, 1001) * 0.01
sq = 1 + ( sq_generator(q) * 4 * np.pi * rho )


# In[110]:


print("q length: ", len(q))
print("sq length: ", len(sq))

fig2, ax2 = plt.subplots()
ax2.scatter(q, sq, color='#1f77b4', s=1)
plt.savefig('sq_from_grlw.pdf')


# In[111]:


q_mask = q > 2.0
q_f = q[q_mask]
sq_f = sq[q_mask]

np.savetxt('sq_from_grlw.dat', np.column_stack((q_f, sq_f)), newline='\n', fmt='%.18E', delimiter='  ')

