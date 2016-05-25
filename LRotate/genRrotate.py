import os
import math

#os.chdir('/home/vignesh/Dropbox/CompOrg/Lrotate')

numBits = 16

numLevs = int(round(math.log(numBits, 2)))

fileName = "Rrotate{}_gen.v".format(numBits)

print fileName

with open(fileName, "w") as fObj:
    fObj.write('`include "Lrotate{}.v"\n\n'.format(numBits))
    
    fObj.write("module Rrotate{}_gen(A, shr, OUT);\n".format(numBits))
    
    fObj.write("\n\tinput [{0}:0] A;\n\tinput [{1}:0] shr;\n\n\toutput [{0}:0] OUT;\n".format( numBits-1, numLevs-1) )
    
    fObj.write("\n\twire [{}:0] Arev, OUTrev;\n\n".format(numBits-1))

    for i in xrange(numBits-1, -1, -1):
    	fObj.write("\tassign Arev[{arev}] = A[{a}];\n".format(arev = i, a = numBits-1-i))
    	
    	
    fObj.write("\n\tLrotate{} L(Arev, shr, OUTrev);\n\n".format(numBits))
    
    
    for i in xrange(numBits-1, -1, -1):
    	fObj.write("\tassign OUT[{o}] = OUTrev[{orev}];\n".format(o = i, orev = numBits-1-i))
    	
    
    fObj.write("\nendmodule\n")
