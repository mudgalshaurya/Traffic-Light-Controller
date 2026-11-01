`timescale 1ns / 1ps
module fsm_traffic_light (
    input clk,
    input rst_n,
    input tick,
    input [7:0] green_time,
    input [7:0] yellow_time,
    output reg [2:0] ns_light,
    output reg [2:0] ew_light
);

    localparam S_NS_G_EW_R = 2'd0;
    localparam S_NS_Y_EW_R = 2'd1;
    localparam S_NS_R_EW_G = 2'd2;
    localparam S_NS_R_EW_Y = 2'd3;

    reg [1:0] state;
    reg [7:0] timer;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_NS_G_EW_R;
            timer <= 8'd0;
            ns_light <= 3'b001;
            ew_light <= 3'b100;
        end else if (tick) begin
            case (state)
                S_NS_G_EW_R: begin
                    if (timer >= green_time) begin
                        state <= S_NS_Y_EW_R;
                        timer <= 8'd0;
                        ns_light <= 3'b010;
                        ew_light <= 3'b100;
                    end else begin
                        timer <= timer + 1'd1;
                    end
                end

                S_NS_Y_EW_R: begin
                    if (timer >= yellow_time) begin
                        state <= S_NS_R_EW_G;
                        timer <= 8'd0;
                        ns_light <= 3'b100;
                        ew_light <= 3'b001;
                    end else begin
                        timer <= timer + 1'd1;
                    end
                end

                S_NS_R_EW_G: begin
                    if (timer >= green_time) begin
                        state <= S_NS_R_EW_Y;
                        timer <= 8'd0;
                        ns_light <= 3'b100;
                        ew_light <= 3'b010;
                    end else begin
                        timer <= timer + 1'd1;
                    end
                end

                S_NS_R_EW_Y: begin
                    if (timer >= yellow_time) begin
                        state <= S_NS_G_EW_R;
                        timer <= 8'd0;
                        ns_light <= 3'b001;
                        ew_light <= 3'b100;
                    end else begin
                        timer <= timer + 1'd1;
                    end
                end

                default: begin
                    state <= S_NS_G_EW_R;
                    timer <= 8'd0;
                end
            endcase
        end
    end

endmodule

