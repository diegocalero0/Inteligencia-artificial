% REGRESION LOGISTICA CON CARACTERISTICAS POLINOMIALES - PARTE A
% x1: Calificacion de Ingenieria de Software I (0.0-5.0)
% x2: Calificacion de Lenguaje de Programacion (0.0-5.0)
% x3= x1^2
% x4= x1*x2 
% x5= x2^2 etc
% y: Registro Interaccion Humano-Computador, HCI (0/1)

clear % Borrar variables de la memoria
close all % Cerrar ventanas con graficas

x1_texto="x1: Calificacion de Ingenieria de Software I (0.0-5.0)";
x2_texto="x2: Calificacion de Lenguaje de Programacion (0.0-5.0)";
y_texto="y: Registro Interaccion Humano-Computador, HCI? (0/1)";
h_texto="h: Prediccion de probabilidad de que registre Interaccion \
Humano-Computador, HCI";

% Tasa de aprendizaje
alpha=1;  	
% Numero de iteraciones
num_iter=100000;
% Parametro de regularizacion
lambda=0.16;
% Grado del polinomio (degree) 
d=4; 

% Borrar resultados del ultimo entrenamiento
if(exist("_XI.txt"))
	delete("_XI.txt");
	delete("_XIcv.txt");
	delete("_XItest.txt");
	delete("_y.txt");
	delete("_ycv.txt");
	delete("_ytest.txt");
	delete("_X.txt");
	delete("_Xcv.txt");
	delete("_Xtest.txt");
	delete("_mu.txt");
	delete("_sigma.txt");
	delete("_d.txt");
	delete("_alpha.txt");
	delete("_lambda.txt");
	delete("_num_iter.txt");
	delete("_theta.txt");
	delete("_J_historia.txt");
  delete("_JI.txt");
	delete("_indSel.txt");
	delete("_J_historiaSel.txt");
end

fprintf("\n\n\n\n=========================================================\n");
fprintf("REGRESION LOGISTICA CON CARACTERISTICAS POLINOMIALES - PARTE A\n")
fprintf("Prediccion de si un estudiante registra o no \
Interaccion Humano-Computador, HCI\n\n")


% ================ LEER DATOS =================
fprintf("\n\n-----------------------------------------\n");
fprintf("\nDATOS\n\n"); fflush(stdout);
[XI, y, XIcv, ycv, XItest ytest] = leerDatos();

fprintf("Primeros dos ejemplos del conjunto de entrenamiento\n")
fprintf("   x1    x2     y\n"); fflush(stdout);
fprintf("%5.1f %5.1f %5d\n",[XI(1:2,:) y(1:2)]');  fflush(stdout);

fprintf("Primeros dos ejemplos del conjunto de validacion cruzada\n")
fprintf("   x1    x2     y\n"); fflush(stdout);
fprintf("%5.1f %5.1f %5d\n",[XIcv(1:2,:) ycv(1:2)]');  fflush(stdout);

fprintf("Primeros dos ejemplos del conjunto de prueba\n")
fprintf("   x1    x2     y\n"); fflush(stdout);
fprintf("%5.1f %5.1f %5d\n",[XItest(1:2,:) ytest(1:2)]');  fflush(stdout);

fprintf(["\n", x1_texto,"\n"])
fprintf([x2_texto,"\n"])
fprintf([y_texto, "\n\n"])

fprintf("Total ejemplos (estudiantes): %d\n\n", size(XI,1)+size(XIcv,1)+size(XItest,1));
fflush(stdout);

fprintf("\nPresione enter para continuar: ")
pause 

% ======  GRAFICA DE LOS DATOS ==
fprintf("\n\n-----------------------------------------\n");
fprintf("\nGRAFICA DE LOS DATOS\n\n");
fflush(stdout);
graficarDatos(XI, y);
fprintf("\nPresione enter para continuar: ")
pause 

% ================ AGREGAR CARACTERISTICAS POLINOMIALES =============
fprintf("\n\n-----------------------------------------\n");
fprintf("\nCARACTERISTICAS POLINOMIALES\n\n"); fflush(stdout);
fprintf("Grado del polinomio: %d\n\n",d);


XP = mapearCaracteristicas(XI,d);
XPcv = mapearCaracteristicas(XIcv,d);
XPtest = mapearCaracteristicas(XItest,d);
n=size(XP,2);

fprintf("Primer estudiante del conjunto de entrenamiento\n");
fprintf("%16.2f", XP(1,:));  fflush(stdout);
fprintf("\n\nPrimer estudiante del conjunto de validacion cruzada\n");
fprintf("%16.2f", XPcv(1,:)); fflush(stdout);
fprintf("\n\nPrimer estudiante el conjunto de prueba\n");
fprintf("%16.2f", XPtest(1,:)); fflush(stdout);
fprintf("\n\nPresione enter para continuar: ")
pause 

% ================ NORMALIZAR CARACTERISTICAS =============
fprintf("\n\n-----------------------------------------\n");
fprintf("\nNORMALIZACION DE CARACTERISTICAS\n\n"); fflush(stdout);
[XN, XNcv, XNtest, mu, sigma] = normalizarConjuntos(XP, XPcv, XPtest);

fprintf("Medias: \n");  fflush(stdout);
fprintf("%16.4f", mu);  fflush(stdout);
fprintf("\n\nDesviaciones estandar: \n");  fflush(stdout);
fprintf("%16.4f", sigma);  fflush(stdout);

fprintf("\n\nCaracteristicas normalizadas:\n");  fflush(stdout);
fprintf("\nPrimer estudiante del conjunto de entrenamiento\n");  fflush(stdout);
fprintf("%10.4f", XN(1,:)); fflush(stdout);
fprintf("\n\nPrimer estudiante del conjunto de validacion cruzada\n"); fflush(stdout);
fprintf("%10.4f", XNcv(1,:)); fflush(stdout);
fprintf("\n\nPrimer estudiante el conjunto de prueba\n",i);  fflush(stdout);
fprintf("%10.4f", XNtest(1,:)); fflush(stdout);

fprintf("\n\nmedias de las caracteristicas normalizadas: \n");
fprintf("%10.2f", mean(XN)); 
fprintf("\n\nDesviaciones estandar de las caracteristicas normalizadas: \n");
fprintf("%10.2f", std(XN));  fflush(stdout);

fprintf("\n\nPresione enter para continuar: ")
pause 


% ================ AGREGAR COLUMNA DE UNOS =============
fprintf("\n\n-----------------------------------------\n")
fprintf("\nAGREGAR COLUMNA DE UNOS\n\n");
X=agregarUnos(XN);
Xcv=agregarUnos(XNcv);
Xtest=agregarUnos(XNtest);

fprintf("\nPrimer estudiante del conjunto de entrenamiento\n");  fflush(stdout);
fprintf("%10.4f", X(1,:)); fflush(stdout);
fprintf("\n\nPrimer estudiante del conjunto de validacion cruzada\n");
fprintf("%10.4f", Xcv(1,:)); fflush(stdout);
fprintf("\n\nPrimer estudiante el conjunto de prueba\n",i);
fprintf("%10.4f", Xtest(1,:)); fflush(stdout);
fprintf("\n\nPresione enter para continuar: ")
pause 

% ================ FUNCION SIGMOIDE =================================
fprintf("\n\n\n-----------------------------------------\n\n")
fprintf("FUNCION SIGMOIDE g(z)\n\n");
z=[-10; -3; -1; -0.5; 0; 0.5; 1; 3; 10];
g=sigmoide(z);
fprintf("     z       g(z)\n");
fprintf("%8.2f%10.6f\n",[z g]')
fflush(stdout);
fprintf("\nPresione enter para continuar: ")
pause 

% ==== PREDICCIONES PROVISIONALES PARA EL CONJUNTO DE ENTRENAMIENTO =====
fprintf("\n\n-----------------------------------------\n");
fprintf("\nPREDICCIONES PROVISIONALES PARA EL CONJUNTO DE ENTRENAMIENTO\n");
fprintf("Con parametros theta provisionales\n\n");
thetaProv=X(1,:)';
for i=1:size(X,2)
  thetaProv(i)=i/100;
endfor
hProv=prediccionesConjunto(X,thetaProv);
fprintf("    y     h\n"); fflush(stdout);
fprintf("%5d%9.4f\n",[y(1:3) hProv(1:3)]');  fflush(stdout);
fprintf("   ...   ... \n\n");
fprintf([y_texto "\n\n"] );
fprintf([h_texto "\n\n"] );
fprintf("Nota: Las predicciones anteriores no son correctas, \n");
fprintf("mas adelante se obtendran predicciones correctas, \n");
fprintf("cuando se usen los parametros calculados \
por el algoritmo de aprendizaje\n");
fprintf("correctamente ajustado.\n\n");
fflush(stdout);
fprintf("\nPresione enter para continuar: ")
pause 


% ================ FUNCION DE COSTO CON REGULARIZACION =====================
fprintf("\n\n------------------------------------------------------\n");
fprintf("\nFUNCION DE COSTO CON REGULARIZACION,")
fprintf(" CON PARAMETROS PROVISIONALES\n\n");
thetaProv=X(1,:)';
for i=1:size(X,2)
  thetaProv(i)=i/100;
endfor
lambdaProv=0.00;
hProv=prediccionesConjunto(X,thetaProv);
JProv = costo(y, hProv, thetaProv, lambdaProv);
fprintf("Resultado de la funcion de costo con parametros provisionales: ");
fprintf(" %10.6f\n", JProv); 
lambdaProv=0.64;
JProv = costo(y, hProv, thetaProv, lambdaProv);
fprintf("Otro resultado de la funcion de costo con parametros provisionales:")
fprintf(" %10.6f\n", JProv); fflush(stdout);
fprintf("\nPresione enter para continuar: ")
pause 
fflush(stdout);


% ================ DESCENSO POR EL GRADIENTE ============================
fprintf("\n\n-----------------------------------------\n");
fprintf("\nDESCENSO POR EL GRADIENTE CON REGULARIZACION\n\n"); fflush(stdout);

fprintf('\nAlpha=%13.6f\n',alpha);
fprintf('Numero de iteraciones=%7d\n',num_iter);
fprintf('lambda=%5.2f\n',lambda);
fprintf('Grado del polinomio=%d\n\n',d);
fprintf("\n... Ejecutando el algoritmo (puede tardar un poco)...\n\n"); 
fflush(stdout);

thetaI = zeros(n+1, 1); 
hI=prediccionesConjunto(X,thetaI);
JI = costo(y, hI, thetaI, lambda);
[theta J_historia] = descensoGradiente(X, y, alpha, num_iter, lambda);


fprintf('\n\n');
fprintf('\nTheta encontrado por descenso por el gradiente: \n'); fflush(stdout);
for i=1:length(theta)
	fprintf('%10.6f\n', theta(i)); fflush(stdout);
endfor

indSel=[1:10 length(J_historia)-9:length(J_historia)];
fprintf('\n\n# de iteracion    COSTO, J(theta)\n'); fflush(stdout);
fprintf("%7d%22.6f\n", [0  JI]');
fprintf("%7d%22.6f\n", [indSel'  J_historia(indSel)]');
fprintf("\n"); fflush(stdout);

h = prediccionesConjunto(X,theta);
Jtrain=costo(y, h, theta, 0);
fprintf("Error de entrenamiento:%12.6f",Jtrain);
hcv = prediccionesConjunto(Xcv,theta);
Jcv=costo(ycv, hcv, theta, 0);
fprintf("\nError de validacion cruzada:%12.6f\n",Jcv);  fflush(stdout);

csvwrite("_XI.txt", XI);
csvwrite("_XIcv.txt", XIcv);
csvwrite("_XItest.txt", XItest);
csvwrite("_y.txt", y);
csvwrite("_ycv.txt", ycv);
csvwrite("_ytest.txt", ytest);
csvwrite("_X.txt", X);
csvwrite("_Xcv.txt", Xcv);
csvwrite("_Xtest.txt", Xtest);
csvwrite("_mu.txt", mu);
csvwrite("_sigma.txt", sigma);
csvwrite("_d.txt", d);
csvwrite("_alpha.txt", alpha);
csvwrite("_lambda.txt", lambda);
csvwrite("_num_iter.txt", num_iter);
csvwrite("_theta.txt", theta);
csvwrite("_J_historia.txt", J_historia(1:min(100,length(J_historia))));
csvwrite("_JI.txt", JI);
csvwrite("_indSel.txt", indSel);
csvwrite("_J_historiaSel.txt", J_historia(indSel));

fprintf("\n\nPresione enter para continuar: ")
fprintf("\n");
fprintf("\n");
clear

