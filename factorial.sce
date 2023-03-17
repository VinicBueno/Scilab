// Cálculo do fatorial de um número inteiro positivo
function f = fatorial(n) // definir uma função chamada fatorial que recebe um parâmetro n
  if n == 0 then 
    f = 1; // retornar 1 como resultado
  else
    f = n * fatorial(n-1); // retornar n multiplicado pelo fatorial de n-1 como resultado
  end
endfunction

// Exemplo de uso da função
n = 5;           // definir um valor para n
f = fatorial(n); // chamar a função fatorial com o valor de n e armazenar o resultado em f
disp(f);         // mostrar o resultado na tela
