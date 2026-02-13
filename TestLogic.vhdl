LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;

ENTITY ConditionLogic IS
    PORT (
        sum : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        D7 : OUT STD_LOGIC;
        D711 : OUT STD_LOGIC;
        D2312 : OUT STD_LOGIC
    );
END ENTITY TestLogic ;

ARCHITECTURE BEHAVIOR OF TestLogic IS
BEGIN
    D7    <= '1' WHEN sum = "0111" ELSE '0' ;   
    D711  <= '1' WHEN sum = "0111" OR sum = "1011" ELSE '0' ;   
    D2312 <= '1' WHEN sum = "0010" OR sum = "0011" OR sum = "1100" ELSE '0' ;  
END ARCHITECTURE BEHAVIOR ;
