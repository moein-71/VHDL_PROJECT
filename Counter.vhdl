
LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY COUNTER IS 
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        roll : IN STD_LOGIC;
        count : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END ENTITY COUNTER ;

ARCHITECTURE BEHAVIOR OF COUNTER IS
    SIGNAL count_save : UNSIGNED(2 DOWNTO 0) := "001" ;  
BEGIN
    PROCESS (clk)
    BEGIN
        IF RISING_EDGE(clk) THEN
        
            IF reset = '1' THEN
                count_save <= "001" ;          
            ELSIF roll = '1' THEN
                IF count_save = 6 THEN
                    count_save <= "001" ;    
                ELSE
                    count_save <= count_save + 1 ;
                END IF ;
            END IF ;
        END IF ;
    END PROCESS ;

    count <= STD_LOGIC_VECTOR(count_save) ;

END ARCHITECTURE BEHAVIOR ;
