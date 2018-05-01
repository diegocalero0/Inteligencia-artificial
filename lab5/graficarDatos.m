function graficarDatos(XI, y)
	figure
	pos = find(y==1);
	plot(XI(pos, 1), XI(pos, 2), 'k+','LineWidth', 2, 'MarkerSize', 7);
	title('Conjunto de entrenamiento');
	xlabel('Calificacion de Ingenieria de Software I');
	ylabel('Calificacion de Lenguaje de Programacion');
	axis([0 5 0 6]);
	hold on
	neg = find(y==0);
	plot(XI(neg, 1), XI(neg, 2), 'ro', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
	legend('Registro Interaccion Humano-Computador, HCI', ...
	'No registro Interaccion Humano-Computador, HCI')
	plot([0 5],[6 6],"k");
	hold off
endfunction
