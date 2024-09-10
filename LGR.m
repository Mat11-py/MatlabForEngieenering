clc 
clear all

k = 1; 
numDen = tf([k*1 k*4], [1 0]);
den2 = tf(1, [1 3]);
den3 = tf(1, [1 5]);
den4 = tf(1, [1 2 2]);

p = numDen*den2*den3*den4;
sistema = feedback(p,1);
figure(1);
rlocus(p)
title("LGR FT")
figure(2); 
rlocus(sistema)
title("LGR SISTEMA RETROALIMENTADO")
figure(3);
subplot(2,1,1)
step(sistema)
grid on
subplot(2,1,2)
pzmap(sistema)
grid on

