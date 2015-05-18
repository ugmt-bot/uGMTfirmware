library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

use work.mp7_data_types.all;
use work.ipbus.all;
use work.ipbus_decode_uGMT.all;

use work.GMTTypes.all;

entity GMT is
  port (
    iMuonsB     : in TGMTMu_vector(35 downto 0);
    iMuonsO     : in TGMTMu_vector(35 downto 0);
    iMuonsF     : in TGMTMu_vector(35 downto 0);
    iTracksB    : in TGMTMuTracks_vector(11 downto 0);
    iTracksO    : in TGMTMuTracks_vector(11 downto 0);
    iTracksF    : in TGMTMuTracks_vector(11 downto 0);
    iSortRanksB : in TSortRank10_vector(35 downto 0);
    iSortRanksO : in TSortRank10_vector(35 downto 0);
    iSortRanksF : in TSortRank10_vector(35 downto 0);
    iIdxBitsB   : in TIndexBits_vector(35 downto 0);
    iIdxBitsO   : in TIndexBits_vector(35 downto 0);
    iIdxBitsF   : in TIndexBits_vector(35 downto 0);
    iEmptyB     : in std_logic_vector(35 downto 0);
    iEmptyO     : in std_logic_vector(35 downto 0);
    iEmptyF     : in std_logic_vector(35 downto 0);

    iEnergies : in TCaloRegionEtaSlice_vector(31 downto 0);
    -- The outer two slices will be set to '0'. XST should optimize logic
    -- appropriately.

    oIntermediateMuonsB     : out TGMTMu_vector(7 downto 0);
    oIntermediateMuonsO     : out TGMTMu_vector(7 downto 0);
    oIntermediateMuonsF     : out TGMTMu_vector(7 downto 0);
    oIntermediateSortRanksB : out TSortRank10_vector(7 downto 0);
    oIntermediateSortRanksO : out TSortRank10_vector(7 downto 0);
    oIntermediateSortRanksF : out TSortRank10_vector(7 downto 0);
    oFinalCaloIdxBits       : out TCaloIndexBit_vector(7 downto 0);
    oFinalEnergies          : out TCaloArea_vector(7 downto 0);
    oExtrapolatedCoordsB    : out TSpatialCoordinate_vector(35 downto 0);
    oExtrapolatedCoordsO    : out TSpatialCoordinate_vector(35 downto 0);
    oExtrapolatedCoordsF    : out TSpatialCoordinate_vector(35 downto 0);
    oMuIdxBits              : out TIndexBits_vector (7 downto 0);

    oMuons : out TGMTMu_vector(7 downto 0);
    oIso   : out TIsoBits_vector(7 downto 0);

    clk     : in  std_logic;
    clk_ipb : in  std_logic;
    sinit   : in  std_logic;
    ipb_in  : in  ipb_wbus;
    ipb_out : out ipb_rbus
    );
end GMT;

architecture Behavioral of GMT is

  -----------------------------------------------------------------------------
  -- signals
  -----------------------------------------------------------------------------

  -- IPbus
  signal ipbw : ipb_wbus_array(N_SLAVES - 1 downto 0);
  signal ipbr : ipb_rbus_array(N_SLAVES - 1 downto 0);

  -- Core uGMT algos
  signal sIsoBits      : TIsoBits_vector(7 downto 0);
  signal sMuIdxBits    : TIndexBits_vector(7 downto 0);
  signal sFinalMuPt    : TMuonPT_vector(7 downto 0);
  signal sMuons_sorted : TGMTMu_vector(7 downto 0);

  -- For RPC merging.
  signal sMuonsRPCb     : TGMTMuRPC_vector(3 downto 0);
  signal sMuonsRPCf     : TGMTMuRPC_vector(3 downto 0);
  signal sSortRanksRPCb : TSortRank10_vector(3 downto 0);
  signal sSortRanksRPCf : TSortRank10_vector(3 downto 0);
  signal sEmptyRPCb     : std_logic_vector(3 downto 0);
  signal sEmptyRPCf     : std_logic_vector(3 downto 0);
  signal sIdxBitsRPCb   : TIndexBits_vector(3 downto 0);
  signal sIdxBitsRPCf   : TIndexBits_vector(3 downto 0);

  -- For intermediates

  signal sFinalEnergies       : TCaloArea_vector(7 downto 0);
  signal sExtrapolatedCoordsB : TSpatialCoordinate_vector(35 downto 0);
  signal sExtrapolatedCoordsO : TSpatialCoordinate_vector(35 downto 0);
  signal sExtrapolatedCoordsF : TSpatialCoordinate_vector(35 downto 0);

  signal sIntermediateMuonsB     : TGMTMu_vector(7 downto 0);
  signal sIntermediateMuonsO     : TGMTMu_vector(7 downto 0);
  signal sIntermediateMuonsF     : TGMTMu_vector(7 downto 0);
  signal sIntermediateSortRanksB : TSortRank10_vector(7 downto 0);
  signal sIntermediateSortRanksO : TSortRank10_vector(7 downto 0);
  signal sIntermediateSortRanksF : TSortRank10_vector(7 downto 0);
  signal sSelectedCaloIdxBits    : TCaloIndexBit_vector(7 downto 0);
  signal sFinalMuIdxBits         : TIndexBits_vector(7 downto 0);

begin

  -- ipbus address decode
  fabric : entity work.ipbus_fabric_sel
    generic map(
      NSLV      => N_SLAVES,
      SEL_WIDTH => IPBUS_SEL_WIDTH
      )
    port map(
      ipb_in          => ipb_in,
      ipb_out         => ipb_out,
      sel             => ipbus_sel_uGMT(ipb_in.ipb_addr),
      ipb_to_slaves   => ipbw,
      ipb_from_slaves => ipbr
      );

  -----------------------------------------------------------------------------
  -- calo stuff
  -----------------------------------------------------------------------------
  assign_iso : entity work.IsoAssignmentUnit
    port map (
      iEnergies            => iEnergies,
      iMuonsB              => iMuonsB,
      iMuonsO              => iMuonsO,
      iMuonsF              => iMuonsF,
      iMuIdxBits           => sMuIdxBits,
      iFinalMuPt           => sFinalMuPt,
      oIsoBits             => sIsoBits,
      oFinalEnergies       => sFinalEnergies,
      oFinalCaloIdxBits    => sSelectedCaloIdxBits,
      oExtrapolatedCoordsB => sExtrapolatedCoordsB,
      oExtrapolatedCoordsO => sExtrapolatedCoordsO,
      oExtrapolatedCoordsF => sExtrapolatedCoordsF,
      oMuIdxBits           => sFinalMuIdxBits,
      oFinalMuPt           => open,
      clk                  => clk,
      clk_ipb              => clk_ipb,
      sinit                => sinit,
      ipb_in               => ipbw(N_SLV_ISOLATION),
      ipb_out              => ipbr(N_SLV_ISOLATION)
      );

  -----------------------------------------------------------------------------
  -- sorters & COUs
  -----------------------------------------------------------------------------

  sort_and_cancel : entity work.SortAndCancelUnit
    generic map (
      rpc_merging => false)
    port map (
      iMuonsB => iMuonsB,
      iMuonsO => iMuonsO,
      iMuonsF => iMuonsF,

      -- For RPC merging.
      iMuonsRPCb     => sMuonsRPCb,
      iMuonsRPCf     => sMuonsRPCf,
      iSortRanksRPCb => sSortRanksRPCb,
      iSortRanksRPCf => sSortRanksRPCf,
      iEmptyRPCb     => sEmptyRPCb,
      iEmptyRPCf     => sEmptyRPCf,
      iIdxBitsRPCb   => sIdxBitsRPCb,
      iIdxBitsRPCf   => sIdxBitsRPCf,

      iTracksB                => iTracksB,
      iTracksO                => iTracksO,
      iTracksF                => iTracksF,
      iSortRanksB             => iSortRanksB,
      iSortRanksO             => iSortRanksO,
      iSortRanksF             => iSortRanksF,
      iEmptyB                 => iEmptyB,
      iEmptyO                 => iEmptyO,
      iEmptyF                 => iEmptyF,
      iIdxBitsB               => iIdxBitsB,
      iIdxBitsO               => iIdxBitsO,
      iIdxBitsF               => iIdxBitsF,
      oIntermediateMuonsB     => sIntermediateMuonsB,
      oIntermediateMuonsO     => sIntermediateMuonsO,
      oIntermediateMuonsF     => sIntermediateMuonsF,
      oIntermediateSortRanksB => sIntermediateSortRanksB,
      oIntermediateSortRanksO => sIntermediateSortRanksO,
      oIntermediateSortRanksF => sIntermediateSortRanksF,
      oIdxBits                => sMuIdxBits,
      oMuPt                   => sFinalMuPt,
      oMuons                  => sMuons_sorted,
      clk                     => clk,
      clk_ipb                 => clk_ipb,
      sinit                   => sinit,
      ipb_in                  => ipbw(N_SLV_SORTING),
      ipb_out                 => ipbr(N_SLV_SORTING)
      );

  oIntermediateMuonsB     <= sIntermediateMuonsB;
  oIntermediateMuonsO     <= sIntermediateMuonsO;
  oIntermediateMuonsF     <= sIntermediateMuonsF;
  oIntermediateSortRanksB <= sIntermediateSortRanksB;
  oIntermediateSortRanksO <= sIntermediateSortRanksO;
  oIntermediateSortRanksF <= sIntermediateSortRanksF;

  oFinalCaloIdxBits    <= sSelectedCaloIdxBits;
  oFinalEnergies       <= sFinalEnergies;
  oExtrapolatedCoordsB <= sExtrapolatedCoordsB;
  oExtrapolatedCoordsO <= sExtrapolatedCoordsO;
  oExtrapolatedCoordsF <= sExtrapolatedCoordsF;
  oMuIdxBits           <= sFinalMuIdxBits;

  oMuons <= sMuons_sorted;
  oIso   <= sIsoBits;


end Behavioral;
