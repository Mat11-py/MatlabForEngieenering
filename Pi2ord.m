%Condiciones:
%Gs debe estar en formato de funcion de primer orden (kwn/s^2+2wnzeta+wn)
%ti en segundos y mp en decimales
%pp es criterio de porcentaje 2% o 5% indicar como entero

function Pi2ord(ts,mp,Gsnum,Gsden,pp)
%Parametros para Gs deseada
zeta = sqrt((log(mp)^2/(pi^2 +(log(mp)^2))))
if pp==2
    wn= 4/(zeta*ts)
else
    wn= 3/(zeta*ts)
end

beta = (Gsden(2)/(zeta*wn)) - 2
kc = (((2*beta*zeta^2+1)*wn^2)-Gsden(3))/Gsnum
ki = beta*zeta*wn^3/Gsnum
ti = kc/ki

%Sistema con Control PI final
Csnum = [kc ki];
Csden = [1 0];
Cs = tf(Csnum, Csden);
Gs = tf(Gsnum,Gsden);
Sys = feedback(Gs*Cs,1);
stepinfo(Sys)

subplot(2,1,1)
step(Sys)
grid on

subplot(2,1,2)
pzmap(Sys)
grid on
end