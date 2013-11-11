library IEEE;
use IEEE.std_logic_1164.all;

entity sb_cross_mult_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din0: in std_logic_vector(63 downto 0); 
    din1: in std_logic_vector(63 downto 0); 
    sync_in: in std_logic; 
    dout00: out std_logic_vector(143 downto 0); 
    dout01: out std_logic_vector(143 downto 0); 
    dout11: out std_logic_vector(143 downto 0); 
    sync_out: out std_logic
  );
end sb_cross_mult_core;

architecture structural of sb_cross_mult_core is
begin
end structural;

