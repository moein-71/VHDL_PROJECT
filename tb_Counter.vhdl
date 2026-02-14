LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY tb_Counter IS
END ENTITY ;

ARCHITECTURE tb OF tb_Counter IS
    SIGNAL clk   : STD_LOGIC := '0' ;
    SIGNAL reset : STD_LOGIC := '0' ;
    SIGNAL roll  : STD_LOGIC := '0' ;
    SIGNAL count : STD_LOGIC_VECTOR(2 DOWNTO 0) ;
BEGIN

    WORK_COUNTER : ENTITY work.COUNTER
        PORT MAP (
            clk   => clk,
            reset => reset,
            roll  => roll,
            count => count
        ) ;

    clk_process : PROCESS
    BEGIN
        clk <= NOT clk ;
        WAIT FOR 10 ns ;
    END PROCESS ;

    Counter_proc : PROCESS
    BEGIN
        reset <= '1' ;
        WAIT FOR 20 ns ;
        reset <= '0' ;
        WAIT FOR 20 ns ;

        roll <= '1' ;
        WAIT FOR 140 ns ;
        roll <= '0' ;
        WAIT FOR 40 ns ;

        roll <= '1' ;
        WAIT FOR 120 ns ;
        roll <= '0' ;
        WAIT FOR 40 ns ;

        reset <= '1' ;
        WAIT FOR 20 ns ;
        reset <= '0' ;
        WAIT ;

    END PROCESS ;

END ARCHITECTURE tb ;


-- ghdl -a --std=08 Counter.vhdl
-- ghdl -a --std=08 tb_Counter.vhdl

-- ghdl -e --std=08 tb_COUNTER 

-- ghdl -r --std=08 tb_COUNTER --vcd=counter.vcd --stop-time=300ns

-- gtkwave counter.vcd