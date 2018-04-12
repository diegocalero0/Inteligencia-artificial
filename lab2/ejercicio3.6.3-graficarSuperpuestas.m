figure;
x = [1.6 1.8 1.5 1.75 1.66 1.9];
y = [80 70 55 76 72 100];

plot(x, y, 'rx', 'MarkerSize', 6);
title('Peso contra estatura');
xlabel('Estatura');
ylabel('Peso');

hold on

x = linspace(1.5, 2, 100);
y = 50 * x - 5;
plot(x, y, "b");

hold off