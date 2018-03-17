#Clock
    set_property -dict {PACKAGE_PIN E3  IOSTANDARD LVCMOS33} [get_ports {clk100MHz}]; 
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk100MHz}];
#switches
    #B
        set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {B[0]}];
        set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {B[1]}];
        set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {B[2]}];
        set_property -dict {PACKAGE_PIN R15 IOSTANDARD LVCMOS33} [get_ports {B[3]}];

    #A
        set_property -dict {PACKAGE_PIN H6  IOSTANDARD LVCMOS33} [get_ports {A[0]}];
        set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports {A[1]}];
        set_property -dict {PACKAGE_PIN U11 IOSTANDARD LVCMOS33} [get_ports {A[2]}];
        set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports {A[3]}];

    #Buttons
        set_property -dict {PACKAGE_PIN M18  IOSTANDARD LVCMOS33} [get_ports {button}];
        set_property -dict {PACKAGE_PIN V11  IOSTANDARD LVCMOS33} [get_ports {button_indicator}];
        set_property -dict {PACKAGE_PIN N17  IOSTANDARD LVCMOS33} [get_ports {rst}];


#LEDs
    #SUM
        set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[0]}];
        set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[1]}];
        set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[2]}]; 
        set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[3]}]; 
        set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[4]}]; 
        set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[5]}];
        set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[6]}];
        set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports {LEDOUT[7]}]; 
        
        set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[0]}];
        set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[1]}];
        set_property -dict {PACKAGE_PIN T9  IOSTANDARD LVCMOS33} [get_ports {LEDSEL[2]}];
        set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[3]}];
        set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[4]}];
        set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[5]}];
        set_property -dict {PACKAGE_PIN K2  IOSTANDARD LVCMOS33} [get_ports {LEDSEL[6]}];
        set_property -dict {PACKAGE_PIN U13 IOSTANDARD LVCMOS33} [get_ports {LEDSEL[7]}];
    #Inputs out
        #A
#            set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {A_out[0]}]; 
#            set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {A_out[1]}];
#            set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {A_out[2]}];
#            set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS33} [get_ports {A_out[3]}];
        #B
#            set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {B_out[0]}];
#            set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports {B_out[1]}];
#            set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports {B_out[2]}]; 
#            set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {B_out[3]}]; 
        #P (for debugging)
            set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports {P_out[0]}]; 
            set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {P_out[1]}];
            set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {P_out[2]}];
            set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {P_out[3]}];
            
            
            set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {P_out[4]}]; 
            set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {P_out[5]}];
            set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {P_out[6]}];
            set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {P_out[7]}];