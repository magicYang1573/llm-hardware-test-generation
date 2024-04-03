# Analyse the DUT verilog files
# 1> generate rfuzz harness to fuzzing method
# 2> generate explicit signal prompt to LLM method 

from __future__ import absolute_import
from __future__ import print_function
import sys
import os
from optparse import OptionParser

# the next line can be removed after installation
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import pyverilog
from pyverilog.dataflow.dataflow_analyzer import VerilogDataflowAnalyzer


def main():

    #################################################
    # Get input and output signals from Verilog DUT
    #################################################

    optparser = OptionParser()
    optparser.add_option("-t", "--top", dest="topmodule",
                         default="TOP", help="Top module, Default=TOP")
    (options, args) = optparser.parse_args()

    filelist = args

    for f in filelist:
        if not os.path.exists(f):
            raise IOError("file not found: " + f)

    if len(filelist) == 0:
        print("No input files.")
        return
    analyzer = VerilogDataflowAnalyzer(filelist, options.topmodule)
    analyzer.generate()
    module_name = ""
    inst_name = ""
    input_signals = []
    output_signals = []

    # Get Module Name
    # instances = analyzer.getInstances()
    # print('Instance:')
    # for module, instname in sorted(instances, key=lambda x: str(x[1])):
    #     print((module, instname))

    # Get Term Name, focus on input and output
    terms = analyzer.getTerms()
    print('Term:')
    for tk, tv in sorted(terms.items(), key=lambda x: str(x[0])):
        term_type = tv.termtype.pop()
        if term_type=="Input" and str(tv.name)!='top.clk':
            print(tv.name)
            width = abs(int(tv.msb.value) - int(tv.lsb.value)) + 1
            input_signals.append((str(tv.name), width))
        if term_type=="Ouput":
            width = abs(int(tv.msb.value) - int(tv.lsb.value)) + 1
            output_signals.append((str(tv.name), width))
    

    ###############################################
    # Generate RFuzz Harness with extracted signals
    ###############################################
    cpp_code = "\
                #include <vector>\n \
                #include <string>\n \
                #include <memory>\n \
                #include <verilated.h>\n \
                #include \"Vtop.h\" \n\
                int fuzz_poke(std::vector<bool>& bitstream, Vtop* top) { \n\
                    int bit_count = 0; \n\
                "
    for name, width in input_signals:
        name_short = name.split('.')[-1]
        if width==1:
            cpp_code += "\
                    top->{} = bitstream[bit_count++];\n".format(name_short) 
        else:
            cpp_code += "\
                    top->{} = 0; \n\
                    for(int i=0; i<{}; i++) {{ \n\
                        top->{} |= (int(bitstream[bit_count + {} - 1 - i]) << i); \n\
                    }}\n\
                    bit_count += {};\n".format(name_short, width, name_short, width, width)

    cpp_code += "\
                    return bit_count;\n}"

    # print(cpp_code)
    with open('src-basic/rfuzz-harness.cpp', 'w') as file:
        file.write(cpp_code)


    #########################################################################
    # Generate input signals and width with extracted signals for LLMGuidance
    #########################################################################
    record = ""
    for name, width in input_signals:
        name_short = name.split('.')[-1]
        record += "{} {}\n".format(name_short, width) # signal, signal_width in each line

    with open('./input-signals.txt', 'w') as file:
        file.write(record)



if __name__ == '__main__':
    main()
