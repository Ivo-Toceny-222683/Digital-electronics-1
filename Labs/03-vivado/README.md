# Ivo Točený, 222683 - 03-vivado

## PreLab homework:

### 0. part - Link to GitHub repository

[My GitHub 03-vivado repository](https://github.com/Ivo-Toceny-222683/Digital-electronics-1/tree/main/Labs/03-vivado)

### 1. part - Nexys A7 board switches-pins, leds-pins

**Active-high LEDs states**

**Switches** | **Pins** | **LEDs** | **Pins**
------------ | ---------- | -------| ------
SW0| J15     | 00| H17
SW1| L16     |  01|K15
SW2|  M13    | 02|J13
SW3| R15     |03|N14  
SW4| R17    |04|R18 
SW5| T18|05|V17 
SW6| U18|06|U17 
SW7| R13 |07|U16 
SW8| T8    |08|V16
SW9| U8    |09|T15
SW10| R16|10|U14  
SW11| T13 |11|T16  
SW12| H6 |12| V15
SW13| U12|13|V14
SW14|  U11 |14|V12
SW15|V10| 15|V11  

# Lab assignment:

## Two-bit wide 4-to-1 multiplexer:

### VHDL code of two-bit wide 4-to-1 multiplexer:

```vhdl
------------------------------------------------------------------------
-- Architecture body for 2-bit binary comparator
------------------------------------------------------------------------
architecture Behavioral of mux_2bit_4to1 is
begin
    f_o  <=    a_i when (sel_i = "00") else
               b_i when (sel_i = "01") else
               c_i when (sel_i = "10") else
               d_i;

end architecture Behavioral;
```

### VHDL testbench:

```vhdl
--------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
p_stimulus : process
begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;
        
        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "00" ;
        s_sel <= "00" ; wait for 100ns;
        
        s_d <= "10"; s_c <= "11"; s_b <= "01"; s_a <= "10" ;
        s_sel <= "01" ; wait for 100ns; 
        
        s_d <= "00"; s_c <= "01"; s_b <= "01"; s_a <= "11" ;
        s_sel <= "00" ; wait for 100ns; 
       
        s_d <= "10"; s_c <= "10"; s_b <= "01"; s_a <= "00" ;
        s_sel <= "01" ; wait for 100ns; 
       
        s_d <= "11"; s_c <= "01"; s_b <= "11"; s_a <= "01" ;
        s_sel <= "11" ; wait for 100ns; 
       
        s_d <= "01"; s_c <= "10"; s_b <= "01"; s_a <= "00" ;
        s_sel <= "10" ; wait for 100ns;
       
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

### Simulated waveforms:


![waveform](images/DE1_Waveform.png)

## Vivado tutorial:

