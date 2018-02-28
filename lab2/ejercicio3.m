%graficar
figure;

%escala 
x=linspace(0,50,100);

%funcion
y= (sqrt(x)-3);

%pintar
plot(x,y, "r");

%titulo
title("Ejercicio 3");

%labels de los ejes
xlabel("x");
ylabel("y");

%superponer grafica 
hold on

x=linspace(0,50,100);
y=exp(x/40);

plot(x,y,"g");


%superponer desactivado
hold off

%pintar una leyenda descriptiva para cada color 
legend("y=(sqrt(x)-3)", "y=exp(x/40)");

