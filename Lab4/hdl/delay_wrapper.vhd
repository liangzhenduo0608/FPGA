-------------------------------------------------------------------------------
-- delay_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library axi_timer_v1_01_a;
use axi_timer_v1_01_a.all;

entity delay_wrapper is
  port (
    CaptureTrig0 : in std_logic;
    CaptureTrig1 : in std_logic;
    GenerateOut0 : out std_logic;
    GenerateOut1 : out std_logic;
    PWM0 : out std_logic;
    Interrupt : out std_logic;
    Freeze : in std_logic;
    S_AXI_ACLK : in std_logic;
    S_AXI_ARESETN : in std_logic;
    S_AXI_AWADDR : in std_logic_vector(31 downto 0);
    S_AXI_AWVALID : in std_logic;
    S_AXI_AWREADY : out std_logic;
    S_AXI_WDATA : in std_logic_vector(31 downto 0);
    S_AXI_WSTRB : in std_logic_vector(3 downto 0);
    S_AXI_WVALID : in std_logic;
    S_AXI_WREADY : out std_logic;
    S_AXI_BRESP : out std_logic_vector(1 downto 0);
    S_AXI_BVALID : out std_logic;
    S_AXI_BREADY : in std_logic;
    S_AXI_ARADDR : in std_logic_vector(31 downto 0);
    S_AXI_ARVALID : in std_logic;
    S_AXI_ARREADY : out std_logic;
    S_AXI_RDATA : out std_logic_vector(31 downto 0);
    S_AXI_RRESP : out std_logic_vector(1 downto 0);
    S_AXI_RVALID : out std_logic;
    S_AXI_RREADY : in std_logic
  );

  attribute x_core_info : STRING;
  attribute x_core_info of delay_wrapper : entity is "axi_timer_v1_01_a";

end delay_wrapper;

architecture STRUCTURE of delay_wrapper is

  component axi_timer is
    generic (
      C_FAMILY : STRING;
      C_COUNT_WIDTH : INTEGER;
      C_ONE_TIMER_ONLY : INTEGER;
      C_TRIG0_ASSERT : std_logic;
      C_TRIG1_ASSERT : std_logic;
      C_GEN0_ASSERT : std_logic;
      C_GEN1_ASSERT : std_logic;
      C_BASEADDR : std_logic_vector(31 downto 0);
      C_HIGHADDR : std_logic_vector(31 downto 0);
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_DATA_WIDTH : INTEGER
    );
    port (
      CaptureTrig0 : in std_logic;
      CaptureTrig1 : in std_logic;
      GenerateOut0 : out std_logic;
      GenerateOut1 : out std_logic;
      PWM0 : out std_logic;
      Interrupt : out std_logic;
      Freeze : in std_logic;
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      S_AXI_AWADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXI_WDATA : in std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_WSTRB : in std_logic_vector(((C_S_AXI_DATA_WIDTH/8)-1) downto 0);
      S_AXI_WVALID : in std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RDATA : out std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RVALID : out std_logic;
      S_AXI_RREADY : in std_logic
    );
  end component;

begin

  delay : axi_timer
    generic map (
      C_FAMILY => "spartan6",
      C_COUNT_WIDTH => 32,
      C_ONE_TIMER_ONLY => 1,
      C_TRIG0_ASSERT => '1',
      C_TRIG1_ASSERT => '1',
      C_GEN0_ASSERT => '1',
      C_GEN1_ASSERT => '1',
      C_BASEADDR => X"41c00000",
      C_HIGHADDR => X"41c0ffff",
      C_S_AXI_ADDR_WIDTH => 32,
      C_S_AXI_DATA_WIDTH => 32
    )
    port map (
      CaptureTrig0 => CaptureTrig0,
      CaptureTrig1 => CaptureTrig1,
      GenerateOut0 => GenerateOut0,
      GenerateOut1 => GenerateOut1,
      PWM0 => PWM0,
      Interrupt => Interrupt,
      Freeze => Freeze,
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_AWADDR => S_AXI_AWADDR,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_WDATA => S_AXI_WDATA,
      S_AXI_WSTRB => S_AXI_WSTRB,
      S_AXI_WVALID => S_AXI_WVALID,
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_BRESP => S_AXI_BRESP,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_ARADDR => S_AXI_ARADDR,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_RDATA => S_AXI_RDATA,
      S_AXI_RRESP => S_AXI_RRESP,
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_RREADY => S_AXI_RREADY
    );

end architecture STRUCTURE;
