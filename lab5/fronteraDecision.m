function fronteraDecision(XI, y, theta, mu, sigma, lambda, d)

figure
pos = find(y==1);
plot(XI(pos, 1), XI(pos, 2), 'k+','LineWidth', 2, 'MarkerSize', 4);
axis([0 5 0 6]);

hold on
neg = find(y==0);
plot(XI(neg, 1), XI(neg, 2), 'ro', 'MarkerFaceColor', 'm', 'MarkerSize', 4);
title(strcat('Recomendacion de registrar HCI      Lambda: ',...
            num2str(lambda),...
			'   Grado del polinomino:',...
            num2str(d)));
xlabel('Calificacion de Ingenieria de Software I');
ylabel('Calificacion de Lenguaje de Programacion');

% Dibuja frontera de decision
u = linspace(0, 5, 50);
v = linspace(0, 5, 50);
z = zeros(length(u), length(v));
for i = 1:length(u)
    for j = 1:length(v)
		xp=mapearCaracteristicas([u(i) v(j)], d);
		xn=(xp-mu)./sigma;
		x=[1;xn'];
		z(i,j) = theta'*x;
    end
end
z = z'; % Importante transponer z antes de llamar la funci�n contour
contour(u, v, z, [0, 0], 'LineWidth', 2) % graficar z desde 0 hasta 0

legend('Registro Interaccion Humano-Computador, HCI', ...
	'No registro Interaccion Humano-Computador, HCI', 'Frontera de decision')
plot([0 5], [6 6], "k");
hold off

end





