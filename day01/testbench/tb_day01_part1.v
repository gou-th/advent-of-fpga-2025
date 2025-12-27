`timescale 1ns/1ps

module tb_day01_part1();

    reg clk = 0;
    always #5 clk=~clk;

    reg rst;
    reg valid;
    reg dir;
    reg [31:0] steps;
    wire ready;
    wire [6:0]  dial_pos;
    wire [31:0] zero_count;

    day01_part1 dut (.clk(clk),.rst(rst),.valid(valid),.dir(dir),.steps(steps),.ready(ready),.dial_pos(dial_pos),.zero_count(zero_count));

    integer file;
    reg [7:0] c;
    integer v;

    initial begin
        rst = 1;
        valid = 0;
        dir = 0;
        steps = 0;
        repeat (5) @(posedge clk);
        rst = 0;

        file = $fopen("input.txt", "r");
        while ($fscanf(file,"%c%d\n",c,v)==2) begin
            while (!ready)
                @(posedge clk);
            dir=(c=="R");
            steps=v;
            valid=1;
            @(posedge clk);
            valid=0;
        end
        $fclose(file);
        while (!ready)
            @(posedge clk);
        $display("Part 1 = %0d", zero_count);
        $finish;
    end
endmodule


