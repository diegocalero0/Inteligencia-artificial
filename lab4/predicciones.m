function []= predicciones(theta, mu, sigma)
do
a= input("Ingrese el resultado obtenido en la prueba de razonamiento matematico (0.0 a 5.0): ");
b= input("Ingrese el resultado obtenido en la prueba de razonamiento verbal (0.0 a 5.0): ");

xi=[a; b];
for i=1:2
	xn(:,i)= ((xi'(:,i)-mu(i))/sigma(i));
endfor
x=[1 xn]
h=sigmoide(theta'*x');
fprintf("Prediccion de probabilidad de que le sea recomendable estudiar ingenieria de sistemas y computacion: %1.4f\n  ",h);
continuar= input("Continuar (s/n):", "s")
until(continuar=='n')

endfunction