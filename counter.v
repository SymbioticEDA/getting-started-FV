////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	counter.v
//
// Project:	A set of Yosys Formal Verification exercises
//
// Background:	A counter--just about as simple as they can become.  Useful as
//		a "Hello world" exercise in formal verification.
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
module	counter(i_clk, i_start_signal, o_busy);
	parameter	[15:0]	MAX_AMOUNT = 22;
	//
	input	wire	i_clk;
	//
	input	wire	i_start_signal;
	output	reg	o_busy;

	reg	[15:0]	counter;

	always @(posedge i_clk)
		if ((i_start_signal)&&(counter == 0))
			counter <= MAX_AMOUNT-1'b1;
		else if (counter != 0)
			counter <= counter - 1'b1;

	always @(*)
		o_busy <= (counter != 0);

`ifdef	FORMAL
	always @(*)
		assert(counter < MAX_AMOUNT);
`endif
endmodule
