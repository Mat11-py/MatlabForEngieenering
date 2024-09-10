function tercerOrden(numSecond,denSecond,numAdd,denAdd)
fSecond = tf(numSecond,denSecond);
fAdd = tf(numAdd,denAdd);
f_3= fSecond*fAdd;
[y1, t1] = step(f_3);
[y2, t2] = step(fSecond);

%GRAFICA
subplot(2,1,1)
plot(t1, y1,'r',t2, y2,'b--')
title('Step response 3°')
grid on

subplot(2,1,2)
pzmap(f_3)
title('Poles')
grid on

%MOSTRAR
f_3
fSecond
end