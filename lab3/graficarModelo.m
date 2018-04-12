function []=graficarModelo(XI,y,theta)
figure;

%figura1
plot(XI,y,"bx");
title('Conjunto de Datos vs Ajuste del Modelo');
xlabel('Areas de Viviendas');
ylabel('Precio de Viviendas');

hold on
%figura2
xa= min(XI);
xb= max(XI);
ha=theta'*[1;xa]
hb=theta'*[1;xb]
plot([xa xb],[ha hb],"r");
hold off

end