LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;

ENTITY Controller IS
    PORT (
        clk : IN STD_LOGIC ;
        reset : IN STD_LOGIC ;
        roll_btn : IN STD_LOGIC ;
        D7 : IN STD_LOGIC ;
        D711 : IN STD_LOGIC ;
        D2312 : IN STD_LOGIC ;
        Eq : IN STD_LOGIC ;
        roll : OUT STD_LOGIC ;
        Sp : OUT STD_LOGIC ;
        Win : OUT STD_LOGIC ;
        Lose : OUT STD_LOGIC
    ) ;

END ENTITY Controller ;

ARCHITECTURE BEHAVIOR OF Controller IS
    TYPE STATE_TYPE IS (IDLE, FIRST_EVAL, POINT, POINT_EVAL, DONE_WIN, DONE_LOSE) ;
    SIGNAL state, next_state : STATE_TYPE := IDLE ;
    SIGNAL roll_btn_prev : STD_LOGIC := '0' ;
    SIGNAL roll_done : STD_LOGIC ;
BEGIN

    roll <= roll_btn ;
    roll_done <= roll_btn_prev AND (NOT roll_btn) ;

    PROCESS (clk)
    BEGIN
        IF RISING_EDGE(clk) THEN
            roll_btn_prev <= roll_btn ;
            IF reset = '1' THEN
                state <= IDLE ;
            ELSE
                state <= next_state ;
            END IF ;
        END IF ;
    END PROCESS ;

    PROCESS (state, roll_done, D7, D711, D2312, Eq)
    BEGIN
    
        next_state <= state ;
        Sp <= '0' ;
        Win <= '0' ;
        Lose <= '0' ;

        CASE state IS

            WHEN IDLE =>
                IF roll_done = '1' THEN
                    next_state <= FIRST_EVAL ;
                END IF ;

            WHEN FIRST_EVAL =>
                IF D711 = '1' THEN
                    next_state <= DONE_WIN ;
                ELSIF D2312 = '1' THEN
                    next_state <= DONE_LOSE ;
                ELSE
                    Sp <= '1' ;
                    next_state <= POINT ;
                END IF ;

            WHEN POINT =>
                IF roll_done = '1' THEN
                    next_state <= POINT_EVAL ;
                END IF ;

            WHEN POINT_EVAL =>
                IF Eq = '1' THEN
                    next_state <= DONE_WIN ;
                ELSIF D7 = '1' THEN
                    next_state <= DONE_LOSE ;
                ELSE
                    next_state <= POINT ;
                END IF ;

            WHEN DONE_WIN =>
                Win <= '1' ;

            WHEN DONE_LOSE =>
                Lose <= '1' ;

        END CASE ;
    END PROCESS ;
END ARCHITECTURE BEHAVIOR ;
