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

package ipbus_decode_cancel_out_eo is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_cancel_out_eo(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Wed Apr 13 14:47:31 2016 
  constant N_SLV_CANCEL_OUT_EO_0: integer := 0;
  constant N_SLV_CANCEL_OUT_EO_1: integer := 1;
  constant N_SLV_CANCEL_OUT_EO_2: integer := 2;
  constant N_SLV_CANCEL_OUT_EO_3: integer := 3;
  constant N_SLV_CANCEL_OUT_EO_4: integer := 4;
  constant N_SLV_CANCEL_OUT_EO_5: integer := 5;
  constant N_SLAVES: integer := 6;
-- END automatically generated VHDL

    
end ipbus_decode_cancel_out_eo;

package body ipbus_decode_cancel_out_eo is

  function ipbus_sel_cancel_out_eo(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Wed Apr 13 14:47:31 2016 
    if    std_match(addr, "----------------000-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_EO_0, IPBUS_SEL_WIDTH)); -- cancel_out_eo_0 / base 0x00000000 / mask 0x0000e000
    elsif std_match(addr, "----------------001-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_EO_1, IPBUS_SEL_WIDTH)); -- cancel_out_eo_1 / base 0x00002000 / mask 0x0000e000
    elsif std_match(addr, "----------------010-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_EO_2, IPBUS_SEL_WIDTH)); -- cancel_out_eo_2 / base 0x00004000 / mask 0x0000e000
    elsif std_match(addr, "----------------011-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_EO_3, IPBUS_SEL_WIDTH)); -- cancel_out_eo_3 / base 0x00006000 / mask 0x0000e000
    elsif std_match(addr, "----------------100-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_EO_4, IPBUS_SEL_WIDTH)); -- cancel_out_eo_4 / base 0x00008000 / mask 0x0000e000
    elsif std_match(addr, "----------------101-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_EO_5, IPBUS_SEL_WIDTH)); -- cancel_out_eo_5 / base 0x0000a000 / mask 0x0000e000
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_cancel_out_eo;

end ipbus_decode_cancel_out_eo;

