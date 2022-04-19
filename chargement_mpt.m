function [header,data] = chargement_mpt(filename)
%[header,data] = chargement_mpt(filename,headerlinesIn)
% Return the data in matrix format from MPT files
% headerlinesIn = 63 as defautl value.
% filename = name of the file


% lecture du nb de hearder lines
fid = fopen(filename);
result = textscan(fid, '%s', 1, 'Headerlines', 1, 'Delimiter' ,'');
headerlinesIn = char(result{1,1}(1,1));
headerlinesIn = str2num(headerlinesIn(19:20));
fclose(fid);

% chargement de données
A = importdata(filename,'\t',headerlinesIn);
data = A.data;
header = A.textdata;


