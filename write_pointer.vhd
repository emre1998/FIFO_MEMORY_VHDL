Library IEEE;
USE IEEE.Std_logic_1164.all;
USE ieee.std_logic_arith.all;  
USE ieee.std_logic_unsigned.all; 
-- Write pointer -- 
entity write_pointer is 
   port(
      wptr : out std_logic_vector(4 downto 0);    
   fifo_we: out std_logic;
      clk :in std_logic;  
   rst_n: in std_logic;  
      wr :in  std_logic;
   fifo_full: in std_logic
   );
end write_pointer;
architecture Behavioral of write_pointer is  
signal we: std_logic;
signal write_addr:std_logic_vector(4 downto 0);    
begin  
 fifo_we <= we;
 we <= (not fifo_full) and wr;
 wptr <= write_addr;
 process(clk,rst_n)
 begin 
     if(rst_n='0') then 
   write_addr <= (others => '0');
     elsif(rising_edge(clk)) then
   if(we='1') then 
    write_addr <= write_addr + "00001"; 
   end if;
  end if;      
 end process;  
end Behavioral; 