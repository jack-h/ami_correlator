library IEEE;
use IEEE.std_logic_1164.all;

entity tge_rx_out_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    max_buf: in std_logic_vector(6 downto 0); 
    link_cnt: out std_logic_vector(1 downto 0); 
    rd_addr: out std_logic_vector(12 downto 0); 
    rd_en0: out std_logic; 
    rd_en1: out std_logic; 
    rd_en2: out std_logic; 
    rd_en3: out std_logic
  );
end tge_rx_out_core;

architecture structural of tge_rx_out_core is
begin
end structural;

