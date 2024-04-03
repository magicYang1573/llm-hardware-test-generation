                #include <vector>
                 #include <string>
                 #include <memory>
                 #include <verilated.h>
                 #include "Vtop.h" 
                int fuzz_poke(std::vector<bool>& bitstream, Vtop* top) { 
                    int bit_count = 0; 
                                    top->inp1 = bitstream[bit_count++];
                    top->inp2 = bitstream[bit_count++];
                    top->rst = bitstream[bit_count++];
                    return bit_count;
}