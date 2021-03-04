EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Amplifier_Operational:LT1492 U1
U 1 1 6038B18C
P 7400 1750
F 0 "U1" H 7400 2117 50  0000 C CNN
F 1 "LT1492" H 7400 2026 50  0000 C CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 7400 1750 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/14923f.pdf" H 7400 1750 50  0001 C CNN
	1    7400 1750
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LT1492 U1
U 2 1 6038DDF5
P 7400 2450
F 0 "U1" H 7400 2817 50  0000 C CNN
F 1 "LT1492" H 7400 2726 50  0000 C CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 7400 2450 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/14923f.pdf" H 7400 2450 50  0001 C CNN
	2    7400 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 60390D04
P 5400 2450
F 0 "#PWR0101" H 5400 2200 50  0001 C CNN
F 1 "GND" H 5405 2277 50  0000 C CNN
F 2 "" H 5400 2450 50  0001 C CNN
F 3 "" H 5400 2450 50  0001 C CNN
	1    5400 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2400 5400 2350
$Comp
L Device:C C1
U 1 1 6039C442
P 5100 2050
F 0 "C1" H 5215 2096 50  0000 L CNN
F 1 "C" H 5215 2005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5138 1900 50  0001 C CNN
F 3 "~" H 5100 2050 50  0001 C CNN
	1    5100 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1650 5400 1700
$Comp
L power:+5V #PWR0102
U 1 1 603906A7
P 5400 1650
F 0 "#PWR0102" H 5400 1500 50  0001 C CNN
F 1 "+5V" H 5415 1823 50  0000 C CNN
F 2 "" H 5400 1650 50  0001 C CNN
F 3 "" H 5400 1650 50  0001 C CNN
	1    5400 1650
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LT1492 U1
U 3 1 6038EED1
P 5500 2050
F 0 "U1" H 5458 2096 50  0000 L CNN
F 1 "LT1492" H 5458 2005 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 5500 2050 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/14923f.pdf" H 5500 2050 50  0001 C CNN
	3    5500 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1900 5100 1700
Wire Wire Line
	5100 1700 5400 1700
Wire Wire Line
	5400 1750 5400 1700
Connection ~ 5400 1700
Wire Wire Line
	5100 2200 5100 2400
Wire Wire Line
	5100 2400 5400 2400
Wire Wire Line
	5400 2450 5400 2400
Connection ~ 5400 2400
$Comp
L Device:R_POT RV1
U 1 1 603A1EC1
P 6700 1850
F 0 "RV1" H 6631 1896 50  0000 R CNN
F 1 "R_POT" H 6631 1805 50  0000 R CNN
F 2 "Potentiometer_SMD:Potentiometer_ACP_CA6-VSMD_Vertical" H 6700 1850 50  0001 C CNN
F 3 "~" H 6700 1850 50  0001 C CNN
	1    6700 1850
	1    0    0    -1  
$EndComp
Text GLabel 7050 1650 0    50   Input ~ 0
L1
Text GLabel 7050 2350 0    50   Input ~ 0
L1
Text GLabel 7050 2550 0    50   Input ~ 0
L2
Wire Wire Line
	7050 1650 7100 1650
Wire Wire Line
	7050 2350 7100 2350
Wire Wire Line
	7050 2550 7100 2550
$Comp
L power:+5V #PWR0103
U 1 1 603A42CD
P 6700 1650
F 0 "#PWR0103" H 6700 1500 50  0001 C CNN
F 1 "+5V" H 6715 1823 50  0000 C CNN
F 2 "" H 6700 1650 50  0001 C CNN
F 3 "" H 6700 1650 50  0001 C CNN
	1    6700 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 603A446D
P 6700 2050
F 0 "#PWR0104" H 6700 1800 50  0001 C CNN
F 1 "GND" H 6705 1877 50  0000 C CNN
F 2 "" H 6700 2050 50  0001 C CNN
F 3 "" H 6700 2050 50  0001 C CNN
	1    6700 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 1650 6700 1700
Wire Wire Line
	6700 2000 6700 2050
Wire Wire Line
	6850 1850 7100 1850
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 603A5C12
P 1150 1000
F 0 "J1" H 1042 1285 50  0000 C CNN
F 1 "Conn_01x03_Female" H 1042 1194 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1150 1000 50  0001 C CNN
F 3 "~" H 1150 1000 50  0001 C CNN
	1    1150 1000
	-1   0    0    -1  
$EndComp
Text Label 1350 1500 0    50   ~ 0
P0
Text Label 1350 1600 0    50   ~ 0
P1
Text Label 1350 1700 0    50   ~ 0
P2(INT0)
Text Label 1350 1800 0    50   ~ 0
P3(USB+)
Text Label 1350 1900 0    50   ~ 0
P4(USB-)
Text Label 1350 2000 0    50   ~ 0
P5
Text Label 1350 900  0    50   ~ 0
5V
Text Label 1350 1000 0    50   ~ 0
GND
Text Label 1350 1100 0    50   ~ 0
VIN
$Comp
L power:+5V #PWR0105
U 1 1 603A94B0
P 1550 850
F 0 "#PWR0105" H 1550 700 50  0001 C CNN
F 1 "+5V" H 1565 1023 50  0000 C CNN
F 2 "" H 1550 850 50  0001 C CNN
F 3 "" H 1550 850 50  0001 C CNN
	1    1550 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 603A9D70
P 1550 1050
F 0 "#PWR0106" H 1550 800 50  0001 C CNN
F 1 "GND" H 1555 877 50  0000 C CNN
F 2 "" H 1550 1050 50  0001 C CNN
F 3 "" H 1550 1050 50  0001 C CNN
	1    1550 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 900  1550 900 
Wire Wire Line
	1550 900  1550 850 
Wire Wire Line
	1350 1000 1550 1000
Wire Wire Line
	1550 1000 1550 1050
Text GLabel 1550 2400 2    50   Output ~ 0
L1
Text GLabel 1550 2500 2    50   Output ~ 0
L2
Text GLabel 7750 1750 2    50   Output ~ 0
Threshold
Text GLabel 7750 2450 2    50   Output ~ 0
Direction
Wire Wire Line
	1350 2400 1550 2400
Wire Wire Line
	1350 2500 1550 2500
Wire Wire Line
	7700 2450 7750 2450
Wire Wire Line
	7700 1750 7750 1750
Text Label 6850 1850 0    50   ~ 0
Level
$Comp
L power:GND #PWR0107
U 1 1 603C9D3A
P 1550 2650
F 0 "#PWR0107" H 1550 2400 50  0001 C CNN
F 1 "GND" H 1555 2477 50  0000 C CNN
F 2 "" H 1550 2650 50  0001 C CNN
F 3 "" H 1550 2650 50  0001 C CNN
	1    1550 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2600 1550 2650
Wire Wire Line
	1350 2600 1550 2600
$Comp
L Connector:Conn_01x03_Female J3
U 1 1 603CCFF6
P 1150 2500
F 0 "J3" H 1042 2785 50  0000 C CNN
F 1 "Conn_01x03_Female" H 1042 2694 50  0001 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x03_P1.27mm_Vertical" H 1150 2500 50  0001 C CNN
F 3 "~" H 1150 2500 50  0001 C CNN
	1    1150 2500
	-1   0    0    -1  
$EndComp
Text GLabel 1850 1600 2    50   Input ~ 0
Direction
Text GLabel 1850 1700 2    50   Input ~ 0
Threshold
Text GLabel 1850 1500 2    50   Input ~ 0
LedCmd
Text GLabel 1850 2000 2    50   Input ~ 0
CapSense
Wire Wire Line
	1350 1500 1850 1500
Wire Wire Line
	1350 1600 1850 1600
Wire Wire Line
	1350 1700 1850 1700
Wire Wire Line
	1350 2000 1850 2000
$Comp
L Device:R R3
U 1 1 6040F6AC
P 5700 4300
F 0 "R3" H 5770 4346 50  0000 L CNN
F 1 "R" H 5770 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5630 4300 50  0001 C CNN
F 3 "~" H 5700 4300 50  0001 C CNN
	1    5700 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 6040FE2D
P 5700 4100
F 0 "#PWR0108" H 5700 3950 50  0001 C CNN
F 1 "+5V" H 5715 4273 50  0000 C CNN
F 2 "" H 5700 4100 50  0001 C CNN
F 3 "" H 5700 4100 50  0001 C CNN
	1    5700 4100
	1    0    0    -1  
$EndComp
Text GLabel 5800 4500 2    50   Output ~ 0
CapSense
$Comp
L Connector:Conn_01x01_Female J4
U 1 1 604108B0
P 5450 4500
F 0 "J4" H 5342 4367 50  0000 C CNN
F 1 "Conn_01x01_Female" V 5387 4548 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 5450 4500 50  0001 C CNN
F 3 "~" H 5450 4500 50  0001 C CNN
	1    5450 4500
	-1   0    0    1   
$EndComp
$Comp
L Driver_LED:WS2811 U2
U 1 1 60411FE5
P 2850 4750
F 0 "U2" H 2850 5231 50  0000 C CNN
F 1 "WS2811" H 3050 4500 50  0000 C CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 2550 4900 50  0001 C CNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2811.pdf" H 2650 5000 50  0001 C CNN
	1    2850 4750
	1    0    0    -1  
$EndComp
Text GLabel 2000 4650 0    50   Input ~ 0
LedCmd
$Comp
L power:+5V #PWR0109
U 1 1 604140BE
P 2850 4050
F 0 "#PWR0109" H 2850 3900 50  0001 C CNN
F 1 "+5V" H 2865 4223 50  0000 C CNN
F 2 "" H 2850 4050 50  0001 C CNN
F 3 "" H 2850 4050 50  0001 C CNN
	1    2850 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 60414F45
P 2850 5100
F 0 "#PWR0110" H 2850 4850 50  0001 C CNN
F 1 "GND" H 2855 4927 50  0000 C CNN
F 2 "" H 2850 5100 50  0001 C CNN
F 3 "" H 2850 5100 50  0001 C CNN
	1    2850 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 5050 2850 5100
$Comp
L Device:R R1
U 1 1 6041785C
P 2200 4650
F 0 "R1" V 2407 4650 50  0000 C CNN
F 1 "33" V 2316 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2130 4650 50  0001 C CNN
F 3 "~" H 2200 4650 50  0001 C CNN
	1    2200 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 4650 2050 4650
Wire Wire Line
	2350 4650 2450 4650
$Comp
L Device:R R2
U 1 1 6041A385
P 2850 4250
F 0 "R2" H 2780 4204 50  0000 R CNN
F 1 "100" H 2780 4295 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2780 4250 50  0001 C CNN
F 3 "~" H 2850 4250 50  0001 C CNN
	1    2850 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 4050 2850 4100
Wire Wire Line
	2850 4450 2850 4400
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 60420F03
P 2250 4850
F 0 "JP1" H 2250 4963 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 2250 4964 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 2250 4850 50  0001 C CNN
F 3 "~" H 2250 4850 50  0001 C CNN
	1    2250 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0111
U 1 1 60421A04
P 2050 4850
F 0 "#PWR0111" H 2050 4700 50  0001 C CNN
F 1 "+5V" H 2065 5023 50  0000 C CNN
F 2 "" H 2050 4850 50  0001 C CNN
F 3 "" H 2050 4850 50  0001 C CNN
	1    2050 4850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2050 4850 2100 4850
Wire Wire Line
	2400 4850 2450 4850
Wire Wire Line
	5700 4450 5700 4500
Connection ~ 5700 4500
Wire Wire Line
	5700 4500 5700 4550
Wire Wire Line
	5700 4100 5700 4150
$Comp
L Device:C C2
U 1 1 60430625
P 5700 4700
F 0 "C2" H 5815 4746 50  0000 L CNN
F 1 "C" H 5815 4655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5738 4550 50  0001 C CNN
F 3 "~" H 5700 4700 50  0001 C CNN
	1    5700 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 60435832
P 5700 4900
F 0 "#PWR0112" H 5700 4650 50  0001 C CNN
F 1 "GND" H 5705 4727 50  0000 C CNN
F 2 "" H 5700 4900 50  0001 C CNN
F 3 "" H 5700 4900 50  0001 C CNN
	1    5700 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4900 5700 4850
Wire Wire Line
	5650 4500 5700 4500
Wire Wire Line
	5700 4500 5800 4500
Text Notes 1750 3700 0    50   ~ 0
Leds driver
Wire Notes Line
	3750 5550 3750 3500
Wire Notes Line
	3750 3500 1400 3500
Wire Notes Line
	1400 3500 1400 5550
Wire Notes Line
	1400 5550 3750 5550
Wire Notes Line
	4750 5500 6500 5500
Wire Notes Line
	6500 5500 6500 3650
Wire Notes Line
	6500 3650 4750 3650
Wire Notes Line
	4750 3650 4750 5500
Text Notes 4850 3800 0    50   ~ 0
Capacitive sensing
Text Notes 5300 1300 0    50   ~ 0
BLDC rotation detection
Wire Notes Line
	4950 1150 4950 2800
Wire Notes Line
	4950 2800 8300 2800
Wire Notes Line
	8300 2800 8300 1150
Wire Notes Line
	8300 1150 4950 1150
$Comp
L Connector:Conn_01x06_Female J2
U 1 1 603A6255
P 1150 1700
F 0 "J2" H 1042 2085 50  0000 C CNN
F 1 "Conn_01x06_Female" H 1042 1994 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 1150 1700 50  0001 C CNN
F 3 "~" H 1150 1700 50  0001 C CNN
	1    1150 1700
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
