`timescale 1ns / 1ps

module top_traffic_light (
    input clk,
    input rst_n,
    input [31:0] tick_val,
    input [7:0] green_time,
    input [7:0] yellow_time,
    output [2:0] ns_light,
    output [2:0] ew_light
);

    wire tick;

    timmer_traffic_light timer_inst (
        .clk(clk),
        .rst_n(rst_n),
        .tick_val(tick_val),
        .tick(tick)
    );

    fsm_traffic_light fsm_inst (
        .clk(clk),
        .rst_n(rst_n),
        .tick(tick),
        .green_time(green_time),
        .yellow_time(yellow_time),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );

endmodule
