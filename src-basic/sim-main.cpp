// DESCRIPTION: Verilator: Verilog example module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2017 by Wilson Snyder.
// SPDX-License-Identifier: CC0-1.0
//======================================================================



#include <verilated.h>
#include "Vtop.h"
#include "verilated_vcd_c.h"

#include <vector>
#include <memory>
#include <string>
#include "Guidance.h"
#include "../llm-guidance/src/LLMGuidance4CodeCov.h"
#include "../random-guidance/src/RandomGuidance.h"
#include "../src-basic/rfuzz-harness.h"
using namespace std;


int main(int argc, char** argv) {

    // Prevent unused variable warnings
    if (false && argc && argv) {}

    // Create logs/ directory in case we have traces to put under it
    Verilated::mkdir("logs");

    // Use LLM for test generation
    LLMGuidanceConfig config;
    config.dut_path = "../sim/top.v";
    config.cov_path = "../sim/logs/coverage.dat";
    config.history_dir_path = "../sim/logs/history";
    config.gpt_output_path = "../llm-guidance/gpt-feedback.txt";
    config.gpt_input_path = "../llm-guidance/gpt-input.txt";
    config.temperature = 0.0;
    config.iter_cnt_max = 5;
    config.cov_rpst_pattern = 0;
    config.use_dut_des = false;
    config.use_dut_inst = false;

    Guidance* guidance = new LLMGuidance4CodeCov(config);

    // Use Random for test generation
    // string cov_path = "../sim/logs/coverage.dat";
    // int reset_cycle_num = 20;
    // int iter_cnt_max = 1000;
    // Guidance* guidance = new RandomGuidance(cov_path, reset_cycle_num, iter_cnt_max);


    // Simulation Loop
    while(guidance->waitForInput()) {
        // reset the DUT
        const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
        contextp->debug(0);
        contextp->randReset(2);
        const std::unique_ptr<Vtop> top{new Vtop{contextp.get(), "TOP"}};
        
        // reset the coverage map
        contextp->coveragep()->zero();

        top->clk = 0;

        // // Get input from guidance
        vector<bool> bitstream = guidance->getBitInput();

        // // Simulation Cycle loop
        // cout<<"==================\n";
        while(1) {
            if(bitstream.size()==0) break;  //invalid answer from gpt

            contextp->timeInc(1);  
            top->clk = !top->clk;
            if (!top->clk) {
                int read_len = fuzz_poke(bitstream, top.get());
                // VL_PRINTF("clk=%x a=%x b=%x rst=%x\n",
                //   contextp->time(), top->a, top->b, top->rst);
                bitstream.erase(bitstream.begin(), bitstream.begin()+read_len);

                if(read_len > bitstream.size()) {
                    top->eval();
                    break;
                }
            }
            
            top->eval();
        }
        contextp->timeInc(1);  
        top->clk = !top->clk;
        top->eval();

        contextp->coveragep()->write("logs/coverage.dat");
        
        // // Send back coverage feedback to guidance
        int break_flag = guidance->sendCovFeedback();

        // Final model cleanup
        top->final();

        if(break_flag) break;

    }

    delete guidance;

    return 0;
}
