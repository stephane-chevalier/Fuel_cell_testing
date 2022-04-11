function [header,data] = chargement_mpt(filename,headerlinesIn)
%[header,data] = chargement_mpt(filename,headerlinesIn)
% Return the data in matrix format from MPT files
% headerlinesIn = 63 as defautl value.
% filename = name of the file

if nargin == 1
    headerlinesIn = 63; %valeur par défaut
end
    A = importdata(filename,'\t',headerlinesIn);
    data = A.data;
    header = A.textdata;
end

