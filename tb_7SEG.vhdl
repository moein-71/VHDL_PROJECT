LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;

ENTITY tb_SevenSeg IS
END ENTITY tb_SevenSeg ;

ARCHITECTURE tb OF tb_SevenSeg IS
    SIGNAL digit : STD_LOGIC_VECTOR(2 DOWNTO 0) ;
    SIGNAL seg : STD_LOGIC_VECTOR(6 DOWNTO 0) ;
BEGIN
    uut: ENTITY WORK.SevenSeg PORT MAP (
        digit => digit,
        seg => seg
    ) ;
    
    PROCESS
    BEGIN
        digit <= "001" ; WAIT FOR 10 ns ;
        digit <= "010" ; WAIT FOR 10 ns ;
        digit <= "011" ; WAIT FOR 10 ns ;
        digit <= "100" ; WAIT FOR 10 ns ;
        digit <= "101" ; WAIT FOR 10 ns ;
        digit <= "110" ; WAIT FOR 10 ns ;
        digit <= "111" ; WAIT FOR 10 ns ;
        digit <= "000" ; WAIT FOR 10 ns ;
        
        WAIT ;
    END PROCESS;
    
END ARCHITECTURE tb  ;

-- ghdl -a --std=08 7SEG.vhdl
-- ghdl -a --std=08 tb_7SEG.vhdl

-- ghdl -e --std=08 tb_SevenSeg

-- ghdl -r --std=08 tb_SevenSeg --vcd=7seg.vcd --stop-time=80ns

-- gtkwave 7seg.vcd