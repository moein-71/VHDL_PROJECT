
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY COUNTER IS 
    PORT (
        clk    : IN  STD_LOGIC;
        reset  : IN  STD_LOGIC;
        roll : IN  STD_LOGIC;  
        count  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)  
    );
END ENTITY COUNTER;

ARCHITECTURE BEHAVIORAL OF COUNTER IS
    SIGNAL count_reg : UNSIGNED(2 DOWNTO 0) := "001";  
BEGIN
    PROCESS (clk)
    BEGIN
        IF RISING_EDGE(clk) THEN
        
            IF reset = '1' THEN
                count_reg <= "001";          
            ELSIF roll = '1' THEN
                IF count_reg = 6 THEN
                    count_reg <= "001";    
                ELSE
                    count_reg <= count_reg + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    count <= STD_LOGIC_VECTOR(count_reg);

END ARCHITECTURE BEHAVIORAL;
