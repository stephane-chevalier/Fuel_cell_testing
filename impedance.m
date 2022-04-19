function [Zwe,Zce,f] = impedance(data)
% [Zwe,Zce,f] = impedance(data)

    Zwe = data(:,2)-1i*data(:,3);
    Zce = data(:,20)-1i*data(:,21);
    f = data(:,1);
end