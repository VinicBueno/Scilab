s = poly(0,'s');
num = (10)
den = (s^2 +20*s +500)
TF = syslin("c",num/den)
t=0:0.01:3;

respDegrau = csim('step',t,TF);

// Representacao grafica 
plot2d(t,respDegrau);  
// Adiciona Titulo e rotulos nos eixos
xlabel("Tempo [s]");                 
ylabel("y1");
title("Resposta ao Degrau");
xgrid(1, 1, 10);
