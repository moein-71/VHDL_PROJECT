LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CrapsTop IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        roll_btn : IN STD_LOGIC;
        seg1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        seg2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        Win : OUT STD_LOGIC;
        Lose : OUT STD_LOGIC
    );
END ENTITY CrapsTop;

ARCHITECTURE STRUCTURAL OF CrapsTop IS
    SIGNAL roll, Sp : STD_LOGIC;
    SIGNAL D7, D711, D2312, Eq : STD_LOGIC;
    SIGNAL dice1, dice2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
   WORK_DATAPATH : ENTITY work.Datapath
        PORT MAP (
            clk => clk,
            reset => reset,
            roll => roll,
            Sp => Sp,
            dice1 => dice1,
            dice2 => dice2,
            D7 => D7,
            D711 => D711,
            D2312 => D2312,
            Eq => Eq
        );

    WORK_CONTROLLER: ENTITY work.Controller
        PORT MAP (
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
        );

    WORK_7SEG1 : ENTITY work.SevenSeg
        PORT MAP (digit => dice1, seg => seg1);

    WORK_7SEG2 : ENTITY work.SevenSeg
        PORT MAP (digit => dice2, seg => seg2);

END ARCHITECTURE STRUCTURAL;
