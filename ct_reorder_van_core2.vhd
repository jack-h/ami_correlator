library IEEE;
use IEEE.std_logic_1164.all;

entity ct_reorder_van_core2 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(63 downto 0); 
    sync: in std_logic; 
    dout: out std_logic_vector(63 downto 0); 
    sync_out: out std_logic
  );
end ct_reorder_van_core2;

architecture structural of ct_reorder_van_core2 is
begin
end structural;

