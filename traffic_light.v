module traffic_light(
    input clk,
    input reset,

    output reg A_red,
    output reg A_yellow,
    output reg A_green,

    output reg B_red,
    output reg B_yellow,
    output reg B_green
);

    reg [1:0] state;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= S0;
    else
        case(state)

            S0: state <= S1;
            S1: state <= S2;
            S2: state <= S3;
            S3: state <= S0;

        endcase
end
           //output logic
           always @(*)
begin
    case(state)

    S0:
    begin
        A_green = 1;
        A_yellow = 0;
        A_red = 0;

        B_green = 0;
        B_yellow = 0;
        B_red = 1;
    end

    S1:
    begin
        A_green = 0;
        A_yellow = 1;
        A_red = 0;

        B_green = 0;
        B_yellow = 0;
        B_red = 1;
    end

    S2:
    begin
        A_green = 0;
        A_yellow = 0;
        A_red = 1;

        B_green = 1;
        B_yellow = 0;
        B_red = 0;
    end

    S3:
    begin
        A_green = 0;
        A_yellow = 0;
        A_red = 1;

        B_green = 0;
        B_yellow = 1;
        B_red = 0;
    end

    endcase
end

endmodule