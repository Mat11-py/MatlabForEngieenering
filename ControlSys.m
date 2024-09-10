function ControlSys(num,den)
    %parametros del sistema
    k = num/(den(3))
    w = sqrt(den(3))
    z = den(2)/(2*w)
    wd = w*(sqrt((1-z^2)))
    sigma = z*w
    rad_angle = pi + atan(wd/-sigma);
    beta = atan(wd/-sigma)
    tr=rad_angle/wd
    tp = pi/wd
    ts2 = 4/sigma %criterio del 2%
    ts5 = 3/sigma %criterio del 5%
    val = (-sigma*pi)/wd;
    Mp = 100*exp(val)
    
    %Laplace
    myFuncion = tf(num,den)
    stepFunction = tf(1,[1 0]);
    ForRampResponse = myFuncion*stepFunction;
    
    %Escalon
    [y, t] = step(myFuncion);
    %Impulso
    [y2, t2] = impulse(myFuncion);
    %Rampa
    [y3,t3] = step(ForRampResponse);
   
    %grafica
    subplot(4,1,1)
    plot(t,y)
    ylim([0 4])
    title('STEP')
    grid on
    
    subplot(4,1,2)
    plot(t2,y2)
    title('IMPULSE')
    grid on
    
    subplot(4,1,3)
    plot(t3,y3)
    title('RAMP')
    grid on

    subplot(4,1,4)
    pzmap(myFuncion) %polos conjugados 
end
%PLANTA:
%https://wilaebaelectronica.blogspot.com/2019/02/planta-de-segundo-orden-con-amplificador-operacional.html 