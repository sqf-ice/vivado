/******************************************************************************
* Copyright (c) NCRL Coding Group.
* All right reserved.
*
* Filename: Modu_BPU.v
* Abstract: This is the verilog file that for the backward compute in each parallel
* subdecoder
*
* Description: ��BPU����ĳ�ֵ�������˵����
* 1�����ڵ�7�������һ���������������������һ�������ĵ�һ��BPU���㣬���ֵʼ��Ϊβ���ؼ���Ľ��
* 2���������ಢ���������������һ�������ĵ�һ��BPU���㣬���ֵ����һ�����������ĵ�0�������ļ������ṩ
* 3�����ڲ������������������ڲ����������ǵ�0���ڵ��������ֵ��Ϊ0�������ֵ��
* �ϴ��ڵ����ı����������ĺ�һ�������ĺ�����ƽ���ṩ
* Description: Init_Flag_BPU_M�ǻ����ĳ�ʼ���źţ�ÿ��B����һ�Σ�Init_Flag_BPU_L�����
* һ��������ʼ�����źţ�ÿ��BLOCK_SIZE����һ��
* Attention: alphaֵҪ��system��parity��La��һ��clk��������Ϊ����BM��Ҫһ��ʱ��
*
* Version:  V5.0
* Author:   Duck
* Time:		2011-11-01
*
******************************************************************************/
`timescale 1ns / 1ps
`include "Input_parameters.v"

module Modu_BPU(
	//input
	clk,Iter,blockIndex,Parallel_degree,Init_Flag_BPU_M,Init_Flag_BPU_L,initBeta,Alpha_In_BPU,
	data_In_BPU,
	q_up, // add by shaxiaoshi 2016.3.8
	//output
	betaValueOut_next,Le_sys,Le_par,D
	);
	//input
	input clk;
	input [3:0] Iter;
	input [2:0] blockIndex;
	input [3:0] Parallel_degree;
	input Init_Flag_BPU_M;//�м们���ĳ�ʼ�ź�
	input Init_Flag_BPU_L;//���һ�������ĳ�ʼ�ź�
	input [`beta_alpha_width*8-1:0] initBeta;
	input [`beta_alpha_width*8-1:0] Alpha_In_BPU;
	input [`sys_par_width*2+`Le_sys_par_width-1:0] data_In_BPU;
	
	input [3:0] q_up; // add by shaxiaoshi 2016.3.8
	
	//output
	output [`beta_alpha_width*8-1:0] betaValueOut_next;
	output [`Le_sys_par_width-1:0] Le_sys;
	output [`Le_sys_par_width-1:0] Le_par;
	output D;
	
	wire [`Le_sys_par_width-1:0] Le_sys;
	wire [`Le_sys_par_width-1:0] Le_par;
	wire D;
	
	reg  [`beta_alpha_width-1:0] B0,B1,B2,B3,B4,B5,B6,B7;
	reg [`Le_sys_par_width-1:0] La_delay;
	reg [`sys_par_width-1:0] System_delay;
	reg [`sys_par_width-1:0] Parity_delay;
	
	wire [`beta_alpha_width*8-1:0] betaValueOut;
	wire [`beta_alpha_width*8-1:0] betaValueOut_next;
	wire [`beta_alpha_width-1:0] B_temp0,B_temp1,B_temp2,B_temp3,B_temp4,B_temp5,B_temp6,B_temp7;
	//wire [`beta_alpha_width-1:0] A0,A1,A2,A3,A4,A5,A6,A7;
	wire [`Le_sys_par_width-1:0] La;
	wire [`sys_par_width-1:0] System;
	wire [`sys_par_width-1:0] Parity;
	wire [`Le_sys_par_width+1:0] sysAddLePar0,sysAddLePar1,Neg_sysAddLePar0,Neg_sysAddLePar1;
	wire [`beta_alpha_width-1:0] Normalize_Value;
	
	assign System = data_In_BPU[`sys_par_width-1:0];
	assign Parity = data_In_BPU[`sys_par_width*2-1:`sys_par_width];
	assign La = data_In_BPU[`sys_par_width*2+`Le_sys_par_width-1:`sys_par_width*2];
	assign Normalize_Value = B1;
	assign betaValueOut = {B7,B6,B5,B4,B3,B2,B1,B0};
	assign betaValueOut_next = {B_temp7,B_temp6,B_temp5,B_temp4,B_temp3,B_temp2,B_temp1,B_temp0};
	
	Modu_sysAddLePar_Compute sysAddLePar_Compute_BPU(//�����֧������ռ��һ��clk
	//input
	.clk(clk),.System(System),.Parity(Parity),.La(La),
	//output
	.sysAddLePar0(sysAddLePar0),.sysAddLePar1(sysAddLePar1),
	.Neg_sysAddLePar0(Neg_sysAddLePar0),.Neg_sysAddLePar1(Neg_sysAddLePar1)
	);
	
	Modu_Butterfly Butterfly_01_04(
	//input
	.cValue0(B0),.cValue1(B1),.sysAddLePar(sysAddLePar0),.Neg_sysAddLePar(Neg_sysAddLePar0),.Normalize_Value(Normalize_Value),
	//output
	.Out_Value0(B_temp0),.Out_Value1(B_temp4)
	);
	
	Modu_Butterfly Butterfly_23_15(
	//input
	.cValue0(B2),.cValue1(B3),.sysAddLePar(sysAddLePar1),.Neg_sysAddLePar(Neg_sysAddLePar1),.Normalize_Value(Normalize_Value),
	//output
	.Out_Value0(B_temp1),.Out_Value1(B_temp5)
	);
	
	Modu_Butterfly Butterfly_45_26(
	//input
	.cValue0(B4),.cValue1(B5),.sysAddLePar(Neg_sysAddLePar1),.Neg_sysAddLePar(sysAddLePar1),.Normalize_Value(Normalize_Value),
	//output
	.Out_Value0(B_temp2),.Out_Value1(B_temp6)
	);
	
	Modu_Butterfly Butterfly_67_37(
	//input
	.cValue0(B6),.cValue1(B7),.sysAddLePar(Neg_sysAddLePar0),.Neg_sysAddLePar(sysAddLePar0),.Normalize_Value(Normalize_Value),
	//output
	.Out_Value0(B_temp3),.Out_Value1(B_temp7)
	);
		
	always @(posedge clk)
	begin
		if(Init_Flag_BPU_L == 1 || Init_Flag_BPU_M == 1)
		begin
			if( (Iter==0 && Init_Flag_BPU_L==1'b0 && Init_Flag_BPU_M==1'b1) //��0�ε���ʱ�м�Ļ���
			 || (q_up == 1 && blockIndex<Parallel_degree-1 && Iter==0 && Init_Flag_BPU_L==1'b1 && Init_Flag_BPU_M==1'b0) //ֻ��һ��������ʱ�� add by shaxiaoshi 2016.3.8
			) 
			//|| (Iter==0 && blockIndex<Parallel_degree-1 && Init_Flag_BPU_L==1'b1))		//��0�ε���ʱ���һ�������������һ����������
			begin
				B0 <= {`beta_alpha_width{1'b0}};
				B1 <= {`beta_alpha_width{1'b0}};
				B2 <= {`beta_alpha_width{1'b0}};
				B3 <= {`beta_alpha_width{1'b0}};
				B4 <= {`beta_alpha_width{1'b0}};
				B5 <= {`beta_alpha_width{1'b0}};
				B6 <= {`beta_alpha_width{1'b0}};
				B7 <= {`beta_alpha_width{1'b0}};
			end
			else
			begin
				B0 <= initBeta[`beta_alpha_width-1:0];
				B1 <= initBeta[`beta_alpha_width*2-1:`beta_alpha_width];
				B2 <= initBeta[`beta_alpha_width*3-1:`beta_alpha_width*2];
				B3 <= initBeta[`beta_alpha_width*4-1:`beta_alpha_width*3];
				B4 <= initBeta[`beta_alpha_width*5-1:`beta_alpha_width*4];
				B5 <= initBeta[`beta_alpha_width*6-1:`beta_alpha_width*5];
				B6 <= initBeta[`beta_alpha_width*7-1:`beta_alpha_width*6];
				B7 <= initBeta[`beta_alpha_width*8-1:`beta_alpha_width*7];
			end
		end
		else
		begin
			B0 <= B_temp0;
			B1 <= B_temp1;
			B2 <= B_temp2;
			B3 <= B_temp3;
			B4 <= B_temp4;
			B5 <= B_temp5;
			B6 <= B_temp6;
			B7 <= B_temp7;
		end
	end
	
	always @(posedge clk)
	begin
		La_delay <= La;
		System_delay <= System;
		Parity_delay <= Parity;
	end
	
	Modu_LLR LLR(
	//input
	.clk(clk),.System(System_delay),.Parity(Parity_delay),.La(La_delay),.Beta(betaValueOut),.Alpha(Alpha_In_BPU),
	//output
	.Le_sys(Le_sys),.Le_par(Le_par),.D(D)
	);
	
endmodule