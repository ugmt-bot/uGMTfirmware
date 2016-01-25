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

package ipbus_decode_mp7_payload is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_mp7_payload(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Mon Jan 25 01:18:39 2016 
  constant N_SLV_MUON_INPUT: integer := 0;
  constant N_SLV_ENERGY_INPUT: integer := 1;
  constant N_SLV_UGMT: integer := 2;
  constant N_SLV_INPUT_DISABLE_REG: integer := 3;
  constant N_SLV_GENERATE_LEMO_SIGNALS: integer := 4;
  constant N_SLV_MUON_COUNTER_RESET: integer := 5;
  constant N_SLV_SPY_BUFFER_CONTROL: integer := 6;
  constant N_SLAVES: integer := 7;
-- END automatically generated VHDL

    
end ipbus_decode_mp7_payload;

package body ipbus_decode_mp7_payload is

  function ipbus_sel_mp7_payload(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Mon Jan 25 01:18:39 2016 
    if    std_match(addr, "----000-------------------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_MUON_INPUT, IPBUS_SEL_WIDTH)); -- muon_input / base 0x00000000 / mask 0x0e000000
    elsif std_match(addr, "----001-------------------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ENERGY_INPUT, IPBUS_SEL_WIDTH)); -- energy_input / base 0x02000000 / mask 0x0e000000
    elsif std_match(addr, "----01--------------------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_UGMT, IPBUS_SEL_WIDTH)); -- uGMT / base 0x04000000 / mask 0x0c000000
    elsif std_match(addr, "----100----------0----00--------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_INPUT_DISABLE_REG, IPBUS_SEL_WIDTH)); -- input_disable_reg / base 0x08000000 / mask 0x0e004300
    elsif std_match(addr, "----100----------0----01--------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_GENERATE_LEMO_SIGNALS, IPBUS_SEL_WIDTH)); -- generate_lemo_signals / base 0x08000100 / mask 0x0e004300
    elsif std_match(addr, "----100----------0----10--------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_MUON_COUNTER_RESET, IPBUS_SEL_WIDTH)); -- muon_counter_reset / base 0x08000200 / mask 0x0e004300
    elsif std_match(addr, "----100----------1--------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_SPY_BUFFER_CONTROL, IPBUS_SEL_WIDTH)); -- spy_buffer_control / base 0x08004000 / mask 0x0e004000
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_mp7_payload;

end ipbus_decode_mp7_payload;

