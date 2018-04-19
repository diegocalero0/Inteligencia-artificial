function fronteraDecision(XI, y, theta, mu, sigma)
	
	graficarDatos(XI, y);
	
	hold on;
	
	x1 = [0 5];
	
	x1aN = (x1(1)-mu(1))/sigma(1);
	x1bN = (x1(2)-mu(1))/sigma(1);
	
	x2aN = -(theta(2)/theta(3))*x1aN - (theta(1)/theta(3));
	x2bN = -(theta(2)/theta(3))*x1bN - (theta(1)/theta(3));
	

	x2a = (x2aN*sigma(2))+mu(2);
	x2b = (x2bN*sigma(2))+mu(2);
	
	
	x2 = [x2a x2b];
	
	plot(x1,x2);
	
	title("Frontera de decision");
	legend("Se recomienda estudiar Ing de Sistemas", "No se recomienda estudiar Ing de sistemas","Frontera de decision","location","northeast");
	
	hold off;
endfunction