/*
Vinícius Bueno Macedo - Aerospace Engineer
email: viniiciusbueno0@gmail.com

Este código desenha o conjunto de Mandelbrot usando o algoritmo "escape time". 
O conjunto de Mandelbrot é o conjunto dos números complexos c para os quais a sequência 
z_n = z_{n-1}^2 + c, com z_0 = 0, não diverge.
*/

// Definir os parâmetros do gráfico
x0 = -2;       // limite esquerdo
x1 = 1;        // limite direito
y0 = -1.5;     // limite inferior
y1 = 1.5;      // limite superior
n = 500;       // número de pontos por eixo
maxiter = 50;  // número máximo de iterações
tol = 2;       // tolerância para divergência

// Criar uma matriz de complexos com os pontos do plano
x = linspace(x0,x1,n); // vetor dos valores de x
y = linspace(y0,y1,n); // vetor dos valores de y
[X,Y] = ndgrid(x,y);   // matriz bidimensional dos valores de x e y
Z = X + %i*Y;          // matriz dos números complexos correspondentes

// Inicializar a matriz dos resultados com zeros
M = zeros(n,n);

// Iterar sobre cada ponto da matriz Z e verificar se pertence ao conjunto de Mandelbrot
for i=1:n 
    for j=1:n 
        c = Z(i,j); // ponto atual
        z = c;      // valor inicial da sequência z_n+1 = z_n^2 + c 
        k = 0;      // contador das iterações
        
        while (k < maxiter) & (abs(z) < tol) 
            z = z^2 + c; // calcular o próximo termo da sequência 
            k = k + 1;   // incrementar o contador 
        end
        
        M(i,j) = k;      // armazenar o número de iterações na matriz dos resultados 
    end 
end 

// Plotar a matriz dos resultados como uma imagem colorida 
clf();                            // limpar a figura atual 
grayplot(x,y,M);                  // plotar a imagem em escala de cinza 
xtitle('Conjunto de Mandelbrot'); // colocar o título do gráfico 
