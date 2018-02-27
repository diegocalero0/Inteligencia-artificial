 % parametros: debe existir A, debe ser cuadrada y que n sea mayor o igual a dos.
function Z = ejercicio7 (A)                        
    B=magic(size(A, 1));        
    C=A+B;                     
    D=C(:,1:2);                
    E=C(end - 1:end,:);          
    F=D + E';                  
    G=[F(:,1); F(:,2)]  ;     
    Z=G';
endfunction




