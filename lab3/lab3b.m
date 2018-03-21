% REGRESION LINEAL UNA SOLA VARIABLE - PARTE B
% Prediccion del precio de una vivienda
% con base en su area

clear % Borrar variables de la memoria
close all % Cerrar ventanas con graficas
clc % borrar consola

problema="Prediccion del precio de una vivienda";
x1_texto="Area de la vivienda (Metros cuadrados)";
y_texto="Precio de la vivienda (Millones de pesos)";

fprintf("REGRESION LINEAL EN UNA VARIABLE - PARTE B\n")
fprintf([problema "\n\n"])

% ============ Carga resultados del ultimo entrenamiento hecho con lab3a.m ====
XI = load('_XI.txt');
y = load('_y.txt');
X = load('_X.txt');
alpha = load('_alpha.txt');
num_iter = load('_num_iter.txt');
theta = load('_theta.txt');
J_historia = load('_J_historia.txt');
JI = load('_Ji.txt');
indSel = load('_indSel.txt');
J_historiaSel = load('_J_historiaSel.txt');

% =========== RESULTADOS DEL ULTIMO ENTRENAMIENTO ========================
fprintf("-----------------------------------------\n");
fprintf("\nRESULTADOS DEL ULTIMO ENTRENAMIENTO\n\n");

fprintf('Alpha=%13.6f\n',alpha);
fprintf('Numero de iteraciones=%7d\n\n',num_iter);

fprintf('   # de         Funcion\n'); 
fprintf('iteracion      de costo\n'); 
fprintf('                   J\n'); fflush(stdout);
fprintf("%7d%19.10f\n", [0  JI]');
fprintf("%7d%19.10f\n", [indSel'  J_historiaSel]');
fflush(stdout);
fprintf("\n"); 

fprintf('\nTheta encontrado por descenso por el gradiente: \n');
fprintf('%12.6f\n', theta); fflush(stdout);
fprintf("\n");
fprintf("Presione enter para continuar: ")
pause
fprintf("\n");


% ======= PREDICCIONES PARA TODO EL CONJUNTO DE ENTRENAMIENTO ============
fprintf("\n\n-----------------------------------------\n");
fprintf("\nPREDICCIONES PARA ALGUNOS EJEMPLOS DE ENTRENAMIENTO\n");
fprintf("CON PARAMETROS HALLADOS CON DESCENSO POR EL GRADIENTE\n\n");
h=prediccionesConjunto(X,theta);
fprintf("Parametros:\n%12.6f\n%12.6f\n\n",theta(1),theta(2));
fprintf(" x1    y      h\n"); fflush(stdout);
fprintf("%3d%7d%8.2f\n",[XI(1:10) y(1:10) h(1:10)]');  fflush(stdout);
fprintf(" ...  ...    ...\n\n");
fprintf(["x1: ", x1_texto,"\n"])
fprintf(["y: ", y_texto, "\n"])
fprintf("h: Prediccion del precio de la vivienda\n")
fprintf("   con parametros hallados con descenso por el gradiente\n\n")
fprintf("Nota: Estas predicciones deben ser correctas, \n");
fprintf("si el algoritmo de aprendizaje fue correctamente implementado\n\n");
fflush(stdout);
fprintf("Presione enter para continuar: ")
pause
fprintf("\n");
fflush(stdout);

% ============ PREDICCIONES PARA NUEVOS EJEMPLOS ====================
fprintf("\n\n---------------------------------------------\n");
fprintf("\nPREDICCIONES PARA NUEVOS EJEMPLOS\n\n")
predicciones(theta);

% ============ TABLA  ====================
fprintf("\n\n---------------------------------------------\n");
fprintf("\nDISTRIBUCION DE LAS AREAS DE VIVIENDA REGISTRADAS\
 EN EL CONJUNTO DE ENTRENAMIENTO\n\n"); 
tabla(XI);
fflush(stdout);
fprintf("\n\nPresione enter para continuar: ")
fflush(stdout);
pause
fprintf("\n");

% ============ GRAFICA DEL COSTO VS NUMERO DE ITERACION 
fprintf("\n\n-----------------------------------------\n");
fprintf("\nGRAFICA DEL COSTO VS NUMERO DE ITERACION\n\n")
fflush(stdout);
graficarJvsIteracion(0:50, [JI; J_historia(1:50)]);
fprintf("Presione enter para continuar: ")
pause
fprintf("\n");

% ======  GRAFICA DEL MODELO SUPERPUESTO A LOS DATOS ====================
fprintf("\n\n-----------------------------------------\n");
fprintf("\nGRAFICA DEL MODELO SUPERPUESTO A LOS DATOS\n\n");
fflush(stdout);
graficarModelo(XI, y, theta);
fprintf("Presione enter para continuar: ")
pause
fprintf("\n");


% ====== GRAFICA DE SUPERFICIE DE LA FUNCION DE COSTO ===================
fprintf("\n\n-----------------------------------------\n");
fprintf("\nGRAFICA DE SUPERFICIE DE LA FUNCION DE COSTO\n\n");
fflush(stdout);
fprintf("Los parametros theta(0)=%6.2f y theta(1)=%6.2f aprendidos,\n",theta(1), theta(2));
fprintf("deben minimizar la funcion de costo\n\n");
fprintf("Es posible que alguno de los parametros sea dificil de observar en este tipo de grafica\n\n");
graficarSuperficie(X,y);
fprintf("Presione enter para continuar: ")
pause
fprintf("\n");


% ========== GRAFICA DE CONTORNO DE LA FUNCION DE COSTO ===================
fprintf("\n\n------------------------------------------\n");
fprintf("\nGRAFICA DE CONTORNO DE LA FUNCION DE COSTO\n\n")
fprintf("Los parametros theta(0)=%6.2f y theta(1)=%6.2f aprendidos,\n",theta(1), theta(2));
fprintf("deben minimizar la funcion de costo\n\n");
fflush(stdout);
graficarContorno(X,y);
fprintf("Presione enter para continuar: ")
pause
fprintf("\n");

clear

