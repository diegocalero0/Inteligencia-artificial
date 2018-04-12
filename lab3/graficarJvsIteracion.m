function [] = graficarJvsIteracion (iter,J_historia)
figure;
plot(iter,J_historia,"b");
title('Iteracion Vs Funcion Costo');
xlabel('Iteracion');
ylabel('Funcion Costo');
end