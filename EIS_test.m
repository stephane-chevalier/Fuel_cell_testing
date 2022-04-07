
clc 
clear all 
close all 
%%%%%%%%%%%%%%%%%%%%%%  ATTENTION %%%%%%%%%%%%%%%%%%%%%%

%POUR UTILISER CE FICHIER IL FAUT REMPLACER LES VIRGULES PAR DES POINTS
%DANS LE FICHIER MPT

% recherche de tous les fichiers .txt
listname=ls('*.mpt');
l=0.0500; %largeur active de l'electrode [cm]
L=1; %longueur de l'électrode [cm]
S=l*L; %surface active [cm²]
%% Set up the Import Options and import the data
A=sprintf('\n Ouverture de %s',listname(:));
disp(A);
name=listname(:);
opts = delimitedTextImportOptions("NumVariables", 59);

% Specify range and delimiter
opts.DataLines = [68, inf];
opts.Delimiter = ["\t"];
% Specify column names and types
opts.VariableNames = ["freq Hz","Re(Z)Ohm","-Im(Z) Ohm","\|Z|Ohm","Phase(Z)/deg","time/s","<Ewe>/V","<I>/mA","Cs/µF","Cp/µF","cycle number","|Ewe|/V","|I|/A","I Range","(Q-Qo)/mA.h","<Ece>/V","|Ece|/V","Phase(Zce)/deg","|Zce|/Ohm","Re(Zce)/Ohm","-Im(Zce)/Ohm","Phase(Zwe-ce)/deg","|Zwe-ce|/Ohm","Re(Zwe-ce)/Ohm","(-)Im(Zwe-ce)/Ohm","Re(Y)/Ohm-1","Im(Y)/Ohm-1","|Y|/Ohm-1","Phase(Y)/deg","dq/mA.h"];
opts.VariableTypes = ["double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double"];
% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
% Specify variable properties
opts = setvaropts(opts,["freq Hz","Re(Z)Ohm","-Im(Z) Ohm","\|Z|Ohm","Phase(Z)/deg","time/s","<Ewe>/V","<I>/mA","Cs/µF","Cp/µF","cycle number","|Ewe|/V","|I|/A","I Range","(Q-Qo)/mA.h","<Ece>/V","|Ece|/V","Phase(Zce)/deg","|Zce|/Ohm","Re(Zce)/Ohm","-Im(Zce)/Ohm","Phase(Zwe-ce)/deg","|Zwe-ce|/Ohm","Re(Zwe-ce)/Ohm","(-)Im(Zwe-ce)/Ohm","Re(Y)/Ohm-1","Im(Y)/Ohm-1","|Y|/Ohm-1","Phase(Y)/deg","dq/mA.h"]);
opts = setvaropts(opts, ["freq Hz","Re(Z)Ohm","-Im(Z) Ohm","\|Z|Ohm","Phase(Z)/deg","time/s","<Ewe>/V","<I>/mA","Cs/µF","Cp/µF","cycle number","|Ewe|/V","|I|/A","I Range","(Q-Qo)/mA.h","<Ece>/V","|Ece|/V","Phase(Zce)/deg","|Zce|/Ohm","Re(Zce)/Ohm","-Im(Zce)/Ohm","Phase(Zwe-ce)/deg","|Zwe-ce|/Ohm","Re(Zwe-ce)/Ohm","(-)Im(Zwe-ce)/Ohm","Re(Y)/Ohm-1","Im(Y)/Ohm-1","|Y|/Ohm-1","Phase(Y)/deg","dq/mA.h"]);
M=readtable(name,opts); % tableau avec les valeurs 
data=table2array(M); 

freq=data(:,1); ReZ=data(:,2); negImZ=data(:,3); phaseZ=data(:,5);
%% tracer le Nyquist
figure(1) 
plot(ReZ,negImZ,'+')
% hold on 
% plot(data(:,2),data(:,19),'+')
title('Nyquist Diagram')
xlabel('Re(Z) [Ohm]')
ylabel('-Im(Z) [Ohm]')
set(gca,'DataAspectRatio',[1,1,1])
%% Diagramme de Bode

figure(2)
clf
title('Bode Diagram')
grid on 
yyaxis left 
semilogx(data(:,1), data(:,4),'+','LineWidth',1)
ylabel ('|Z| [Ohm]')
yyaxis right
semilogx(data(:,1), data(:,5),'+','LineWidth',1)
ylabel ('\phi [°]')
xlabel('f [Hz]')

%%Save data 
save ('data_geis.mat','S','freq','ReZ','negImZ','phaseZ')


