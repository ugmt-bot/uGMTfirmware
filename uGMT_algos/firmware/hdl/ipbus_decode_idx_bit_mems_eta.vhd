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

package ipbus_decode_idx_bit_mems_eta is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_idx_bit_mems_eta(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Thu Mar 19 16:46:45 2015 
  constant N_SLV_ETA_IDX_BITS_MEM_0: integer := 0;
  constant N_SLV_ETA_IDX_BITS_MEM_1: integer := 1;
  constant N_SLV_ETA_IDX_BITS_MEM_2: integer := 2;
  constant N_SLV_ETA_IDX_BITS_MEM_3: integer := 3;
  constant N_SLV_ETA_IDX_BITS_MEM_4: integer := 4;
  constant N_SLV_ETA_IDX_BITS_MEM_5: integer := 5;
  constant N_SLV_ETA_IDX_BITS_MEM_6: integer := 6;
  constant N_SLV_ETA_IDX_BITS_MEM_7: integer := 7;
  constant N_SLV_ETA_IDX_BITS_MEM_8: integer := 8;
  constant N_SLV_ETA_IDX_BITS_MEM_9: integer := 9;
  constant N_SLV_ETA_IDX_BITS_MEM_10: integer := 10;
  constant N_SLV_ETA_IDX_BITS_MEM_11: integer := 11;
  constant N_SLV_ETA_IDX_BITS_MEM_12: integer := 12;
  constant N_SLV_ETA_IDX_BITS_MEM_13: integer := 13;
  constant N_SLV_ETA_IDX_BITS_MEM_14: integer := 14;
  constant N_SLV_ETA_IDX_BITS_MEM_15: integer := 15;
  constant N_SLV_ETA_IDX_BITS_MEM_16: integer := 16;
  constant N_SLV_ETA_IDX_BITS_MEM_17: integer := 17;
  constant N_SLV_ETA_IDX_BITS_MEM_18: integer := 18;
  constant N_SLV_ETA_IDX_BITS_MEM_19: integer := 19;
  constant N_SLV_ETA_IDX_BITS_MEM_20: integer := 20;
  constant N_SLV_ETA_IDX_BITS_MEM_21: integer := 21;
  constant N_SLV_ETA_IDX_BITS_MEM_22: integer := 22;
  constant N_SLV_ETA_IDX_BITS_MEM_23: integer := 23;
  constant N_SLV_ETA_IDX_BITS_MEM_24: integer := 24;
  constant N_SLV_ETA_IDX_BITS_MEM_25: integer := 25;
  constant N_SLV_ETA_IDX_BITS_MEM_26: integer := 26;
  constant N_SLV_ETA_IDX_BITS_MEM_27: integer := 27;
  constant N_SLV_ETA_IDX_BITS_MEM_28: integer := 28;
  constant N_SLV_ETA_IDX_BITS_MEM_29: integer := 29;
  constant N_SLV_ETA_IDX_BITS_MEM_30: integer := 30;
  constant N_SLV_ETA_IDX_BITS_MEM_31: integer := 31;
  constant N_SLV_ETA_IDX_BITS_MEM_32: integer := 32;
  constant N_SLV_ETA_IDX_BITS_MEM_33: integer := 33;
  constant N_SLV_ETA_IDX_BITS_MEM_34: integer := 34;
  constant N_SLV_ETA_IDX_BITS_MEM_35: integer := 35;
  constant N_SLAVES: integer := 36;
-- END automatically generated VHDL

    
end ipbus_decode_idx_bit_mems_eta;

package body ipbus_decode_idx_bit_mems_eta is

  function ipbus_sel_idx_bit_mems_eta(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Thu Mar 19 16:46:45 2015 
    if    std_match(addr, "-----------------000000---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_0, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_0 / base 0x00000000 / mask 0x00007e00
    elsif std_match(addr, "-----------------000001---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_1, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_1 / base 0x00000200 / mask 0x00007e00
    elsif std_match(addr, "-----------------000010---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_2, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_2 / base 0x00000400 / mask 0x00007e00
    elsif std_match(addr, "-----------------000011---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_3, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_3 / base 0x00000600 / mask 0x00007e00
    elsif std_match(addr, "-----------------000100---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_4, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_4 / base 0x00000800 / mask 0x00007e00
    elsif std_match(addr, "-----------------000101---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_5, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_5 / base 0x00000a00 / mask 0x00007e00
    elsif std_match(addr, "-----------------000110---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_6, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_6 / base 0x00000c00 / mask 0x00007e00
    elsif std_match(addr, "-----------------000111---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_7, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_7 / base 0x00000e00 / mask 0x00007e00
    elsif std_match(addr, "-----------------001000---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_8, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_8 / base 0x00001000 / mask 0x00007e00
    elsif std_match(addr, "-----------------001001---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_9, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_9 / base 0x00001200 / mask 0x00007e00
    elsif std_match(addr, "-----------------001010---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_10, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_10 / base 0x00001400 / mask 0x00007e00
    elsif std_match(addr, "-----------------001011---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_11, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_11 / base 0x00001600 / mask 0x00007e00
    elsif std_match(addr, "-----------------001100---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_12, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_12 / base 0x00001800 / mask 0x00007e00
    elsif std_match(addr, "-----------------001101---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_13, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_13 / base 0x00001a00 / mask 0x00007e00
    elsif std_match(addr, "-----------------001110---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_14, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_14 / base 0x00001c00 / mask 0x00007e00
    elsif std_match(addr, "-----------------001111---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_15, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_15 / base 0x00001e00 / mask 0x00007e00
    elsif std_match(addr, "-----------------010000---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_16, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_16 / base 0x00002000 / mask 0x00007e00
    elsif std_match(addr, "-----------------010001---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_17, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_17 / base 0x00002200 / mask 0x00007e00
    elsif std_match(addr, "-----------------010010---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_18, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_18 / base 0x00002400 / mask 0x00007e00
    elsif std_match(addr, "-----------------010011---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_19, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_19 / base 0x00002600 / mask 0x00007e00
    elsif std_match(addr, "-----------------010100---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_20, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_20 / base 0x00002800 / mask 0x00007e00
    elsif std_match(addr, "-----------------010101---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_21, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_21 / base 0x00002a00 / mask 0x00007e00
    elsif std_match(addr, "-----------------010110---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_22, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_22 / base 0x00002c00 / mask 0x00007e00
    elsif std_match(addr, "-----------------010111---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_23, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_23 / base 0x00002e00 / mask 0x00007e00
    elsif std_match(addr, "-----------------011000---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_24, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_24 / base 0x00003000 / mask 0x00007e00
    elsif std_match(addr, "-----------------011001---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_25, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_25 / base 0x00003200 / mask 0x00007e00
    elsif std_match(addr, "-----------------011010---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_26, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_26 / base 0x00003400 / mask 0x00007e00
    elsif std_match(addr, "-----------------011011---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_27, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_27 / base 0x00003600 / mask 0x00007e00
    elsif std_match(addr, "-----------------011100---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_28, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_28 / base 0x00003800 / mask 0x00007e00
    elsif std_match(addr, "-----------------011101---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_29, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_29 / base 0x00003a00 / mask 0x00007e00
    elsif std_match(addr, "-----------------011110---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_30, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_30 / base 0x00003c00 / mask 0x00007e00
    elsif std_match(addr, "-----------------011111---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_31, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_31 / base 0x00003e00 / mask 0x00007e00
    elsif std_match(addr, "-----------------100000---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_32, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_32 / base 0x00004000 / mask 0x00007e00
    elsif std_match(addr, "-----------------100001---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_33, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_33 / base 0x00004200 / mask 0x00007e00
    elsif std_match(addr, "-----------------100010---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_34, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_34 / base 0x00004400 / mask 0x00007e00
    elsif std_match(addr, "-----------------100011---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_35, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_35 / base 0x00004600 / mask 0x00007e00
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_idx_bit_mems_eta;

end ipbus_decode_idx_bit_mems_eta;

