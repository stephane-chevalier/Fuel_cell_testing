function [data,nbr_paliers,tps_paliers]=traitement_chronoamp(name,nbr_paliers,tps_paliers)
% recherche de tous les fichiers .txt
   
A=sprintf('\n Ouverture de %s',name);
disp(A);
opts = delimitedTextImportOptions("NumVariables", 25); %25 colonnes à importer

if isempty(name)
     disp('Le fichier n existe pas vérifier le nom')
     return
 end

l=0.0500; %largeur active de l'electrode [cm]
L=1; %longueur de l'électrode [cm]
S=l*L; %surface active [cm²]
dE0_a=-0.19; 
dE0_c=1.5; 
nbr_pts=50; % Nbr de points pour faire moyenne


%% Lecture des donnée à partir de la line 64 >> ligne 63=titre des colonnes 
opts.DataLines = [64, Inf];
opts.Delimiter = "\t";
%% Nom des variables 
opts.VariableNames = ["mode", "oxred", "error", "controlChanges", "NsChanges", "counterInc", "Ns", "times", "controlV", "EweV", "ImA", "dQC", "QQoC", "IRange", "EceV", "QChargedischargemAh", "halfCycle", "QDischargemAh", "QChargemAh", "CapacitymAh", "Efficiency", "cycleNumber", "PW", "EweEceV", "VarName25"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "string"];

%% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable propertis
opts = setvaropts(opts, "VarName25", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "VarName25", "EmptyFieldRule", "auto");

%% Tableau de Characteres en matrice de nombres 
%preview(name,opts)
M=readtable(name,opts);
data=table2array(M); 
data=str2double(data);  


%% Tri par paliers et moyenne 
for i= 1 : nbr_paliers
    trash1=i*tps_paliers-tps_paliers+nbr_pts; %% Début intervalle pour la moyenne 
    trash2=i*tps_paliers-1; %% fin intervalle pour la moyenne ici on enlève le dernier point 
    data_moy(i,:)=mean(data(trash1:trash2,:));
    figure(1)
    title('Paliers des courants')
    plot(data(trash1:trash2,8),data(trash1:trash2,11))
    xlabel('Times [s]')
    ylabel('Current [mA]')
    hold on 
end 
Ewe=data_moy(:,10);
Ece=data_moy(:,15);
Ewe_ce=data_moy(:,24);
data_moy(:,8)=round(data_moy(:,8),1); 
data_moy(:,9)=round(data_moy(:,9),1); 
%% Calcul de la Densité de courant 
i=abs(data_moy(:,11));
CD(:,1)=i/S; 

% figure(2); clf 
% plot(CD,data_moy(:,9),'-+','LineWidth',1,'MarkerSize',10)
% title ('Polarization curve')
% xlabel('current density [mA.cm^-2]') 
% ylabel('Potentiel [V]')
%% Calcul de la densité de puissance 
PD(:,1)=CD.*data_moy(:,9); 
% figure(3); clf
% plot((PD),data_moy(:,9),'--+','LineWidth',1,'MarkerSize',10)
% title ('Power Density')
% ylabel('Power density [mW.cm^-2]') 
% xlabel('current density [mA.cm^-2]') 

%% Calcul des surtensions 
eta_a=-Ece-dE0_a; 
eta_c=Ewe_ce-dE0_c; 
verif=eta_a-eta_c+Ewe; 
E=dE0_c-dE0_a; 

% figure(4); clf
% plot(CD, eta_a,'-','LineWidth',1,'color', [0.9 0.55 0.4])
% hold on
% plot(CD,data_moy(:,15),'--','LineWidth',1,'color',[0.89 0.3 0.2]) 
% hold on 
% plot(CD,eta_c,'-','LineWidth',1,'color',[0.61 0.8 0.9])
% hold on 
% plot(CD,data_moy(:,24),'--','LineWidth',1,'color',[0.17 0.55 0.74])
% hold on 
% plot(CD,data_moy(:,9),'-','LineWidth',1,'color',[0.53 0.33 0.66])
% legend('\eta_a', 'E_a','\eta_c','E_c','Polarization curve')
% xlabel('current density [mA.cm^-2]') 
% ylabel('Potentiel [V]')

figure (2) 
subplot(2,2,1)
plot(CD,data_moy(:,9),'-+','LineWidth',1,'MarkerSize',10)
title ('Polarization curve')
xlabel('current density [mA.cm^-2]') 
ylabel('Potentiel [V]')


subplot(2,2,2)
plot((PD),data_moy(:,9),'--+','LineWidth',1,'MarkerSize',10)
title ('Power Density')
ylabel('Power density [mW.cm^-2]') 
xlabel('current density [mA.cm^-2]') 

subplot(2,2,3)
plot(CD, eta_a,'-','LineWidth',1,'color', [0.9 0.55 0.4])
hold on
plot(CD,abs(data_moy(:,15)),'--','LineWidth',1,'color',[0.89 0.3 0.2]) 
hold on 
plot(CD,eta_c,'-','LineWidth',1,'color',[0.61 0.8 0.9])
hold on 
plot(CD,data_moy(:,24),'--','LineWidth',1,'color',[0.17 0.55 0.74])
hold on 
plot(CD,data_moy(:,9),'-','LineWidth',1,'color',[0.53 0.33 0.66])

legend('\eta_a', 'E_a','\eta_c','E_c','Polarization curve')
xlabel('current density [mA.cm^-2]') 
ylabel('Potentiel [V]')

save ('data_chronoamp.mat','S','CD','Ewe','Ece','Ewe_ce','eta_a', 'eta_c')
end 