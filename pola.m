function [E,Ea,Ec,CD] = pola(data,time,seuil)
%[E,Ea,Ec,CD] = pola(data)
%   data is the data from EC lab
% seuil : threshold to detect the plateau, 0.02 by default
% time number of points to be averaged, 10 by default


if nargin == 1
    seuil = 0.02; %valeur par défaut
    time = 10; % number of points to be averaged
elseif nargin == 2
    seuil = 0.02; %valeur par défaut
end

% detection of the plateau
Ewe = data(:,10);
I = data(:,11);
Ece = -data(:,15);
Ece_we = data(:,24);

id_plateau = find(abs(diff(Ewe))>seuil);
id_plateau(end+1) = length(Ewe);

for ii = 2:length(id_plateau)
    E(ii,1) = mean(Ewe(id_plateau(ii)-time:id_plateau(ii)));
    Ea(ii,1) = mean(Ece(id_plateau(ii)-time:id_plateau(ii)));
    Ec(ii,1) = mean(Ece_we(id_plateau(ii)-time:id_plateau(ii)));
    CD(ii,1) = mean(I(id_plateau(ii)-time:id_plateau(ii)));
end

end
