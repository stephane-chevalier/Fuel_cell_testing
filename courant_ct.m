function [t,E,I,Ea,Ec] = courant_ct(data_I)
% [t,E,I,Ea,Ec] = courant_ct(data_I)
%   Detailed explanation goes here
E = data_I(:,10);
I = -data_I(:,9);
t = data_I(:,8);
Ea = -data_I(:,17);
Ec = data_I(:,24);
end