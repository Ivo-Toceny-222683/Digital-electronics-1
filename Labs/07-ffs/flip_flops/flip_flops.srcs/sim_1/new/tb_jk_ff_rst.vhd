----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2021 08:55:57 PM
-- Design Name: 
-- Module Name: tb_jk_ff_rst - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_jk_ff_rst is
--  Port ( );
end tb_jk_ff_rst;

architecture Behavioral of tb_jk_ff_rst is
            -- Local constants
          constant c_CLK_100MHZ_PERIOD : time    := 10 ns;
    
          signal s_clk_100MHz  : STD_LOGIC;
          signal s_rst         : STD_LOGIC;
          signal s_j           : STD_LOGIC;
          signal s_k           : STD_LOGIC;
          signal s_q           : STD_LOGIC;
          signal s_q_bar       : STD_LOGIC;

begin
    uut_jk_ff_rst : entity work.jk_ff_rst
    port map
    (
        clk   => s_clk_100MHz,
        rst   => s_rst,
        j     => s_j,
        k     => s_k,
        q     => s_q,
        q_bar => s_q_bar
    );
    
    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
    p_reset_gen : process
    begin
        s_rst <= '0';
        wait for 53ns;
        
        s_rst <= '1';
        wait for 5ns;
        
        s_rst <= '0';
        
        wait for 14ns;
        s_rst <= '1';
        
        wait for 30ns;
        s_rst <= '0';
        
        wait for 45ns;
        s_rst <= '1';
        
        wait for 30ns;
        s_rst <= '0';
        
        wait;
    end process p_reset_gen;

     p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        s_j  <= '0';
        s_k  <= '1';
        
        wait for 10ns;
        s_j  <= '1';
        s_k  <= '1';
        wait for 10ns;
        s_j  <= '1';
        s_k  <= '0';
        wait for 10ns;
        s_j  <= '0';
        s_k  <= '0';
        wait for 10ns;
        s_j  <= '0';
        s_k  <= '1';
        wait for 10ns;
        s_j  <= '0';
        s_k  <= '0';
        wait for 10ns;
        s_j  <= '1';
        s_k  <= '1';
        wait for 10ns;
        
        wait for 3ns;
        assert(s_rst = '1' and s_q = '1' and s_j = '1' and s_k = '1')
        report "Test failed for input combination: rst='1', s_q = '1', j='1', k = '1'." severity error;
        
        wait for 7ns;
        s_j  <= '1';
        s_k  <= '0';
        wait for 10ns;
        s_j  <= '0';
        s_k  <= '1';
        wait for 10ns;
        s_j  <= '1';
        s_k  <= '1';
        
        wait for 3ns;
        assert(s_rst = '0' and s_q = '0' and s_j = '1' and s_k = '1')
        report "Test failed for input combination: rst='0', s_q = '0', j='1', k = '1'." severity error;
        
        wait for 7ns;
        s_j  <= '1';
        s_k  <= '1';
        wait for 10ns;
        s_j  <= '0';
        s_k  <= '0';
        wait for 10ns;
        s_j  <= '0';
        s_k  <= '1';
        wait for 10ns;
        
        wait for 3ns;
        assert(s_rst = '0' and s_q = '0' and s_j = '0' and s_k = '1')
        report "Test failed for input combination: rst='0', s_q = '0', j='0', k = '1'." severity error;
        
        wait for 7ns;
        s_j  <= '1';
        s_k  <= '0';
        wait for 10ns;
        
        s_j  <= '0';
        s_k  <= '1';
        wait for 10ns;
        s_j  <= '0';
        s_k  <= '0';
        
        wait for 3ns;
        assert(s_rst = '1' and s_q = '0' and s_j = '0' and s_k = '0')
        report "Test failed for input combination: rst='1', s_q = '0', j='0', k = '0'." severity error;
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end Behavioral;
