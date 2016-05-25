import os
import math

#os.chdir('/home/vignesh/Dropbox/CompOrg/LRotate')

numBits = 16

numLevs = int(round(math.log(numBits, 2)))

fileName = "Lrotate{}_gen.v".format(numBits)

print fileName

with open(fileName, "w") as fObj:
    fObj.write('`include "mux2to1.v"\n\n')
    
    fObj.write("module Lrotate{}_gen(A, shl, OUT);\n".format(numBits))
    
    fObj.write("\n\tinput [{0}:0] A;\n\tinput [{1}:0] shl;\n\n\toutput [{0}:0] OUT;\n".format( numBits-1, numLevs-1) )
    
    
    string = "\n\twire [{}:0] m0".format(numBits-1)
    
    for i in xrange(1, numLevs):
        string += ", m{}".format(i)
        
    string += ";\n"
    
    fObj.write(string)
    
    fObj.write("\n\treg z = 1'b0;\n")
    
    
    
    lev = 0
    ind = 0
    string = "\n\tmux2to1 M{0}{1}(A[{2}], A[{1}], ~shl[{0}], m{0}[{1}])".format(lev, ind, (ind-2**(lev)) % numBits )
    
    ind += 1
    
            
    while( ind < numBits ):
        
        string += ", M{0}{1}(A[{2}], A[{1}], ~shl[{0}], m{0}[{1}])".format(lev, ind, (ind-2**(lev)) % numBits )
        ind += 1
            
    string += ";\n"
    
    fObj.write(string)
    
    for lev in xrange(1, numLevs):
    
        ind = 0
        string = "\n\tmux2to1 M{0}{1}(m{2}[{3}], m{2}[{1}], ~shl[{0}], m{0}[{1}])".format(lev, ind, lev-1, (ind-2**(lev)) % numBits)
        
        ind += 1
            
        while( ind < numBits ):
        
            string += ", M{0}{1}(m{2}[{3}], m{2}[{1}], ~shl[{0}], m{0}[{1}])".format(lev, ind, lev-1, (ind-2**(lev)) % numBits)
            ind += 1
            
            
        string += ";\n"
        fObj.write(string)
    
    fObj.write( "\n\tassign OUT = m{};\n".format(numLevs-1) )
    fObj.write("\nendmodule\n")
