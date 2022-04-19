clc
clear all 
clf 
addpath D:\matlab\Fuel_cell_testing
path = '\';
name = ls(['.',path,'/*.mpt']);


[data]=fonction_traitement_geis(name);


disp('Enregistrements des données dans le fichier data.mat');