% REGRESION LINEAL UNA SOLA VARIABLE - PARTE A
% Prediccion del precio de una vivienda
% con base en su area

clear % Borrar variables de la memoria
close all % Cerrar ventanas con graficas
clc % borrar consola

problema="Prediccion del precio de una vivienda";
x1_texto="Area de la vivienda (metros cuadrados)";
y_texto="Precio de la vivienda (millones de pesos)";


% Borrar resultados del ultimo entrenamiento
if(exist("_XI.txt"))
	delete("_XI.txt");
	delete("_y.txt");
	delete("_X.txt");
	delete("_alpha.txt");
	delete("_num_iter.txt");
	delete("_theta.txt");
	delete("_J_historia.txt");
  delete("_JI.txt");
	delete("_indSel.txt");
	delete("_J_historiaSel.txt");
end

fprintf("REGRESION LINEAL EN UNA VARIABLE - PARTE A\n")
fprintf(problema)
fprintf("\n\n")

% ================ LEER DE LOS DATOS DE ENTRENAMIENTO =================
fprintf("DATOS DE ENTRENAMIENTO\n\n")
[XI y]=leerDatos();
fprintf(" x1     y\n"); fflush(stdout);
fprintf("%3d%7d\n",[XI(1:10) y(1:10)]');  fflush(stdout);
fprintf("...    ...\n\n");
fprintf(["x1: ", x1_texto,"\n"])
fprintf(["y: ", y_texto, "\n\n"])
fprintf("Presione enter para continuar: ")
pause
fprintf("\n");
fflush(stdout);

% ================ GRAFICAR LOS DATOS DE ENTRENAMIENTO =============
fprintf("\n\n-----------------------------------------\n")
fprintf("\nGRAFICA DE LOS DATOS DE ENTRENAMIENTO\n\n"); fflush(stdout);
graficarDatos(XI,y);
fprintf("Presione enter para continuar: ")
pause
fprintf("\n");

% ================ AGREGAR COLUMNA DE UNOS =============
fprintf("\n\n-----------------------------------------\n")
fprintf("\nAGREGAR COLUMNA DE UNOS\n\n");
X=agregarUnos(XI);
fprintf("\nMatriz X:\n"); fflush(stdout);
fprintf("%2d%5d\n", X(1:10,:)');  fflush(stdout);
fprintf("... ...\n\n");
fprintf("Presione enter para continuar: ")
pause
fprintf("\n");

% ==== PREDICCIONES PROVISIONALES PARA TODO EL CONJUNTO DE ENTRENAMIENTO =====
fprintf("\n\n-----------------------------------------\n");
fprintf("\nPREDICCIONES PARA TODO EL CONJUNTO DE ENTRENAMIENTO\n");
fprintf("CON PARAMETROS THETA PROVISIONALES\n\n");
thetaProv=[2; 1];
h=prediccionesConjunto(X,thetaProv);
fprintf("Parametros provisionales:%6.2f%6.2f\n\n",thetaProv(1),thetaProv(2));
fprintf("Predicciones para todo el conjunto de entrenamiento\n"); fflush(stdout);
fprintf(" x1     y     h\n"); fflush(stdout);
fprintf("%3d%7d%8.2f\n",[XI(1:10) y(1:10) h(1:10)]');  fflush(stdout);
fprintf("...    ...    ...\n\n");
fprintf(["x1: ", x1_texto,"\n"])
fprintf(["y: ", y_texto, "\n"])
fprintf("h: Prediccion del precio de la vivienda\n\n")
fprintf("Nota: Las predicciones anteriores no son correctas. \n");
fprintf("Mas adelante se obtendran predicciones correctas, \n");
fprintf("cuando los parametros sean calculados por el algoritmo de aprendizaje\n\n");
fprintf("Presione enter para continuar: ")
pause
fprintf("\n");
fflush(stdout);

% ================ FUNCION DE COSTO CON PARAMETROS PROVISIONALES ==========
fprintf("\n\n-----------------------------------------\n");
fprintf("\nFUNCION DE COSTO CON PARAMETROS PROVISIONALES\n\n");
thetaProv=[2; 1];
h=prediccionesConjunto(X,thetaProv);
J=costo(y,h);
fprintf("Resultado de la funcion de costo con parametros provisionales:\n%13.6f\n\n", J); 
fprintf("Nota: mas adelante se obtendra un valor mucho menor para la funcion de costo, \n");
fprintf("cuando los parametros sean calculados por el algoritmo de aprendizaje\n\n");
fflush(stdout);
fprintf("Presione enter para continuar: ")
pause
fprintf("\n");


% ================ DESCENSO POR EL GRADIENTE ============================
fprintf("\n\n-----------------------------------------\n");
fprintf("\nDESCENSO POR EL GRADIENTE\n\n"); 
fprintf("Ejecutando el algoritmo de aprendizaje\n");
fprintf("Puede tardar un poco ...\n");
alpha=0.0001; 
num_iter=500000; % Ajustado es 500000;
fprintf('\n');
fflush(stdout);

m=size(XI,1);
thetaProv = zeros(2, 1); 
hProv=X*thetaProv;
JI=1/(2*m)*sum((hProv-y).^2);

[theta J_historia] = descensoGradiente(X, y, alpha, num_iter);
fflush(stdout);
fprintf('\n');

indSel=[1:5 length(J_historia)-4:length(J_historia)];
fprintf('\n\nAlpha=%13.6f\n',alpha);
fprintf('Numero de iteraciones=%7d\n\n',num_iter);

fprintf('   # de         Funcion\n'); 
fprintf('iteracion      de costo\n'); 
fprintf('                   J\n'); fflush(stdout);
fprintf("%7d%19.10f\n", [0  JI]');
fprintf("%7d%19.10f\n", [indSel'  J_historia(indSel)]');
fflush(stdout);
fprintf("\n"); 

fprintf('\nTheta encontrado por descenso por el gradiente: \n');
fprintf('%12.6f\n', theta); fflush(stdout);
fprintf("\n");
fprintf("Presione enter para continuar: ")
pause
fprintf("\n");


% ============== Salva resultado del entrenamiento y otras variables =======
csvwrite("_XI.txt", XI);
csvwrite("_y.txt", y);
csvwrite("_X.txt", X);
csvwrite("_alpha.txt", alpha);
csvwrite("_num_iter.txt", num_iter);
csvwrite("_theta.txt", theta);
csvwrite("_J_historia.txt", J_historia(1:min(1000,length(J_historia))));
csvwrite("_JI.txt", JI);
csvwrite("_indSel.txt", indSel);
csvwrite("_J_historiaSel.txt", J_historia(indSel));


clear
%  close all
