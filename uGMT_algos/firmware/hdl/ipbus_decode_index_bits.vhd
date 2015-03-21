-- Address decode logic for ipbus fabric
-- 
-- This file has been AUTOGENERATED from the address table - do not hand edit
-- 
-- We assume the synthesis tool is clever enough to recognise exclusive conditions
-- in the if statement.
-- 
-- Dave Newbold, February 2011

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

package ipbus_decode_index_bits is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_index_bits(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Thu Mar 19 16:46:46 2015 
  constant N_SLV_IDX_BITS_BRL: integer := 0;
  constant N_SLV_IDX_BITS_OVL: integer := 1;
  constant N_SLV_IDX_BITS_FWD: integer := 2;
  constant N_SLAVES: integer := 3;
-- END automatically generated VHDL

    
end ipbus_decode_index_bits;

package body ipbus_decode_index_bits is

  function ipbus_sel_index_bits(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Thu Mar 19 16:46:46 2015 
    if    std_match(addr, "-------------00-----------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_IDX_BITS_BRL, IPBUS_SEL_WIDTH)); -- idx_bits_brl / base 0x00000000 / mask 0x00060000
    elsif std_match(addr, "-------------01-----------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_IDX_BITS_OVL, IPBUS_SEL_WIDTH)); -- idx_bits_ovl / base 0x00020000 / mask 0x00060000
    elsif std_match(addr, "-------------10-----------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_IDX_BITS_FWD, IPBUS_SEL_WIDTH)); -- idx_bits_fwd / base 0x00040000 / mask 0x00060000
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_index_bits;

end ipbus_decode_index_bits;

