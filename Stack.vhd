-- ******************************************
-- *	EQUIPO 
-- *	INTEGRANTES:
-- *		CRUZ ARREDONDO CESAR
-- *		GARCÍA BARRERA GUADALUPE
-- *		LOPEZ AYALA ERIC ALEJANDRO
-- ******************************************

-- ** DEFINICION --
-- # PILA DE MEMORIA DE 16 BITS x 8 NIVELES.
-- # TECNOLOGIA FF'S (REGISTROS).

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY STACK IS
	PORT(D	:  IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		  CLR	: IN STD_LOGIC;
		  UP	: IN STD_LOGIC;
		  DW	: IN STD_LOGIC;
		  WPC	: IN STD_LOGIC;
		  CLK	: IN STD_LOGIC;
		  Q		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		  );
END STACK;

ARCHITECTURE STACK_PROGRAM OF STACK IS
	BEGIN
		USE_STACK: PROCESS(CLR,CLK)
		VARIABLE SP: INTEGER RANGE 0 TO 7;
		TYPE STK IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
		VARIABLE PCS: STK;
			BEGIN
				IF(CLR='0') THEN
					Q <= X"0000";
					PCS := (OTHERS => (OTHERS => '0'));
					SP  := 0;
				ELSE
					IF(RISING_EDGE(CLK)) THEN
						--OP_STACK: PROCESS(WPC,UP,DW)
							--BEGIN
								IF((WPC = '0') AND (UP = '0') AND (DW = '0')) THEN
									PCS(SP) := PCS(SP) + "1";
								ELSIF((WPC = '1') AND (UP = '0') AND (DW = '0')) THEN
									PCS(SP) := D;
								ELSIF((WPC = '1') AND (UP = '1') AND (DW = '0')) THEN
									SP := SP + 1;
									PCS(SP) := D;
								ELSIF((WPC = '0') AND (UP = '0') AND (DW = '1')) THEN
									SP := SP - 1;
									PCS(SP) := PCS(SP) + "1";
								END IF;
								Q <= PCS(SP);
							--END PROCESS;
					END IF;
				END IF;
			END PROCESS;
	END STACK_PROGRAM;