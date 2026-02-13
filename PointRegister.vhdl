LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY PointRegister IS
    PORT (
        clk   : IN  STD_LOGIC ;
        reset : IN  STD_LOGIC ;
        Sp    : IN  STD_LOGIC ;   
        sum   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0) ;
        point : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    ) ;
END ENTITY PointRegister ;

ARCHITECTURE BEHAVIOR OF PointRegister IS
    SIGNAL point_save : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0') ;
BEGIN
    PROCESS (clk)
    BEGIN
        IF RISING_EDGE(clk) THEN
            IF reset = '1' THEN
                point_save <= (OTHERS => '0') ;
            ELSIF Sp = '1' THEN
                point_save <= sum ;
            END IF ;
        END IF ;
    END PROCESS ;

    point <= point_save ;
END ARCHITECTURE BEHAVIOR ;
