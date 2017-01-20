/******************************************************************************
* Copyright (c) NCRL Coding Group.
* All right reserved.
*
* Filename: Input_parameters.v
* Abstract: This is the verilog file that defines the parameter used in the 
*           Turbo decoder. The file is generated by a c program.
*
* Version:  V5.0
* Author:   Duck
* Time:		2011-11-01
*
******************************************************************************/
`define	 CmpCounter_width		10			//最大为768+3*64
`define	 window_width			6
`define	 Data_Addr_width		10			//8并行度下，最大768
`define	 sys_par_width			7			//输入的信息与校验位的量化字长
`define     Le_sys_par_width		8			//Le_sys 和Le_par的定点字长
`define	 beta_alpha_width		10			//前后向量度的定点字长
`define	 codeblock_addr_width	4