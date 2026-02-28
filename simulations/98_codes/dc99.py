#!/usr/bin/runvenv sketch

import numpy as np
import sklearn

import matplotlib
matplotlib.use('Agg')

import matplotlib.pyplot as plt

#: lammps simulation was in units of metal
#: time in ps
#: distance in Angstorms

[time_steps, msd] = np.loadtxt('lammps_msd.dat', skiprows=2, usecols=(0, 4), unpack=True)

#: this has to be defined according to how data was collected
time_step_size = 0.003 # in ps

time_steps = (time_steps - time_steps[0]) * time_step_size

time_steps_0 = time_steps[:99]
time_steps_1 = time_steps[:1099]
time_steps_2 = time_steps[:2199]
time_steps_3 = time_steps

msd_0 = msd[:99]
msd_1 = msd[:1099]
msd_2 = msd[:2199]
msd_3 = msd

linreg = sklearn.linear_model.LinearRegression()

linreg.fit(time_steps_0.reshape(-1,1), msd_0)
D_0 = linreg.coef_[0]/6
linreg.fit(time_steps_1.reshape(-1,1), msd_1)
D_1 = linreg.coef_[0]/6
linreg.fit(time_steps_2.reshape(-1,1), msd_2)
D_2 = linreg.coef_[0]/6
linreg.fit(time_steps_3.reshape(-1,1), msd_3)
D_3 = linreg.coef_[0]/6

#: 1ps = 10 ** (-12)s
#: 1(A**2) = 10 ** (-16)(cm**2)
#: 1(A**2)/1ps = 10 ** (-16)(cm**2) / 10 ** (-12)s = 10 ** (-4) (cm**2)/s

D_0 = D_0 * (10**(-4))
D_1 = D_1 * (10**(-4))
D_2 = D_2 * (10**(-4))
D_3 = D_3 * (10**(-4))

D_mean = np.mean([D_0, D_1, D_2, D_3])
D_std  = np.std([D_0, D_1, D_2, D_3], ddof=1)

print("Time Step Size: ")
print("Diffusion coefficient:  D_0 = ", D_0    * (10**5), "in units of (10**-5)(cm**2)/s")
print("Diffusion coefficient:  D_1 = ", D_1    * (10**5), "in units of (10**-5)(cm**2)/s")
print("Diffusion coefficient:  D_2 = ", D_2    * (10**5), "in units of (10**-5)(cm**2)/s")
print("Diffusion coefficient:  D_3 = ", D_3    * (10**5), "in units of (10**-5)(cm**2)/s")
print("Diffusion coefficient: mean = ", D_mean * (10**5), "in units of (10**-5)(cm**2)/s")
print("Diffusion coefficient:  std = ", D_std  * (10**5), "in units of (10**-5)(cm**2)/s")

def msd_line(x):
    [ m ] = linreg.coef_
    return m*x + linreg.intercept_

fx_1, ax_1 = plt.subplots()
ax_1.plot(time_steps, msd_line(time_steps), color='#C0392B')
ax_1.set_title('Fitted MSD curve')
ax_1.set_xlabel('time (ps)')
ax_1.set_ylabel('MSD (Angstorm^2)')
plt.savefig('lammps_msd.pdf')

fx_2, ax_2 = plt.subplots()
ax_2.plot(time_steps, msd, color='#C0392B')
ax_2.set_title('Original MSD curve')
ax_2.set_xlabel('time (ps)')
ax_2.set_ylabel('MSD (Angstorm^2)')

plt.savefig('lammps_msd_original.pdf')

fx_3, ax_3 = plt.subplots()
ax_3.plot(time_steps, msd, color='#E67E22', alpha=0.2, linestyle='none', marker='o')
ax_3.plot(time_steps, msd_line(time_steps), color='#C0392B')
ax_3.set_title('MSD curve')
ax_3.set_xlabel('time (ps)')
ax_3.set_ylabel('MSD (Angstorm^2)')

plt.savefig('lammps_msd_both.pdf')

np.savetxt('msd_sim.dat', np.column_stack((time_steps, msd_line(time_steps), msd)), newline='\n', fmt='%s')
