EC-LAB SETTING FILE

Number of linked techniques : 2

Filename : C:\Users\manip\Documents\Depot_Git\Fuel_cell_testing\GEIS_3electrodes_25uA.mps

Device : SP-300
Electrode connection : standard
Ewe ctrl range : min = -2.50 V, max = 2.50 V
Ewe,I filtering : <None>
Safety Limits :
	Do not start on E overload
Channel : Grounded
Electrode material : 
Initial state : 
Electrolyte : 
Comments : 
Cable : standard
Electrode surface area : 0.001 cm²
Characteristic mass : 0.001 g
Equivalent Weight : 0.000 g/eq.
Density : 0.000 g/cm3
Record Ece
Cycle Definition : Charge/Discharge alternance
Turn to OCV between techniques

Technique : 1
Chronopotentiometry
Is                  -25.000             
unit Is             µA                  
vs.                 <None>              
ts (h:m:s)          0:02:0.0000         
EM (V)              0.200               
dQM                 833.333             
unit dQM            nA.h                
record              Ewe                 
dEs (mV)            10.00               
dts (s)             1.0000              
E range min (V)     -2.500              
E range max (V)     2.500               
I Range             100 µA              
Bandwidth           8                   
goto Ns'            0                   
nc cycles           0                   

Technique : 2
Galvano Electrochemical Impedance Spectroscopy
Mode                Single sine         
Is                  -0.025              
unit Is             mA                  
vs.                 <None>              
tIs (h:m:s)         0:00:1.0000         
record              1                   
dE (mV)             0.000               
dt (s)              1.000               
fi                  100.000             
unit fi             kHz                 
ff                  50.000              
unit ff             mHz                 
Nd                  6                   
Points              per decade          
spacing             Logarithmic         
Ia/Va               Ia                  
Ia                  2.500               
unit  Ia            µA                  
va pourcent         0.10                
pw                  0.10                
Na                  2                   
corr                0                   
E range min (V)     -2.500              
E range max (V)     2.500               
I Range             100 µA              
Bandwidth           8                   
nc cycles           0                   
goto Ns'            0                   
nr cycles           0                   
inc. cycle          0                   
