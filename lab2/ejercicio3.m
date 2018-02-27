% Ejercicio Numero 3
%figura 1
figure
x=linspace(0,50,100);
y=sqrt(x)-3;
plot(x, y, "b");
title('Ejercicio 3');
xlabel('x');
ylabel('y');
%figura 2
hold on
x=linspace(0,50,100);
y=exp(x/40);
plot(x, y, "c");
hold off
