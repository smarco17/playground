`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/05 19:13:28
// Design Name: 
// Module Name: mm2s_cmd_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dm_ctrl #(
    parameter DM_MODE = 0,                              // 0:mm2s. 1:s2mm
    parameter CMD_TDATA_WIDTH = 104,                    // 
    parameter STS_TDATA_WIDTH = 8,                      // 
    parameter TDATA_WIDTH = 16)                         // 
    (
    input wire                         aclk,
    input wire                         aresetn,
    input wire                         cmd_start,
    output reg                         cmd_tvalid,
    input  wire                        cmd_tready,
    output reg [CMD_TDATA_WIDTH-1:0]   cmd_tdata,
    input  wire                        sts_tvalid,
    output reg                         sts_tready,
    input  wire [STS_TDATA_WIDTH-1:0]  sts_tdata,
    input  wire                        sts_tkeep,
    input  wire                        sts_tlast,
    input  wire [TDATA_WIDTH-1:0]      tdata,
    input  wire                        tkeep,
    input  wire                        tlast,
    input  wire                        tvalid,
    output reg                         tready);

reg                        cmd_start_f1;
reg                        is_running;
wire [CMD_TDATA_WIDTH-1:0] mm2s_cmd;
wire [CMD_TDATA_WIDTH-1:0] s2mm_cmd;
wire [CMD_TDATA_WIDTH-1:0] cmd;

assign cmd = (DM_MODE) ? s2mm_cmd : mm2s_cmd;

always @(posedge aclk) begin
  if(!aresetn) begin
    cmd_start_f1 <= 0;
  end else begin
    cmd_start_f1 <= cmd_start;
  end
end

always @(posedge aclk) begin
  if(!aresetn) begin
    is_running <= 0;
  end else if(!is_running) begin
    if(cmd_start && !cmd_start_f1) begin
      is_running <= 1;
    end
  end
end

always @(posedge aclk) begin
  if(!aresetn) begin
  
  end else if(is_running) begin
    
  end
end

endmodule
