library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
ENTITY JIAOTONG IS
   PORT (
         clk      : IN std_logic;  
         
         L1   : OUT std_logic;
         L2   : OUT std_logic;
         L3   : OUT std_logic;
         L4   : OUT std_logic;
         L5   : OUT std_logic;
         L6   : OUT std_logic;
         
		 L7   : OUT std_logic;
         L8   : OUT std_logic;
         L9   : OUT std_logic;
         L10   : OUT std_logic;
         L11   : OUT std_logic;
         L12   : OUT std_logic);   
END JIAOTONG;

ARCHITECTURE one OF  JIAOTONG IS
   signal clk5K,clk1,clk10,clkS : std_logic; 
      signal LED12,LED1,LED2,LED3,LED4,LED5,LED6,LED7,LED8,LED9,LED10,LED11 : std_logic; 
   SIGNAL TIMECOUNT : integer range 0 to 70;     
  
BEGIN

  process(clk) --5khz
    variable cnt:integer range 0 to 3999;
     begin
      if clk'event and clk='1' then
         if cnt=3999 then
            cnt:=0;
         else
            cnt:=cnt+1;
         end if;
         if cnt<2000 then
            clk5k<='0';
          else
            clk5k<='1';
          end if;
        end if;
      end process;  
 
 process(clk5k) --100hz
    variable cnt:integer range 0 to 49;
     begin
      if clk5k'event and clk5k='1' then
       
         if cnt=49 then
            cnt:=0;
         else
            cnt:=cnt+1;
         end if;
         
         if cnt<25 then
            clk10<='0';
         else
            clk10<='1';
         end if;  
                
       end if;
end process;  

process(clk10)--
    variable cnt1:  integer range 0 to 99;
    variable cnt2:  integer range 0 to 24;
     begin
       if clk10'event and clk10='1' then
         if cnt1=99 then
            cnt1:=0;
         else
            cnt1:=cnt1+1;
         end if;
         if cnt1<49 then
            clk1<='1';
          else
            clk1<='0';
          end if;
          
          if cnt2=24 then
            cnt2:=0;
         else
            cnt2:=cnt2+1;
         end if;
         if cnt2<12 then
            clkS<='1';
          else
           clkS<='0';
          end if;
      end if;          
    end process;
    
     
   PROCESS
   BEGIN
      WAIT UNTIL (clk1'EVENT AND clk1 = '1');
      IF (TIMECOUNT = 69) THEN
         TIMECOUNT <= 0;    
      ELSE
         TIMECOUNT <= TIMECOUNT + 1;    
      END IF;
   END PROCESS;


   PROCESS
      
   BEGIN
      WAIT UNTIL (clk10'EVENT AND clk10 = '1');
      
      CASE TIMECOUNT IS
       WHEN 0 TO 1=>LED1<=CLKS;
       WHEN 2 TO 12=>LED1<='1';
       WHEN 13 TO 14=>LED1<=CLKS;
       WHEN 15 TO 69=>LED1<='0';
       WHEN OTHERS =>NULL;  
       END CASE;
      
       CASE TIMECOUNT IS
       WHEN 0 TO 14=>LED2<='0';
       WHEN 15 TO 16=>LED2<=CLKS;
       WHEN 17 TO 32=>LED2<='1';
	   WHEN 33 TO 34=>LED2<=CLKS;--10hz
       WHEN 35 TO 69=>LED2<='0';
       WHEN OTHERS =>NULL;  
       END CASE;
      
       CASE TIMECOUNT IS
       WHEN 0 TO 12=>LED3<='1';
	   WHEN 13 TO 14=>LED3<=CLKS;
       WHEN 15 TO 19=>LED3<='0';
	   WHEN 20 TO 21=>LED3<=CLKS;
	   WHEN 22 TO 69=>LED3<='1';
	   --WHEN 48 TO 49=>LED3<=CLKS;
	   --WHEN 50 TO 54=>LED3<='0';
	   --WHEN 55 TO 56=>LED3<=CLKS;
	   --WHEN 57 TO 69=>LED3<='1';
       WHEN OTHERS =>NULL;  
       END CASE;


   CASE TIMECOUNT IS
       WHEN 0 TO 34=>LED4<='0';
       WHEN 35 TO 36=>LED4<=CLKS;
       WHEN 37 TO 47=>LED4<='1';
       WHEN 48 TO 49=>LED4<=CLKS;
       WHEN 50 TO 69=>LED4<='0';
       WHEN OTHERS =>NULL;  
       END CASE;
      
	   CASE TIMECOUNT IS
       WHEN 0 TO 49=>LED5<='0';
	   WHEN 50 TO 51=>LED5<=CLKS;
       WHEN 52 TO 67=>LED5<='1';
       WHEN 68 TO 69=>LED5<=CLKS;
       WHEN OTHERS =>NULL;  
       END CASE;     

	   CASE TIMECOUNT IS
       WHEN 0 TO 47=>LED6<='1';
	   --WHEN 13 TO 14=>LED6<=CLKS;
       --WHEN 15 TO 19=>LED6<='0';
	   --WHEN 20 TO 21=>LED6<=CLKS;
	   --WHEN 22 TO 47=>LED6<='1';
	   WHEN 48 TO 49=>LED6<=CLKS;
	   WHEN 50 TO 54=>LED6<='0';
	   WHEN 55 TO 56=>LED6<=CLKS;
	   WHEN 57 TO 69=>LED6<='1';
       WHEN OTHERS =>NULL;  
       END CASE;   
      
      END PROCESS;
      
      
    PROCESS
   BEGIN
       WAIT UNTIL (clk10'EVENT AND clk10 = '1');
      
		L1<=LED1;
		L2<=LED2;
		L3<=LED3;
		L4<=LED4;
		L5<=LED5;
		L6<=LED6;
      
		L7<=LED1;
		L8<=LED2;
		L9<=LED3;
		L10<=LED4;
		L11<=LED5;
		L12<=LED6; 
		 
    end process;    
END ;

