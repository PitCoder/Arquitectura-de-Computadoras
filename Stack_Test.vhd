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
 
ENTITY STACK_TEST IS
END STACK_TEST;
 
ARCHITECTURE BEHAVIOR OF STACK_TEST IS 
 
    -- COMPONENT DECLARATION FOR THE UNIT UNDER TEST (UUT)
 
    COMPONENT STACK
    PORT(
         D 	 : IN  std_logic_vector(15 downto 0);
         CLR : IN  std_logic;
         UP  : IN  std_logic;
         DW  : IN  std_logic;
         WPC : IN  std_logic;
         CLK : IN  std_logic;
         Q 	 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --INPUTS
   SIGNAL D   : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
   SIGNAL CLR : STD_LOGIC := '0';
   SIGNAL UP  : STD_LOGIC := '0';
   SIGNAL DW  : STD_LOGIC := '0';
   SIGNAL WPC : STD_LOGIC := '0';
   SIGNAL CLK : STD_LOGIC := '0';

 	--OUTPUTS
   SIGNAL Q : STD_LOGIC_VECTOR(15 DOWNTO 0);

   -- CLOCK PERIOD DEFINITIONS
   CONSTANT CLK_PERIOD : TIME := 100 NS;
 
BEGIN
 
	-- INSTANTIATE THE UNIT UNDER TEST (UUT)
   UUT: STACK PORT MAP (
          D   => D,
          CLR => CLR,
          UP  => UP,
          DW  => DW,
          WPC => WPC,
          CLK => CLK,
          Q   => Q
        );

   -- CLOCK PROCESS DEFINITIONS
   CLK_PROCESS :PROCESS
   BEGIN
		CLK <= '0';
		WAIT FOR CLK_PERIOD/2;
		CLK <= '1';
		WAIT FOR CLK_PERIOD/2;
   END PROCESS;
 
   -- STIMULUS PROCESS
   STIM_PROC: PROCESS
   BEGIN		
      -- INSERT STIMULUS HERE 
		CLR <= '0';
		-- HOLD CLOCK STATE FOR 10 NS.
      WAIT FOR CLK_PERIOD;
		
      -- INSERT STIMULUS HERE 	
		D   <= X"0005";
		CLR <= '1';
		WPC <= '1';
		UP  <= '0';
		DW  <= '0';
		-- HOLD CLOCK STATE FOR 10 NS.	
      WAIT FOR CLK_PERIOD;
		
      -- INSERT STIMULUS HERE 	
		D   <= X"0005";
		CLR <= '1';
		WPC <= '0';
		UP  <= '0';
		DW  <= '0';
		-- HOLD RESET STATE FOR 10 NS.
      WAIT FOR CLK_PERIOD;
		
      -- INSERT STIMULUS HERE 	
		D   <= X"0005";
		CLR <= '1';
		WPC <= '0';
		UP  <= '0';
		DW  <= '0';
		-- HOLD RESET STATE FOR 10 NS.
      WAIT FOR CLK_PERIOD;
		
      -- INSERT STIMULUS HERE 	
		D   <= X"0030";
		CLR <= '1';
		WPC <= '1';
		UP  <= '1';
		DW  <= '0';
		-- HOLD RESET STATE FOR 10 NS.
      WAIT FOR CLK_PERIOD;
		
      -- INSERT STIMULUS HERE 	
		D   <= X"0030";
		CLR <= '1';
		WPC <= '0';
		UP  <= '0';
		DW  <= '0';
		-- HOLD CLOCK STATE FOR 10 NS.
      WAIT FOR CLK_PERIOD;
		
      -- INSERT STIMULUS HERE 	
		D   <= X"0030";
		CLR <= '1';
		WPC <= '0';
		UP  <= '0';
		DW  <= '1';
		-- HOLD CLOCK STATE FOR 10 NS.	
      WAIT FOR CLK_PERIOD*10;
		
      -- INSERT STIMULUS HERE 	
		D   <= X"0030";
		CLR <= '1';
		WPC <= '0';
		UP  <= '0';
		DW  <= '1';
		-- HOLD CLOCK STATE FOR 10 NS.
      WAIT FOR CLK_PERIOD*10;
   END PROCESS;
END;
