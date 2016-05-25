import os


os.chdir('/home/vignesh/Desktop/Dropbox/CompOrg/Array_Multiplier/')

numBits = 32


fileName = "Array_Mult{}_gen.v".format(numBits)

print fileName

with open(fileName, "w") as fObj:
    fObj.write('`include "Prefix_Add{}.v"\n\n'.format(numBits))
    fObj.write("module Array_Mult{}_gen(x, y, P);\n".format(numBits))
    fObj.write("\n\tinput [{}:0] x, y;\n\n\toutput [{}:0] P;\n\n\treg zero = 1'b0;\n\n".format(numBits-1, 2*numBits-1))
    
    
    for i in xrange(numBits):
        fObj.write("\twire [{}:{}] p{};\n".format(numBits-1+i, i, i))
        
    fObj.write("\n")  
    
    for i in xrange(numBits):
        fObj.write("\twire [{}:{}] s{};\n".format(numBits+i, i, i))
        
       
    fObj.write("\n\tassign s0[{}] = zero;\n\n".format(numBits))
        

    for multiplier in xrange(numBits):
        multiplicand = numBits-1
        string = "\tassign p{0}[{2}] = y[{0}]&x[{1}]".format(multiplier, multiplicand, multiplicand+multiplier)
        
        for multiplicand in xrange(numBits-2, -1, -1):
            string += ", p{0}[{2}] = y[{0}]&x[{1}]".format(multiplier, multiplicand, multiplicand+multiplier)

        string += ";\n"
        fObj.write(string)

    
    fObj.write("\n\n\tassign s0[{}:0] = p0;\n\n".format(numBits-1))

    for i in xrange(1, numBits):
        fObj.write("\tPrefix_Add{0} f{1}(s{2}[{3}:{1}], p{1}[{3}:{1}], zero, s{1}[{3}:{1}], s{1}[{4}]);\n".format(numBits, i, i-1, i+numBits-1, i+numBits))
    
    fObj.write("\n\n")
    
    
    for i in xrange(numBits-1):
        fObj.write("\tassign P[{0}] = s{0}[{0}];\n".format(i))
        
    fObj.write("\n\tassign P[{0}:{1}] = s{1}[{0}:{1}];\n".format(2*numBits-1, numBits-1))
    
    fObj.write("\n\nendmodule\n")
