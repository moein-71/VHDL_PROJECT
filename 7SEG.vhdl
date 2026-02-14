LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;

ENTITY SevenSeg IS
    PORT (
        digit : IN STD_LOGIC_VECTOR(2 DOWNTO 0) ;
        seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    ) ;
END ENTITY SevenSeg ;

ARCHITECTURE BEHAVIOR OF SevenSeg IS
BEGIN
    WITH digit SELECT
        seg <= "0011000" WHEN "001", -- 18 = 1 
              "1101110" WHEN "010",  -- 6E = 2 
              "1111001" WHEN "011",  -- 79 = 3 
              "0110011" WHEN "100",  -- 33 = 4 
              "1011011" WHEN "101",  -- 5B = 5 
              "1011111" WHEN "110",  -- 5F = 6
              "0000000" WHEN OTHERS ;
END ARCHITECTURE BEHAVIOR  ;
