////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	counter_vhd.sv
//
// Project:	A set of Yosys Formal Verification exercises
//
// Background:	A counter--just about as simple as they can become.  Useful as
//		a "Hello world" exercise in formal verification.
//
//	This particular file is a System Verilog wrapper around counter.vhd,
//	so as to be able to use the System Verilog assertions to verify
//	counter.vhd
//
// To Prove:	That the counter's value stays between 0 and MAX_VALUE-1.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2017-2018, Gisselquist Technology, LLC
//
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of  the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype	none
//
module	counter_vhd(i_clk, i_start_signal, counts, o_busy);
	parameter	[15:0]	MAX_AMOUNT = 22;
	input	wire		i_clk, i_start_signal;
	input	wire	[15:0]	counts;
	input	wire		o_busy;

`ifdef	FORMAL
	always @(*)
		assert(counts < MAX_AMOUNT);
`endif
endmodule

bind counter counter_vhd
	#(.MAX_AMOUNT(MAX_AMOUNT)) copy (.*);
