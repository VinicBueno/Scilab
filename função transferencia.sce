// Funcao de transferencia e simulacao numerica 
s = poly(0,'s');                                  // Define a variavel compexa s
num = (5*s + 10)
den = (s^2 +4*s +5)
TF = syslin("c",num/den)      // Declaracao da funcao de transferencia TF como sistema linear continuo
t=0:0.01:3;                         // Definicao de um vetor de tempo com inicio em 0, incremento 0.1 e fim em 3
respDegrau = csim('step',t,TF);       // csim simula a resposta ao degrau (step) para os tempos em 't' para a TF

// Representacao grafica 
plot2d(t,respDegrau);  
// Adiciona Titulo e rotulos nos eixos
xlabel("Tempo [s]");                 
ylabel("y1");
title("Resposta ao Degrau");
xgrid(1, 1, 10);                    // Adiciona grade ao fundo do grafico 

// Fracoes parciais de funcao de transferencia
num = 185.71*(s+7); 
den = (s+6.5)*(s+10)*(s+20); 
g = syslin('c',num/den); 
g2 = pfss(g);  // o comando pfss() gera as fracoes parciais 
raizes = roots(den) // o comando roots calcula as raizes do polinomio 
