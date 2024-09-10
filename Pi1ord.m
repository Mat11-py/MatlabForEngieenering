%Condiciones:
%Gs debe estar en formato de funcion de primer orden (kp/ts+1)
%ti en segundos y mp en decimales
%pp es criterio de porcentaje 2% o 5% indicar como entero

function Pi1ord(ts,mp,Gsnum,Gsden,pp)
%Parametros para Gs deseada
zeta = sqrt((log(mp)^2/(pi^2 +(log(mp)^2))))
if pp==2
    wn= 4/(zeta*ts)
else
    wn= 3/(zeta*ts)
end

Gdnum = wn^2;
Gdden = [1 2*zeta*wn wn^2];
Gd = tf(Gdnum,Gdden);

%Parametros para el Controlador PI
kc = (2*zeta*wn*Gsden(1)-1)/Gsnum
ti = (kc*Gsnum)/(wn^2*Gsden(1))

%Sistema con Control PI final
Csnum = [kc*ti kc];
Csden = [ti 0];
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
