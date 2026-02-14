LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;

ENTITY tb_Controller IS
END ENTITY tb_Controller ;

ARCHITECTURE tb OF tb_Controller IS
    SIGNAL clk : STD_LOGIC := '0' ;
    SIGNAL reset : STD_LOGIC := '0' ;
    SIGNAL roll_btn : STD_LOGIC := '0' ;
    SIGNAL D7 : STD_LOGIC := '0' ;
    SIGNAL D711 : STD_LOGIC := '0' ;
    SIGNAL D2312 : STD_LOGIC := '0' ;
    SIGNAL Eq : STD_LOGIC := '0' ;
    SIGNAL roll : STD_LOGIC ;
    SIGNAL Sp : STD_LOGIC ;
    SIGNAL Win : STD_LOGIC ;
    SIGNAL Lose : STD_LOGIC ;
    
BEGIN

    WORK_CONTROLLER : ENTITY WORK.Controller PORT MAP (
        clk => clk,
        reset => reset,
        roll_btn => roll_btn,
        D7 => D7,
        D711 => D711,
        D2312 => D2312,
        Eq => Eq,
        roll => roll,
        Sp => Sp,
        Win => Win,
        Lose => Lose
    ) ;
    
    clk_process : PROCESS
    BEGIN
        clk <= NOT clk ;
        WAIT FOR 10 ns ;
    END PROCESS ;  

    PROCESS
    BEGIN
         reset <= '1';
        WAIT FOR 30 ns;
        reset <= '0';
        WAIT FOR 30 ns;
        
         roll_btn <= '1';
        WAIT FOR 40 ns;
        roll_btn <= '0';
        WAIT FOR 20 ns;

        D711 <= '1';
        WAIT FOR 40 ns;
        D711 <= '0';
        WAIT FOR 60 ns;

        reset <= '1';
        WAIT FOR 30 ns;
        reset <= '0';
        WAIT FOR 30 ns;

        roll_btn <= '1';
        WAIT FOR 40 ns;
        roll_btn <= '0';
        WAIT FOR 20 ns;

        D2312 <= '1';
        WAIT FOR 40 ns;
        D2312 <= '0';
        WAIT FOR 60 ns;

        reset <= '1';
        WAIT FOR 30 ns;
        reset <= '0';
        WAIT FOR 30 ns;
        
         roll_btn <= '1';
        WAIT FOR 40 ns;
        roll_btn <= '0';
        WAIT FOR 60 ns;

        roll_btn <= '1';
        WAIT FOR 40 ns;
        roll_btn <= '0';
        WAIT FOR 20 ns;

          Eq <= '1';
        WAIT FOR 40 ns;
        Eq <= '0';
        WAIT FOR 60 ns;

         reset <= '1';
        WAIT FOR 30 ns;
        reset <= '0';
        WAIT FOR 30 ns;

        roll_btn <= '1';
        WAIT FOR 40 ns;
        roll_btn <= '0';
        WAIT FOR 60 ns;

        roll_btn <= '1';
        WAIT FOR 40 ns;
        roll_btn <= '0';
        WAIT FOR 20 ns;

        D7 <= '1';
        WAIT FOR 40 ns;
        D7 <= '0';
        WAIT FOR 80 ns;

        WAIT ;
    END PROCESS ;
END ARCHITECTURE tb  ;

-- ghdl -a --std=08 Controller.vhdl
-- ghdl -a --std=08 tb_Controller.vhdl

-- ghdl -e --std=08 tb_Controller

-- ghdl -r --std=08 tb_Controller --vcd=controller.vcd --stop-time=1200ns

-- gtkwave controller.vcd