library IEEE;
use IEEE.std_logic_1164.all;

entity sb_vacc_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din00: in std_logic_vector(143 downto 0); 
    din01: in std_logic_vector(143 downto 0); 
    din11: in std_logic_vector(143 downto 0); 
    sync_in: in std_logic; 
    dout00: out std_logic_vector(11 downto 0); 
    dout01: out std_logic_vector(11 downto 0); 
    dout11: out std_logic_vector(11 downto 0); 
    vld: out std_logic
  );
end sb_vacc_core;

architecture structural of sb_vacc_core is
begin
end structural;

