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

package ipbus_decode_cancel_out_bo is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_cancel_out_bo(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Tue Mar 24 15:04:23 2015 
  constant N_SLV_CANCEL_OUT_BO_0: integer := 0;
  constant N_SLV_CANCEL_OUT_BO_1: integer := 1;
  constant N_SLV_CANCEL_OUT_BO_2: integer := 2;
  constant N_SLV_CANCEL_OUT_BO_3: integer := 3;
  constant N_SLV_CANCEL_OUT_BO_4: integer := 4;
  constant N_SLV_CANCEL_OUT_BO_5: integer := 5;
  constant N_SLAVES: integer := 6;
-- END automatically generated VHDL

    
end ipbus_decode_cancel_out_bo;

package body ipbus_decode_cancel_out_bo is

  function ipbus_sel_cancel_out_bo(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Tue Mar 24 15:04:23 2015 
    if    std_match(addr, "----------------000-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_BO_0, IPBUS_SEL_WIDTH)); -- cancel_out_bo_0 / base 0x00000000 / mask 0x0000e000
    elsif std_match(addr, "----------------001-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_BO_1, IPBUS_SEL_WIDTH)); -- cancel_out_bo_1 / base 0x00002000 / mask 0x0000e000
    elsif std_match(addr, "----------------010-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_BO_2, IPBUS_SEL_WIDTH)); -- cancel_out_bo_2 / base 0x00004000 / mask 0x0000e000
    elsif std_match(addr, "----------------011-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_BO_3, IPBUS_SEL_WIDTH)); -- cancel_out_bo_3 / base 0x00006000 / mask 0x0000e000
    elsif std_match(addr, "----------------100-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_BO_4, IPBUS_SEL_WIDTH)); -- cancel_out_bo_4 / base 0x00008000 / mask 0x0000e000
    elsif std_match(addr, "----------------101-------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_CANCEL_OUT_BO_5, IPBUS_SEL_WIDTH)); -- cancel_out_bo_5 / base 0x0000a000 / mask 0x0000e000
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_cancel_out_bo;

end ipbus_decode_cancel_out_bo;
