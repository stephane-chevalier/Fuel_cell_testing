function display_Z(t,E,I,Ea,Ec,Zwe,Zce,f, S)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

gcf;
clf

subplot(2,2,[1 2])
yyaxis left
plot(t,I/S)
ylabel('Densité de courant (mA/cm^2)')
yyaxis right
plot(t,[E Ea,Ec])
xlabel('temps (s)')
ylabel('Tension (V)')

subplot(223)
plot(real(Zwe)*S,-imag(Zwe)*S,'-o',-real(Zce)*S,-imag(Zce)*S,'-o')
daspect([1 1 1])
ylabel('-imag(Z) (\Omega.cm^2)')
xlabel('real(Z) (\Omega.cm^2)')
legend('Zwe','Zce')


subplot(224)
semilogx(f,abs(Zwe)*S,'-o',f,abs(Zce)*S,'-o')

xlabel('f (Hz)')
ylabel('module(Z) (\Omega.cm^2)')
legend('Zwe','Zce')
end