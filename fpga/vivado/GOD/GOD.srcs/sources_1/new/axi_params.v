`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/05 19:19:41
// Design Name: 
// Module Name: axi_params
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

parameter AXI_SLV_ADDR_WIDTH = 64;
parameter AXI_SLV_DATA_WIDTH = 64;
parameter AXI_SLV_STRB_WIDTH = AXI_SLV_DATA_WIDTH / 8;

parameter AXI_MST_ADDR_WIDTH = 64;
parameter AXI_MST_DATA_WIDTH = 32;
parameter AXI_MST_STRB_WIDTH = AXI_MST_DATA_WIDTH / 8;

parameter MM2S_CMD_TDATA_WIDTH = 104;
parameter MM2S_STS_TDATA_WIDTH = 8;
parameter MM2S_TDATA_WIDTH = 16;

// module axi_params();
// endmodule
