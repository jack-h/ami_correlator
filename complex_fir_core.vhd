library IEEE;
use IEEE.std_logic_1164.all;

entity complex_fir_core is
  port (
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
    q0: in std_logic_vector(7 downto 0); 
    q1: in std_logic_vector(7 downto 0); 
    q10: in std_logic_vector(7 downto 0); 
    q11: in std_logic_vector(7 downto 0); 
    q12: in std_logic_vector(7 downto 0); 
    q13: in std_logic_vector(7 downto 0); 
    q14: in std_logic_vector(7 downto 0); 
    q15: in std_logic_vector(7 downto 0); 
    q2: in std_logic_vector(7 downto 0); 
    q3: in std_logic_vector(7 downto 0); 
    q4: in std_logic_vector(7 downto 0); 
    q5: in std_logic_vector(7 downto 0); 
    q6: in std_logic_vector(7 downto 0); 
    q7: in std_logic_vector(7 downto 0); 
    q8: in std_logic_vector(7 downto 0); 
    q9: in std_logic_vector(7 downto 0); 
    sync: in std_logic; 
    iout_0i: out std_logic_vector(17 downto 0); 
    iout_10i: out std_logic_vector(17 downto 0); 
    iout_11i: out std_logic_vector(17 downto 0); 
    iout_12i: out std_logic_vector(17 downto 0); 
    iout_13i: out std_logic_vector(17 downto 0); 
    iout_14i: out std_logic_vector(17 downto 0); 
    iout_15i: out std_logic_vector(17 downto 0); 
    iout_1i: out std_logic_vector(17 downto 0); 
    iout_2i: out std_logic_vector(17 downto 0); 
    iout_3i: out std_logic_vector(17 downto 0); 
    iout_4i: out std_logic_vector(17 downto 0); 
    iout_5i: out std_logic_vector(17 downto 0); 
    iout_6i: out std_logic_vector(17 downto 0); 
    iout_7i: out std_logic_vector(17 downto 0); 
    iout_8i: out std_logic_vector(17 downto 0); 
    iout_9i: out std_logic_vector(17 downto 0); 
    qout_0i: out std_logic_vector(17 downto 0); 
    qout_10i: out std_logic_vector(17 downto 0); 
    qout_11i: out std_logic_vector(17 downto 0); 
    qout_12i: out std_logic_vector(17 downto 0); 
    qout_13i: out std_logic_vector(17 downto 0); 
    qout_14i: out std_logic_vector(17 downto 0); 
    qout_15i: out std_logic_vector(17 downto 0); 
    qout_1i: out std_logic_vector(17 downto 0); 
    qout_2i: out std_logic_vector(17 downto 0); 
    qout_3i: out std_logic_vector(17 downto 0); 
    qout_4i: out std_logic_vector(17 downto 0); 
    qout_5i: out std_logic_vector(17 downto 0); 
    qout_6i: out std_logic_vector(17 downto 0); 
    qout_7i: out std_logic_vector(17 downto 0); 
    qout_8i: out std_logic_vector(17 downto 0); 
    qout_9i: out std_logic_vector(17 downto 0); 
    sync_out: out std_logic
  );
end complex_fir_core;

architecture structural of complex_fir_core is
begin
end structural;

