function [] = predicciones(theta)
  
c="s";
while(c!="n")
x=input("Ingrese el area de la vivienda: ");
h=theta'*x;
disp(h);
c=input("Continuar(s/n): ","s");
endwhile

end
