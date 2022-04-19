clc
clear all 
clf 
addpath C:\Users\manip\Documents\Depot_Git\Fuel_cell_testing
path = '\';
name = ls(['.',path,'/*.mpt']);

nbr_paliers=8; 
tps_paliers=120;

for n=1:size(name,1)
[data,nbr_paliers,tps_paliers]=fonction_traitement_chronoamp(name(n,:),nbr_paliers,tps_paliers);

end 
disp('Enregistrements des données dans le fichier data.mat');