`timescale 1ns / 1ps
module tb_traffic_light;

    reg clk;
    reg rst_n;
    reg [31:0] tick_val;
    reg [7:0] green_time;
    reg [7:0] yellow_time;

    wire [2:0] ns_light;
    wire [2:0] ew_light;

    top_traffic_light uut (
        .clk(clk),
        .rst_n(rst_n),
        .tick_val(tick_val),
        .green_time(green_time),
        .yellow_time(yellow_time),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        
        tick_val = 32'd4;
        green_time = 8'd6;
        yellow_time = 8'd2;

        #25;
        rst_n = 1'b1;

        #1000;
        $finish;
    end

endmodule