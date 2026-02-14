LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_Full IS
END ENTITY;

ARCHITECTURE tb OF tb_Full IS

    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL reset : STD_LOGIC := '0';
    SIGNAL roll_btn : STD_LOGIC := '0';

    SIGNAL seg1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL seg2 : STD_LOGIC_VECTOR(6 DOWNTO 0);

    SIGNAL Win : STD_LOGIC;
    SIGNAL Lose : STD_LOGIC;

BEGIN

    -- WORK_DATAPATH : ENTITY work.Datapath
    --     PORT MAP (
    --         clk => clk,
    --         reset => reset,
    --         roll => roll,
    --         Sp => Sp,
    --         dice1 => dice1,
    --         dice2 => dice2,
    --         D7 => D7,
    --         D711 => D711,
    --         D2312 => D2312,
    --         Eq => Eq
    --     );

    -- WORK_CONTROLLER: ENTITY work.Controller
    --     PORT MAP (
    --         clk => clk,
    --         reset => reset,
    --         roll_btn => roll_btn,
    --         D7 => D7,
    --         D711 => D711,
    --         D2312 => D2312,
    --         Eq => Eq,
    --         roll => roll,
    --         Sp => Sp,
    --         Win => Win,
    --         Lose => Lose
    --     );

    WORK_CRAPS_GAME : ENTITY work.CrapsGame
        PORT MAP (
            clk => clk,
            reset => reset,
            roll_btn => roll_btn,
            seg1 => seg1, 
            seg2 => seg2 ,
            Win => Win,
            Lose => Lose
        ) ;

    clk_process : PROCESS
    BEGIN
        clk <= NOT clk;
        WAIT FOR 10 ns;
    END PROCESS;


    stim_proc : PROCESS
    BEGIN

        reset <= '1';
        WAIT FOR 20 ns;
        reset <= '0';
        WAIT FOR 20 ns;

        roll_btn <= '1';
        WAIT FOR 150 ns;
        roll_btn <= '0';
        WAIT FOR 200 ns;

        reset <= '1';
        WAIT FOR 20 ns;
        reset <= '0';
        WAIT FOR 20 ns;

        roll_btn <= '1';
        WAIT FOR 100 ns;
        roll_btn <= '0';
        WAIT FOR 100 ns;

        reset <= '1';
        WAIT FOR 20 ns;
        reset <= '0';
        WAIT FOR 20 ns;

        roll_btn <= '1';
        WAIT FOR 120 ns;
        roll_btn <= '0';
        WAIT FOR 200 ns;

        WAIT;
    END PROCESS;

END ARCHITECTURE;
