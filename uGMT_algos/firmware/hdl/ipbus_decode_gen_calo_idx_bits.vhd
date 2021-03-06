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

package ipbus_decode_gen_calo_idx_bits is

  constant IPBUS_SEL_WIDTH: positive := 5; -- Should be enough for now?
  subtype ipbus_sel_t is std_logic_vector(IPBUS_SEL_WIDTH - 1 downto 0);
  function ipbus_sel_gen_calo_idx_bits(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t;

-- START automatically  generated VHDL the Tue May 24 12:21:58 2016 
  constant N_SLV_ETA_EXTRAPOLATION_MEM_0: integer := 0;
  constant N_SLV_ETA_EXTRAPOLATION_MEM_1: integer := 1;
  constant N_SLV_ETA_EXTRAPOLATION_MEM_2: integer := 2;
  constant N_SLV_ETA_EXTRAPOLATION_MEM_3: integer := 3;
  constant N_SLV_PHI_EXTRAPOLATION_MEM_0: integer := 4;
  constant N_SLV_PHI_EXTRAPOLATION_MEM_1: integer := 5;
  constant N_SLV_PHI_EXTRAPOLATION_MEM_2: integer := 6;
  constant N_SLV_PHI_EXTRAPOLATION_MEM_3: integer := 7;
  constant N_SLV_ETA_IDX_BITS_MEM_0: integer := 8;
  constant N_SLV_ETA_IDX_BITS_MEM_1: integer := 9;
  constant N_SLV_ETA_IDX_BITS_MEM_2: integer := 10;
  constant N_SLV_ETA_IDX_BITS_MEM_3: integer := 11;
  constant N_SLV_PHI_IDX_BITS_MEM_0: integer := 12;
  constant N_SLV_PHI_IDX_BITS_MEM_1: integer := 13;
  constant N_SLV_PHI_IDX_BITS_MEM_2: integer := 14;
  constant N_SLV_PHI_IDX_BITS_MEM_3: integer := 15;
  constant N_SLAVES: integer := 16;
-- END automatically generated VHDL

    
end ipbus_decode_gen_calo_idx_bits;

package body ipbus_decode_gen_calo_idx_bits is

  function ipbus_sel_gen_calo_idx_bits(addr : in std_logic_vector(31 downto 0)) return ipbus_sel_t is
    variable sel: ipbus_sel_t;
  begin

-- START automatically  generated VHDL the Tue May 24 12:21:58 2016 
    if    std_match(addr, "---------------00000------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_EXTRAPOLATION_MEM_0, IPBUS_SEL_WIDTH)); -- eta_extrapolation_mem_0 / base 0x00000000 / mask 0x0001f000
    elsif std_match(addr, "---------------00010------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_EXTRAPOLATION_MEM_1, IPBUS_SEL_WIDTH)); -- eta_extrapolation_mem_1 / base 0x00002000 / mask 0x0001f000
    elsif std_match(addr, "---------------00100------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_EXTRAPOLATION_MEM_2, IPBUS_SEL_WIDTH)); -- eta_extrapolation_mem_2 / base 0x00004000 / mask 0x0001f000
    elsif std_match(addr, "---------------00110------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_EXTRAPOLATION_MEM_3, IPBUS_SEL_WIDTH)); -- eta_extrapolation_mem_3 / base 0x00006000 / mask 0x0001f000
    elsif std_match(addr, "---------------01000------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_PHI_EXTRAPOLATION_MEM_0, IPBUS_SEL_WIDTH)); -- phi_extrapolation_mem_0 / base 0x00008000 / mask 0x0001f000
    elsif std_match(addr, "---------------01100------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_PHI_EXTRAPOLATION_MEM_1, IPBUS_SEL_WIDTH)); -- phi_extrapolation_mem_1 / base 0x0000c000 / mask 0x0001f000
    elsif std_match(addr, "---------------10000------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_PHI_EXTRAPOLATION_MEM_2, IPBUS_SEL_WIDTH)); -- phi_extrapolation_mem_2 / base 0x00010000 / mask 0x0001f000
    elsif std_match(addr, "---------------10100------------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_PHI_EXTRAPOLATION_MEM_3, IPBUS_SEL_WIDTH)); -- phi_extrapolation_mem_3 / base 0x00014000 / mask 0x0001f000
    elsif std_match(addr, "---------------11000000---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_0, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_0 / base 0x00018000 / mask 0x0001fe00
    elsif std_match(addr, "---------------11000001---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_1, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_1 / base 0x00018200 / mask 0x0001fe00
    elsif std_match(addr, "---------------11000010---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_2, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_2 / base 0x00018400 / mask 0x0001fe00
    elsif std_match(addr, "---------------11000011---------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_ETA_IDX_BITS_MEM_3, IPBUS_SEL_WIDTH)); -- eta_idx_bits_mem_3 / base 0x00018600 / mask 0x0001fe00
    elsif std_match(addr, "---------------1100010----------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_PHI_IDX_BITS_MEM_0, IPBUS_SEL_WIDTH)); -- phi_idx_bits_mem_0 / base 0x00018800 / mask 0x0001fc00
    elsif std_match(addr, "---------------1100011----------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_PHI_IDX_BITS_MEM_1, IPBUS_SEL_WIDTH)); -- phi_idx_bits_mem_1 / base 0x00018c00 / mask 0x0001fc00
    elsif std_match(addr, "---------------1100100----------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_PHI_IDX_BITS_MEM_2, IPBUS_SEL_WIDTH)); -- phi_idx_bits_mem_2 / base 0x00019000 / mask 0x0001fc00
    elsif std_match(addr, "---------------1100101----------") then
      sel := ipbus_sel_t(to_unsigned(N_SLV_PHI_IDX_BITS_MEM_3, IPBUS_SEL_WIDTH)); -- phi_idx_bits_mem_3 / base 0x00019400 / mask 0x0001fc00
-- END automatically generated VHDL

    else
        sel := ipbus_sel_t(to_unsigned(N_SLAVES, IPBUS_SEL_WIDTH));
    end if;

    return sel;

  end function ipbus_sel_gen_calo_idx_bits;

end ipbus_decode_gen_calo_idx_bits;

