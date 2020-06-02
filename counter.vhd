--------------------------------------------------------------------------------
--
-- Filename: 	counter.v
--
-- Project:	A set of Yosys Formal Verification exercises
--
-- Background:	A counter--just about as simple as they can become.  Useful as
--		a "Hello world" exercise in formal verification.
--
-- To Prove:	That the counter's value stays between 0 and MAX_AMOUNT-1.
--
-- Creator:	Dan Gisselquist, Ph.D.
--		Gisselquist Technology, LLC
--
--------------------------------------------------------------------------------
--
-- Copyright (C) 2017-2018, Gisselquist Technology, LLC
--
-- This program is free software (firmware): you can redistribute it and/or
-- modify it under the terms of  the GNU General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or (at
-- your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-- for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
-- target there if the PDF file isn't present.)  If not, see
-- <http://www.gnu.org/licenses/> for a copy.
--
-- License:	GPL, v3, as defined and found on www.gnu.org,
--		http://www.gnu.org/licenses/gpl.html
--
--
--------------------------------------------------------------------------------
--
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  generic (MAX_AMOUNT: natural := 22);
  port	(i_clk, i_start_signal : in std_logic;
	o_busy : out std_logic);
end entity counter;

architecture behavior of counter is
	signal	counts : unsigned(15 downto 0);
begin

	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if ((i_start_signal = '1') and (counts = 0)) then
				counts <= to_unsigned(MAX_AMOUNT-1, 16);
			elsif (counts /= 0) then
				counts <= counts - 1;
			end if;
		end if;
	end process;

	process(all)
	begin
		if (0 = counts) then
			o_busy <= '0';
		else
			o_busy <= '1';
		end if;
	end process;

end behavior;
