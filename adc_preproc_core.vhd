library IEEE;
use IEEE.std_logic_1164.all;

entity adc_preproc_core is
  port (
    acc_len: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    i0: in std_logic_vector(7 downto 0); 
    i1: in std_logic_vector(7 downto 0); 
    i10: in std_logic_vector(7 downto 0); 
    i11: in std_logic_vector(7 downto 0); 
    i12: in std_logic_vector(7 downto 0); 
    i13: in std_logic_vector(7 downto 0); 
    i14: in std_logic_vector(7 downto 0); 
    i15: in std_logic_vector(7 downto 0); 
    i2: in std_logic_vector(7 downto 0); 
    i3: in std_logic_vector(7 downto 0); 
    i4: in std_logic_vector(7 downto 0); 
    i5: in std_logic_vector(7 downto 0); 
    i6: in std_logic_vector(7 downto 0); 
    i7: in std_logic_vector(7 downto 0); 
    i8: in std_logic_vector(7 downto 0); 
    i9: in std_logic_vector(7 downto 0); 
    inv_en: in std_logic; 
    noise_en: in std_logic; 
    noise_seed: in std_logic_vector(31 downto 0); 
    ns_invert: in std_logic; 
    ps_invert: in std_logic; 
    seed_load: in std_logic; 
    sync: in std_logic; 
    dout: out std_logic_vector(127 downto 0); 
    pow_sum: out std_logic_vector(63 downto 0); 
    sync_out: out std_logic
  );
end adc_preproc_core;

architecture structural of adc_preproc_core is
begin
end structural;

