clear all
clc


addpath '..\..\Depot_Git\Fuel_cell_testing'

temp = 'RT/';
names = ls(['./',temp,'pola/*.mpt']);


time = 30;
S = 0.05; %surface active en cm2

% chargement pour la courbe de pola
fig_n = 1;
for n = 1:size(names,1)

    
    filename = ['./',temp,'pola/',names(n,:)];


    [header,data] = chargement_mpt(filename);
    [E,Ea,Ea_std,Ec,Ec_std,CD,CD_std,data_all,data_palier] = pola(data,time);
    
    eff = -CD/(5*96485*5/60*0.0072)*1e5;
    
    figure(fig_n)
    display_pola(E,Ea,Ea_std,Ec,Ec_std,CD,CD_std,data_all,data_palier,eff)  
    fig_n = fig_n + 1;
end

%%
names_courant = ls(['./',temp,'eis/courant/*.mpt']);
names_Z = ls(['./',temp,'eis/impedance/*.mpt']);

for n = 1:size(names_courant,1)
    % chargement pour le courant avant impedance
    filename = ['./',temp,'eis/courant/',names_courant(n,:)];
    [header_I,data_I] = chargement_mpt(filename);
    [t,E,I,Ea,Ec] = courant_ct(data_I);

    % chargement impedance
    filename = ['./',temp,'eis/impedance/',names_Z(n,:)];
    [header_Z,data_Z] = chargement_mpt(filename);
    [Zwe,Zce,f] = impedance(data_Z);
    
    figure(fig_n)
    display_Z(t,E,I,Ea,Ec,Zwe,Zce,f, S);
end










