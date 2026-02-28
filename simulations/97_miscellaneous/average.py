#!/usr/bin/runvenv sketch

import numpy as np

[D_Ti, D_V, D_Cr, D_Mn, D_Fe, D_Co, D_Ni, D_Cu] = np.loadtxt('finite-size.dat', usecols=(0, 1, 2, 3, 4, 5, 6, 7), unpack=True)

D_Ti_mean = np.mean(D_Ti)
D_V_mean  = np.mean( D_V)
D_Cr_mean = np.mean(D_Cr)
D_Mn_mean = np.mean(D_Mn)
D_Fe_mean = np.mean(D_Fe)
D_Co_mean = np.mean(D_Co)
D_Ni_mean = np.mean(D_Ni)
D_Cu_mean = np.mean(D_Cu)

D_Ti_std = np.std(D_Ti, ddof=1)
D_V_std  = np.std( D_V, ddof=1)
D_Cr_std = np.std(D_Cr, ddof=1)
D_Mn_std = np.std(D_Mn, ddof=1)
D_Fe_std = np.std(D_Fe, ddof=1)
D_Co_std = np.std(D_Co, ddof=1)
D_Ni_std = np.std(D_Ni, ddof=1)
D_Cu_std = np.std(D_Cu, ddof=1)

print(f"Ti, Mean: {D_Ti_mean:4.2f}, Deviation: {D_Ti_std:5.3f}")
print(f"V,  Mean: { D_V_mean:4.2f}, Deviation: { D_V_std:5.3f}" )
print(f"Cr, Mean: {D_Cr_mean:4.2f}, Deviation: {D_Cr_std:5.3f}")
print(f"Mn, Mean: {D_Mn_mean:4.2f}, Deviation: {D_Mn_std:5.3f}")
print(f"Fe, Mean: {D_Fe_mean:4.2f}, Deviation: {D_Fe_std:5.3f}")
print(f"Co, Mean: {D_Co_mean:4.2f}, Deviation: {D_Co_std:5.3f}")
print(f"Ni, Mean: {D_Ni_mean:4.2f}, Deviation: {D_Ni_std:5.3f}")
print(f"Cu, Mean: {D_Cu_mean:4.2f}, Deviation: {D_Cu_std:5.3f}")
