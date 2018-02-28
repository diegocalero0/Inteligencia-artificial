 % tres condiciones : que exista A, que sea cuadrada y que n sea mayor o igual a dos.
 function Z= ejercicio7(A)
    A
    B =  magic(size(A,1));        %creamos un cuadrado magico del mismo tamaño que A (en este caso tomamos # filas)
    C =  A+B;                     %sumamos posición a posición de A CON B
    D =  C(:,1:2);                %extraemos las dos primeras columnas de C
    E =  C(end-1:end,:);          %extraemos las dos ultimas filas de C
    F =  D + E';                  %sumamos D con la matriz E transpuesta 
    G =  [F(:,1) ; F(:,2)]  ;     %creando un vector columna con dos columnas del vector F
    Z =  G';                      %creando e imprimiendo matriz fila con G transpuesta
endfunction




