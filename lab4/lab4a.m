% REGRESION LOGISTICA EN DOS VARIABLES - PARTE A

clear % Borrar variables de la memoria
close all % Cerrar ventanas con graficas

% Caracteristicas y variable a predecir
x1_texto="x1: Puntaje obtenido en prueba de razonamiento matematico(0.0-5.0)";
x2_texto="x2: Puntaje obtenido en prueba de razonamiento verbal(0.0-5.0)";
y_texto="y: Se le recomienda estudiar Ingenieria de Sistemas y Computacion?(1/0)";
h_texto="h: Prediccion de probabilidad de que le sea recomendable estudiar\nIngenieria de Sistemas y Computacion";

% Borrar resultados del ultimo entrenamiento
if(exist("XI.txt"))
	delete("_XI.txt");
	delete("_y.txt");
	delete("_X.txt");
	delete("_mu.txt");
	delete("_sigma.txt");
	delete("_alpha.txt");
	delete("_num_iter.txt");
	delete("_theta.txt");
	delete("_J_historia.txt");
	delete("_JI.txt");
	delete("_indSel.txt");
	delete("_J_historiaSel.txt");
end

fprintf("\n\n\n\n======================================================================\n");
fprintf(        "======================================================================\n");
fprintf("REGRESION LOGISTICA - PARTE A\n")
fprintf("Prediccion de si se recomienda o no estudiar\nIngenieria de Sistemas y Computacion\n\n")

% ================ LEER DE LOS DATOS DE ENTRENAMIENTO =================
fprintf("\n-----------------------------------------\n");
fprintf("DATOS DE ENTRENAMIENTO\n\n")
[XI y]=leerDatos();
fprintf("   x1    x2     y\n"); fflush(stdout);
fprintf("%5.1f %5.1f %5d\n",[XI(1:10,:) y(1:10)]');  fflush(stdout);
fprintf("  ...   ...    ...\n\n");
fprintf([x1_texto,"\n"])
fprintf([x2_texto,"\n"])
fprintf([y_texto, "\n\n"])
fprintf("Total ejemplos de entrenamiento (estudiantes): %d\n\n", size(XI,1));
fprintf("Presione enter para continuar: ")
pause
% vcb 

% ======  GRAFICA DE LOS DATOS ==
fprintf("\n\n-----------------------------------------\n");
fprintf("\nGRAFICA DE LOS DATOS\n\n");
fflush(stdout);
graficarDatos(XI, y);
fprintf("Presione enter para continuar: ")
pause
fprintf("\n");

% ================ NORMALIZAR CARACTERISTICAS =============
fprintf("\n\n-----------------------------------------\n");
fprintf("\nNORMALIZACION DE CARACTERISTICAS\n\n"); fflush(stdout);
[XN, mu, sigma] = normalizarConjunto(XI);

fprintf("Medias: \n");
fprintf("%9.4f", mu);  fflush(stdout);
fprintf("\n\nDesviaciones estandar: \n");
fprintf("%9.4f", sigma);  fflush(stdout);
fprintf("\n\nCaracteristicas normalizadas\n\n");
fprintf("    x1     x2\n"); fflush(stdout);
fprintf("%7.2f%7.2f\n",[XN(1:10,:)]');  fflush(stdout);
fprintf("   ...    ...\n\n");
fprintf("\nMedias de las caracteristicas normalizadas: \n");
fprintf("%9.4f%9.4f\n", mean(XN));  fflush(stdout);
fprintf("\nDesviaciones estandar de las caracteristicas normalizadas: \n");
fprintf("%9.4f%9.4f\n", std(XN));  fflush(stdout);
fprintf("\nPresione enter para continuar: ")
pause

% ================ AGREGAR COLUMNA DE UNOS =============
fprintf("\n\n-----------------------------------------\n")
fprintf("\nAGREGAR COLUMNA DE UNOS\n\n");
X=agregarUnos(XN);
fprintf("\nMatriz X:\n\n"); fflush(stdout);
fprintf("%2d%7.2f%7.2f\n", X(1:10,:)');  fflush(stdout);
fprintf("...   ...    ...\n\n");
fprintf("Presione enter para continuar: ")
pause
% vcb

% ================ FUNCION SIGMOIDE =================================
fprintf("\n\n\n-----------------------------------------\n")
fprintf("\n\nFUNCION SIGMOIDE g(z)");
z=[-10; -3; -1; -0.5; 0; 0.5; 1; 3; 10];
g=sigmoide(z);
fprintf("\n\n     z       g(z)\n");
fprintf("%8.2f%10.6f\n",[z g]')
fflush(stdout);
fprintf("\nPresione enter para continuar: ")
pause


% ==== PREDICCIONES PROVISIONALES PARA TODO EL CONJUNTO DE ENTRENAMIENTO =====
fprintf("\n\n-----------------------------------------\n");
fprintf("\nPREDICCIONES PROVISIONALES PARA TODO EL CONJUNTO DE ENTRENAMIENTO\n");
fprintf("Con parametros theta provisionales\n\n");
thetaProv=[0.1; 0.2; 0.3];
h=prediccionesConjunto(X,thetaProv);
fprintf("Predicciones para todo el conjunto de entrenamiento\n\n"); fflush(stdout);
fprintf("    y     h\n"); fflush(stdout);
fprintf("%5d%7.2f\n",[y(1:10) h(1:10)]');  fflush(stdout);
fprintf("   ...   ... \n\n");
fprintf([y_texto "\n\n"] );
fprintf([h_texto "\n\n"] );
fprintf("Nota: Las predicciones anteriores no son correctas, \n");
fprintf("mas adelante se obtendran predicciones correctas, \n");
fprintf("cuando se usen los parametros calculados por el algoritmo de aprendizaje\n");
fprintf("correctamente ajustado.\n\n");
fflush(stdout);
fprintf("Presione enter para continuar: ")
pause

% ================ FUNCION DE COSTO ======================================
fprintf("\n\n-----------------------------------------\n");
fprintf("\nFUNCION DE COSTO CON PARAMETROS PROVISIONALES\n\n");
thetaProv=[0.1; 0.2; 0.3];
h=prediccionesConjunto(X,thetaProv);
J=costo(y,h);
fprintf("Resultado: %f\n", J); fflush(stdout);
fprintf("\nPresione enter para continuar: ")
pause

% ================ DESCENSO POR EL GRADIENTE ============================
fprintf("\n\n-----------------------------------------\n");
fprintf("\nDESCENSO POR EL GRADIENTE\n\n"); fflush(stdout);
alpha=0.30;  
num_iter=50; 
thetaProv=[0; 0; 0];
hProv=prediccionesConjunto(X,thetaProv);
JI=costo(y,hProv);

fprintf('\n\nAlpha=%13.6f\n',alpha);
fprintf('Numero de iteraciones=%5d\n\n',num_iter);
fprintf("\n... Ejecutando el algoritmo ...\n\n"); 
fprintf("Puede tardar un poco ..."); fflush(stdout);

[theta J_historia] = descensoGradiente(X, y, alpha, num_iter);


fprintf('\n# de iteracion      Costo(J)\n'); fflush(stdout);
fprintf("%9d  %18.10f\n", [0 JI]');
indSel=[1:9 length(J_historia)-9:length(J_historia)];
fprintf("%9d  %18.10f\n", [indSel'  J_historia(indSel)]');
fprintf("\n"); fflush(stdout);

fprintf('\nTheta encontrado por descenso por el gradiente: \n');
fprintf('%12.6f\n', theta); fflush(stdout);

csvwrite("_XI.txt", XI);
csvwrite("_y.txt", y);
csvwrite("_X.txt", X);
csvwrite("_mu.txt", mu);
csvwrite("_sigma.txt", sigma);
csvwrite("_alpha.txt", alpha);
csvwrite("_num_iter.txt", num_iter);
csvwrite("_theta.txt", theta);
csvwrite("_J_historia.txt", J_historia(1:min(100,length(J_historia))));
csvwrite("_JI.txt", JI);
csvwrite("_indSel.txt", indSel);
csvwrite("_J_historiaSel.txt", J_historia(indSel));

% == GRAFICA COSTO VS NUMERO DE ITERACION PARA VARIAS TASAS DE APRENDIZAJE ====
fprintf("\n\n-----------------------------------------\n");
fprintf("GRAFICA DEL COMPORTAMIENTO DE LAS TASAS DE APRENDIZAJE\n");
fflush(stdout);
graficarTasas(X, y);
fprintf("Presione enter para continuar: ")
pause
fprintf("\n")

clear

