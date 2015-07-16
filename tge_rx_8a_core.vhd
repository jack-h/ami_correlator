library IEEE;
use IEEE.std_logic_1164.all;

entity tge_rx_8a_core is
  port (
    ant_id: in std_logic_vector(3 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    gbe_din: in std_logic_vector(63 downto 0); 
    gbe_eof: in std_logic; 
    gbe_vld: in std_logic; 
    lb_din: in std_logic_vector(63 downto 0); 
    lb_eof: in std_logic; 
    lb_vld: in std_logic; 
    rd_addr: in std_logic_vector(11 downto 0); 
    rd_en: in std_logic; 
    dout: out std_logic_vector(127 downto 0); 
    lb_bad_addr: out std_logic_vector(11 downto 0); 
    lb_err: out std_logic; 
    lb_order_err: out std_logic; 
    lb_pkt_err: out std_logic; 
    max_buf: out std_logic_vector(6 downto 0); 
    mcnt_out: out std_logic_vector(47 downto 0); 
    sync_out: out std_logic; 
    tge_bad_addr: out std_logic_vector(11 downto 0); 
    tge_err: out std_logic; 
    tge_order_err: out std_logic; 
    tge_pkt_err: out std_logic; 
    vld_out: out std_logic
  );
end tge_rx_8a_core;

architecture structural of tge_rx_8a_core is
begin
end structural;

