## Day 1 - Secret Enterance 

This consists the solution of Advent of Code Day 1 puzzle using Verilog. 
The problem models a rotatory lock with positions 0-99 and directions Left (L) or Right (R).
Part 1 and 2 of the problem are implemented in separate modules. 

## Part 1 

### Problem 
The dial starts at 50. Each input rotates the dial left or right by a given number of rotations. The result is the number of times the dial ends at position 0 after completing a single set of rotation.

### Solution 
- The dial position is stored in register
- Each movement is executed in a clock cycle
- Rotations are accepted through a valid/ready flag
- Logic is implemented as a two state FSM
- Zero counter (the password) increments only when a single set of rotations completes and the dial rests at position 0

### Files 
- [Part 1 RTL](rtl/day01_part1.v)
- [Part 1 Testbench](tb/tb_day01_part1.v)

---

## Part 2 

### Problem 
The dial must be counted every time it lands on position 0 including during intermediate clicks within a rotation.

### Solution
- Uses the same structure and interface as Part 1 solution
- The zero counter increments whenever a click causes the dial to transition into position 0
- The design remains click accurate and executes one dial movement per clock cycle

### Files
- [Part 2 RTL](rtl/day01_part2.v)
- [Part 2 Testbench](tb/tb_day01_part2.v)
