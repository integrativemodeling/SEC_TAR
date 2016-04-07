###################################
# Get transformations from docking
#
# iecheverria -- Sali Lab -- UCSF
###################################

import numpy as np

def get_trans(file_in):

    D = []

    for line in open(file_in):
        vals = line.split()
        if len(vals) > 28 and vals[1] == '|':
            v = line.split('||')[1]
            vv = v.split()
            D.append([vals[0],vv[0],vv[1],vv[2],vv[3],vv[4],vv[5]])


    D = np.array(D)
    np.savetxt('trans_dock.dat',D,fmt='%s')

file_in = 'dock_Znloop2.log'
get_trans(file_in)


