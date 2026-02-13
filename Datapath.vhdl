LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Datapath IS
    PORT (
        clk    : IN  STD_LOGIC;
        reset  : IN  STD_LOGIC;
        Roll   : IN  STD_LOGIC;
        Sp     : IN  STD_LOGIC;
        dice1  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        dice2  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        D7     : OUT STD_LOGIC;
        D711   : OUT STD_LOGIC;
        D2312  : OUT STD_LOGIC;
        Eq     : OUT STD_LOGIC
    );
END ENTITY Datapath;

ARCHITECTURE Structural OF Datapath IS
    SIGNAL dice1_s : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL dice2_s : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL sum_s   : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL point_s : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    dice1 <= dice1_s;
    dice2 <= dice2_s;

    WORK_COUNTER : ENTITY work.COUNTER
        PORT MAP (clk => clk, reset => reset, roll => Roll, count => dice1_s);

    WORK_COUNTER : ENTITY work.COUNTER
        PORT MAP (clk => clk, reset => reset, roll => Roll, count => dice2_s);

    WORK_ADDER : ENTITY work.Adder
        PORT MAP (a => dice1_s, b => dice2_s, sum => sum_s);

    WORK_POINT_REG : ENTITY work.PointRegister
        PORT MAP (clk => clk, reset => reset, Sp => Sp, sum => sum_s, point => point_s);

    WORK_COMPARATOR : ENTITY work.Comprator
        PORT MAP (sum => sum_s, point => point_s, Eq => Eq);

    WORK_TEST_LOGIC : ENTITY work.TestLogic
        PORT MAP (sum => sum_s, D7 => D7, D711 => D711, D2312 => D2312);
END ARCHITECTURE Structural;
