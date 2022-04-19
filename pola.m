function [E,Ea,Ea_std,Ec,Ec_std,CD,CD_std,data_all,data_palier] = pola(data,time,seuil)
% [E,Ea,Ec,CD,CD_std,data_all,data_palier] = pola(data,time,seuil)
%   data is the data from EC lab
% seuil : threshold to detect the plateau, 0.02 by default
% time number of points to be averaged, 10 by default


if nargin == 1
    seuil = 0.02; %valeur par défaut
    time = 10; % number of points to be averaged
elseif nargin == 2
    seuil = 0.02; %valeur par défaut
end

time = time -1; % pour bien avoir le nb de points indiqué (le -1 vient du mode de traitement)

% detection of the plateau
Ewe = data(:,10);
I = data(:,11);
Ece = -data(:,15);
Ece_we = data(:,24);
t = data(:,8);

id_plateau = find(abs(diff(Ewe))>seuil)-1;
id_plateau(end+1) = length(Ewe);

% sauvegarde de la manip
data_all = [t I Ewe Ece Ece_we];


% moyenne sur les paliers
k = 1; % indice pour compter les points sur les plateaux
for ii = 2:length(id_plateau)
    E(ii-1,1) = mean(Ewe(id_plateau(ii)-time:id_plateau(ii)));
    Ea(ii-1,1) = mean(Ece(id_plateau(ii)-time:id_plateau(ii)));
    Ec(ii-1,1) = mean(Ece_we(id_plateau(ii)-time:id_plateau(ii)));
    CD(ii-1,1) = mean(I(id_plateau(ii)-time:id_plateau(ii)));
    CD_std(ii-1,1) = std(I(id_plateau(ii)-time:id_plateau(ii)));
    Ea_std(ii-1,1) = std(Ece(id_plateau(ii)-time:id_plateau(ii)));
    Ec_std(ii-1,1) = std(Ece_we(id_plateau(ii)-time:id_plateau(ii)));
    
       
    data_palier(k+time*(ii-2):(time+1)*(ii-1),:) = [t(id_plateau(ii)-time:id_plateau(ii))...
        I(id_plateau(ii)-time:id_plateau(ii))...
        Ewe(id_plateau(ii)-time:id_plateau(ii))...
        Ece(id_plateau(ii)-time:id_plateau(ii))...
        Ece_we(id_plateau(ii)-time:id_plateau(ii))];
    
    k = k+1;
end

end
