library IEEE;
use IEEE.std_logic_1164.all;

entity ct_reorder_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_from_ct: in std_logic_vector(127 downto 0); 
    din: in std_logic_vector(127 downto 0); 
    reorder_addr_in: in std_logic_vector(7 downto 0); 
    reorder_addr_out: in std_logic_vector(7 downto 0); 
    reorder_we: in std_logic; 
    sync: in std_logic; 
    sync_from_ct: in std_logic; 
    data_to_ct: out std_logic_vector(127 downto 0); 
    dout: out std_logic_vector(127 downto 0); 
    sync_out: out std_logic; 
    sync_to_ct: out std_logic
  );
end ct_reorder_core;

architecture structural of ct_reorder_core is
begin
end structural;

