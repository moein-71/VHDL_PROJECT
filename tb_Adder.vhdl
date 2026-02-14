LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY tb_Adder IS
END ENTITY ;

ARCHITECTURE tb OF tb_Adder IS

    SIGNAL a : STD_LOGIC_VECTOR(2 DOWNTO 0) ;
    SIGNAL b : STD_LOGIC_VECTOR(2 DOWNTO 0) ;
    SIGNAL sum : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

    WORK_ADDER : ENTITY work.Adder
        PORT MAP (
            a => a,
            b => b,
            sum => sum
        ) ;

    stim_proc : PROCESS
    BEGIN

        a <= "001" ;  
        b <= "001" ;
        WAIT FOR 20 ns ;

        a <= "011" ;  
        b <= "100" ;  
        WAIT FOR 20 ns ;

        a <= "110" ;  
        b <= "110" ;  
        WAIT FOR 20 ns ;

        a <= "010" ;  
        b <= "101" ;  
        WAIT FOR 20 ns ;

    END PROCESS ;

END ARCHITECTURE ;

-- ghdl -a --std=08 Adder.vhdl
-- ghdl -a --std=08 tb_Adder.vhdl
-- ghdl -e --std=08 tb_Adder
-- ghdl -r --std=08 tb_Adder --vcd=adder.vcd --stop-time=100ns
-- gtkwave adder.vcd
