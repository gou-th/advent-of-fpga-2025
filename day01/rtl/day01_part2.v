module day01_part2 (
    input wire clk,
    input wire rst,
    input wire valid,
    input wire dir,
    input wire [31:0] steps,
    output reg ready,
    output reg [6:0] dial_pos,
    output reg [31:0] zero_count
);
    reg [31:0] remain;
    reg dir_buff;

    always @(posedge clk) begin
        if (rst) begin
            dial_pos<=50;
            zero_count<=0;
            remain<=0;
            ready<=1;
            dir_buff<=0;
        end else begin
            if (valid && ready) begin
                remain<=steps;
                dir_buff<=dir;
                ready<=0;
            end
            else if (!ready) begin
                if (remain!=0) begin
                    if ((dir_buff&&dial_pos==99)||(!dir_buff&&dial_pos ==1))
                        zero_count<=zero_count+1;
                    if (dir_buff)
                        dial_pos<=(dial_pos == 99)?0:dial_pos + 1;
                    else
                        dial_pos<=(dial_pos==0)?99:dial_pos-1;
                    remain<=remain-1;
                end else begin
                    ready<=1;
                end
            end
        end
    end
endmodule


