LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;

ENTITY tb_TestLogic IS
END ENTITY tb_TestLogic ;

ARCHITECTURE tb OF tb_TestLogic IS
    SIGNAL sum : STD_LOGIC_VECTOR(3 DOWNTO 0) ;
    SIGNAL D7 : STD_LOGIC ;
    SIGNAL D711 : STD_LOGIC ;
    SIGNAL D2312 : STD_LOGIC ;

BEGIN
    WORK_TEST_LOGIC : ENTITY WORK.TestLogic PORT MAP (
        sum => sum,
        D7 => D7,
        D711 => D711,
        D2312 => D2312
    ) ;
    
    PROCESS
    BEGIN
        sum <= "0000" ; WAIT FOR 10 ns ;
        sum <= "0001" ; WAIT FOR 10 ns ;
        sum <= "0010" ; WAIT FOR 10 ns ;
        sum <= "0011" ; WAIT FOR 10 ns ;
        sum <= "0100" ; WAIT FOR 10 ns ;
        sum <= "0101" ; WAIT FOR 10 ns ;
        sum <= "0110" ; WAIT FOR 10 ns ;
        sum <= "0111" ; WAIT FOR 10 ns ;
        sum <= "1000" ; WAIT FOR 10 ns ;
        sum <= "1001" ; WAIT FOR 10 ns ;
        sum <= "1010" ; WAIT FOR 10 ns ;
        sum <= "1011" ; WAIT FOR 10 ns ;
        sum <= "1100" ; WAIT FOR 10 ns ;
        sum <= "1101" ; WAIT FOR 10 ns ;
        sum <= "1110" ; WAIT FOR 10 ns ;
        sum <= "1111" ; WAIT FOR 10 ns ;
        
        WAIT;
    END PROCESS;
    
END ARCHITECTURE tb ;

-- ghdl -a --std=08 TestLogic.vhdl
-- ghdl -a --std=08 tb_TestLogic.vhdl

-- ghdl -e --std=08 tb_TestLogic

-- ghdl -r --std=08 tb_TestLogic --vcd=testlogic.vcd --stop-time=160ns

-- gtkwave testlogic.vcd