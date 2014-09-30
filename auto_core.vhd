library IEEE;
use IEEE.std_logic_1164.all;

entity auto_core is
  port (
    acc_len: in std_logic_vector(19 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(287 downto 0); 
    noise_on: in std_logic; 
    sync: in std_logic; 
    dout0: out std_logic_vector(127 downto 0); 
    dout1: out std_logic_vector(127 downto 0); 
    dout2: out std_logic_vector(127 downto 0); 
    dout3: out std_logic_vector(127 downto 0); 
    sync_out: out std_logic; 
    vld: out std_logic
  );
end auto_core;

architecture structural of auto_core is
begin
end structural;

