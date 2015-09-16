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

package ipbus_decode_isolation_mem_relative is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_isolation_mem_relative(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Wed Sep 16 19:50:53 2015 
  constant N_SLV_REL_ISO_0: integer := 0;
  constant N_SLV_REL_ISO_1: integer := 1;
  constant N_SLV_REL_ISO_2: integer := 2;
  constant N_SLV_REL_ISO_3: integer := 3;
  constant N_SLV_REL_ISO_4: integer := 4;
  constant N_SLV_REL_ISO_5: integer := 5;
  constant N_SLV_REL_ISO_6: integer := 6;
  constant N_SLV_REL_ISO_7: integer := 7;
  constant N_SLAVES: integer := 8;
-- END automatically generated VHDL

    
end ipbus_decode_isolation_mem_relative;

package body ipbus_decode_isolation_mem_relative is

  function ipbus_sel_isolation_mem_relative(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Wed Sep 16 19:50:53 2015 
    if    std_match(addr, "---------------000--------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_REL_ISO_0, IPBUS_SEL_WIDTH)); -- rel_iso_0 / base 0x00000000 / mask 0x0001c000
    elsif std_match(addr, "---------------001--------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_REL_ISO_1, IPBUS_SEL_WIDTH)); -- rel_iso_1 / base 0x00004000 / mask 0x0001c000
    elsif std_match(addr, "---------------010--------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_REL_ISO_2, IPBUS_SEL_WIDTH)); -- rel_iso_2 / base 0x00008000 / mask 0x0001c000
    elsif std_match(addr, "---------------011--------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_REL_ISO_3, IPBUS_SEL_WIDTH)); -- rel_iso_3 / base 0x0000c000 / mask 0x0001c000
    elsif std_match(addr, "---------------100--------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_REL_ISO_4, IPBUS_SEL_WIDTH)); -- rel_iso_4 / base 0x00010000 / mask 0x0001c000
    elsif std_match(addr, "---------------101--------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_REL_ISO_5, IPBUS_SEL_WIDTH)); -- rel_iso_5 / base 0x00014000 / mask 0x0001c000
    elsif std_match(addr, "---------------110--------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_REL_ISO_6, IPBUS_SEL_WIDTH)); -- rel_iso_6 / base 0x00018000 / mask 0x0001c000
    elsif std_match(addr, "---------------111--------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_REL_ISO_7, IPBUS_SEL_WIDTH)); -- rel_iso_7 / base 0x0001c000 / mask 0x0001c000
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_isolation_mem_relative;

end ipbus_decode_isolation_mem_relative;

