library IEEE;
use IEEE.std_logic_1164.all;

entity fine_delay_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    coarse_del: in std_logic_vector(14 downto 0); 
    d_dt_delay: in std_logic_vector(15 downto 0); 
    d_dt_phase: in std_logic_vector(15 downto 0); 
    din: in std_logic_vector(287 downto 0); 
    en: in std_logic; 
    frac_delay: in std_logic_vector(15 downto 0); 
    phase: in std_logic_vector(15 downto 0); 
    sync_in: in std_logic; 
    dout: out std_logic_vector(287 downto 0); 
    sync_out: out std_logic
  );
end fine_delay_core;

architecture structural of fine_delay_core is
begin
end structural;

