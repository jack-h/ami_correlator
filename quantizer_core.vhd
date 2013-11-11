library IEEE;
use IEEE.std_logic_1164.all;

entity quantizer_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coeff_in: in std_logic_vector(127 downto 0); 
    data_in: in std_logic_vector(287 downto 0); 
    sync_in: in std_logic; 
    dout: out std_logic_vector(63 downto 0); 
    oflow: out std_logic; 
    sync_out: out std_logic
  );
end quantizer_core;

architecture structural of quantizer_core is
begin
end structural;

