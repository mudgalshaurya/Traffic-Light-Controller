`timescale 1ns / 1ps
module timmer_traffic_light (
    input clk,
    input rst_n,
    input [31:0] tick_val,
    output reg tick
);

    reg [31:0] counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 32'd0;
            tick <= 1'b0;
        end else if (counter >= tick_val) begin
            counter <= 32'd0;
            tick <= 1'b1;
        end else begin
            counter <= counter + 1'd1;
            tick <= 1'b0;
        end
    end

endmodule


