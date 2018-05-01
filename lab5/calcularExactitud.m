function exactitudEntrenamiento = calcularExactitud (y, h)
	p=(h>=0.5);
	exactitudEntrenamiento=mean(p == y) * 100;	
end
