LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;

ENTITY tb_Comprator IS
END ENTITY tb_Comprator ;

ARCHITECTURE tb OF tb_Comprator IS
    SIGNAL sum : STD_LOGIC_VECTOR(3 DOWNTO 0) ;
    SIGNAL point : STD_LOGIC_VECTOR(3 DOWNTO 0) ;
    SIGNAL Eq : STD_LOGIC ;
BEGIN
    WORK_COMPRATOR : ENTITY WORK.Comprator PORT MAP (
        sum => sum,
        point => point,
        Eq => Eq
    ) ;
    
    PROCESS
    BEGIN
        sum <= "0101" ;
        point <= "0101" ;
        WAIT FOR 10 ns ;
        
        sum <= "0110" ;
        point <= "0101" ;
        WAIT FOR 10 ns ;
        
        sum <= "0000" ;
        point <= "0000" ;
        WAIT FOR 10 ns ;
        
        sum <= "1111" ;
        point <= "1110" ;
        WAIT FOR 10 ns ;
        
        sum <= "1111" ;
        point <= "1111" ;
        WAIT FOR 10 ns ;
        
        sum <= "1010" ;
        point <= "0101" ;
        WAIT FOR 10 ns ;
        
        sum <= "1100" ;
        point <= "1100" ;
        WAIT FOR 10 ns ;
        
        WAIT ;
    END PROCESS ;
    
END ARCHITECTURE tb  ;

-- ghdl -a --std=08 Comprator.vhdl
-- ghdl -a --std=08 tb_Comprator.vhdl

-- ghdl -e --std=08 tb_Comprator

-- ghdl -r --std=08 tb_Comprator --vcd=comprator.vcd --stop-time=100ns

-- gtkwave comprator.vcd


