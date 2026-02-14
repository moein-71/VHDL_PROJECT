LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY tb_PointRegister IS
END ENTITY ;

ARCHITECTURE tb OF tb_PointRegister IS

    SIGNAL clk : STD_LOGIC := '0' ;
    SIGNAL reset : STD_LOGIC := '0';
    SIGNAL Sp : STD_LOGIC := '0' ;
    SIGNAL sum : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0')  ;
    SIGNAL point : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0') ;

BEGIN

    WORK_POINT_REG : ENTITY work.PointRegister
        PORT MAP (
            clk => clk,
            reset => reset,
            Sp => Sp,
            sum => sum,
            point => point
        ) ;

    clk_process : PROCESS
    BEGIN
        clk <= NOT clk ;
        WAIT FOR 10 ns  ;
    END PROCESS ;

    POINTREGISTER_proc : PROCESS
    BEGIN

        reset <= '1' ;
        WAIT FOR 25 ns ;
        reset <= '0' ;
        WAIT FOR 20 ns ;

        sum <= "0111" ;
        Sp  <= '1' ;
        WAIT FOR 20 ns ;
        Sp  <= '0' ;
        WAIT FOR 20 ns ;

        sum <= "1010" ;
        WAIT FOR 40 ns;

        Sp <= '1' ;
        WAIT FOR 20 ns ;
        Sp <= '0' ;
        WAIT FOR 20 ns ;

        reset <= '1' ;
        WAIT FOR 20 ns ;
        reset <= '0' ;
        WAIT FOR 20 ns ;

        WAIT ;
    END PROCESS;

END ARCHITECTURE tb  ;

-- ghdl -a --std=08 PointRegister.vhdl
-- ghdl -a --std=08 tb_PointRegister.vhdl
-- ghdl -e --std=08 tb_PointRegister
-- ghdl -r --std=08 tb_PointRegister --vcd=pointreg.vcd --stop-time=250ns
-- gtkwave pointreg.vcd