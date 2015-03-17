library IEEE;
use IEEE.std_logic_1164.all;

entity ct_reorder_van_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_from_ct: in std_logic_vector(127 downto 0); 
    din: in std_logic_vector(127 downto 0); 
    sync: in std_logic; 
    sync_from_ct: in std_logic; 
    data_to_ct: out std_logic_vector(127 downto 0); 
    dout: out std_logic_vector(127 downto 0); 
    sync_out: out std_logic; 
    sync_to_ct: out std_logic
  );
end ct_reorder_van_core;

architecture structural of ct_reorder_van_core is
begin
end structural;

