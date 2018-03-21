% REGRESION LOGISTICA EN DOS VARIABLES - PARTE B

clear % Borrar variables de la memoria
close all % Cerrar ventanas con graficas


% Caracteristicas y variable a predecir
x1_texto="x1: Puntaje obtenido en prueba de razonamiento matematico(0.0-5.0)";
x2_texto="x2: Puntaje obtenido en prueba de razonamiento verbal(0.0-5.0)";
y_texto="y: Se le recomienda estudiar Ingenieria \
de Sistemas y Computacion?(1/0)";
h_texto="h: Prediccion de probabilidad de que le sea recomendable \
estudiar\nIngenieria de Sistemas y Computacion";


fprintf("\n\n\n\n==========================================================\n");
fprintf(        "========================================================\n");
fprintf("REGRESION LOGISTICA EN DOS VARIABLES - PARTE B\n")
fprintf("Prediccion de si se recomienda o no\
 estudiar\nIngenieria de Sistemas y Computacion\n\n")

% ============ Carga resultados del ultimo entrenamiento hecho con lab4a.m ====
XI = load('_XI.txt');
y = load('_y.txt');
X = load('_X.txt');
mu = load('_mu.txt');
sigma = load('_sigma.txt');
alpha = load('_alpha.txt');
num_iter = load('_num_iter.txt');
theta = load('_theta.txt');
J_historia = load('_J_historia.txt');
JI = load('_JI.txt');
indSel = load('_indSel.txt');
J_historiaSel = load('_J_historiaSel.txt');

% =========== RESULTADOS DEL ULTIMO ENTRENAMIENTO ========================

fprintf("\n-----------------------------------------\n");
fprintf("RESULTADOS DEL ULTIMO ENTRENAMIENTO\n\n");
fprintf('Alpha=%13.6f\n',alpha);
fprintf('Numero de iteraciones=%5d\n\n',num_iter);
fprintf('# de iteracion      Costo(J)\n'); fflush(stdout);
fprintf("%9d  %18.10f\n", [0 JI]');
fprintf("%9d  %18.10f\n", [indSel'  J_historiaSel]');
fprintf("\n"); fflush(stdout);
fprintf('\nTheta encontrado por descenso por el gradiente: \n');
fprintf('%12.6f\n', theta); fflush(stdout);
fprintf("\nPresione enter para continuar: ")
pause


% ======== REDICCIONES PARA TODO EL CONJUNTO DE ENTRENAMIENTO =================
fprintf("\n\n-----------------------------------------\n");
fprintf("PREDICCIONES PARA TODO EL CONJUNTO DE ENTRENAMIENTO\n\n");
h=prediccionesConjunto(X,theta);
fprintf("    y     h\n"); fflush(stdout);
fprintf("%5d%7.2f\n",[y(1:10) h(1:10)]');  fflush(stdout);
fprintf("   ...   ... \n\n");
fprintf([y_texto "\n\n"] );
fprintf([h_texto "\n\n"] );
fflush(stdout);
fprintf("Presione enter para continuar: ")
pause


% ============ PREDICCIONES PARA NUEVOS EJEMPLOS ====================
fprintf("\n\n---------------------------------------------\n");
fprintf("\nPREDICCIONES PARA NUEVOS EJEMPLOS\n\n")
predicciones(theta, mu, sigma);

% ============== EXACTITUD DEL ENTRENAMIENTO ==================
fprintf("\n\n-----------------------------------------\n");
fprintf("\n\nEXACTITUD DEL ENTRENAMIENTO")
h = prediccionesConjunto(X,theta);
exactitudEntrenamiento=calcularExactitud(y, h);
fprintf('\n\nExactitud del entrenamiento:%8.3f%%\n', exactitudEntrenamiento);	
fprintf("\nPresione enter para continuar: ")
pause

% ============== FRONTERA DE DECISION ==================
fprintf("\n\n-----------------------------------------\n");
fprintf("\nFRONTERA DE DECISION\n\n");
fflush(stdout);
fronteraDecision(XI, y, theta, mu, sigma)


% ============== ESTADISTICAS ==================

fprintf("\n\n-----------------------------------------\n");
fprintf("\nESTADISTICAS DE LA PRUEBA DE RAZONAMIENTO VERBAL\n\n");
estadisticas(XI(:,2));


clear

