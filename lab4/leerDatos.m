function [XI, y] = leerDatos()
  
  A = load("lab4Datos.txt");
  XI = A(:,2:3);
  y = A(:,4);
  
end