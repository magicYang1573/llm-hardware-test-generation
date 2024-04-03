# Benchmark
## Simple Level
This level involves 10 basic combinational logic circuits.
- s01, s02: `if-else`
- s03, s04: `case`
- s05, s06, s07: Verilog algorithm operator such as `>, <, =, &, ^, |`
- s08: `assign`
- s09: ALU
- s10: Shifter
  
## Medium Level
This level consists of 8 sequential logic circuits.
- m01, m02, m03: FSM
- m04, m05: Counter
- m06: Arbiter
- m07: FSM + Counter
- m08: Traffic Light Controller
  
## Complex Level
This level encompasses 6 large-scale FSM circuits of different size, with two transition branches per state.
- b01: 16 states
- b02: 24 states
- b03: 32 states
- b04: 48 states
- b05: 64 states
- b06: 128 states 

*Note: For certain designs, there are branches that cannot be reached regardless of the input provided. We exclude these branches from our statistical analysis.*

## Custom DUT
To design a custom DUT that is compatible with the current PyVerilog parser and Verilator testbench, the following requirements need to be met:

- For the clock signal, it should be uniformly named `clk` in the DUT source code. Other signals are extracted by PyVerilog and uniformly called in the form of a harness.
- The name of all modules should be uniformly `top`.
- Verilator and PyVerilog currently do not support some advanced syntax of SVA (SystemVerilog Assertions).