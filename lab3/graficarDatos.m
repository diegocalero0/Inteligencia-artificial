function [XI, y] = graficarDatos()

figure
A=load("lab3Datos.txt");
XI=A(:,2);
y=A(:,3);
plot(XI, y, 'rx', 'MarkerSize', 6);
title('Precio Vivienda Vs Areas Vivienda');
xlabel('Area de una vivienda');
ylabel('Precio de una vivienda');

end