% REGRESION LOGISTICA CON CARACTERISTICAS POLINOMIALES - PARTE B
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
h_texto="h: Prediccion de probabilidad de que registre \
Interaccion Humano-Computador, HCI";

fprintf("\n\n\n\n=========================================================\n");
fprintf("REGRESION LOGISTICA CON CARACTERISTICAS POLINOMIALES - PARTE B\n")
fprintf("Prediccion de que registre o no la electiva \
Interaccion Humano-Computador, HCI\n\n")

% ============ Carga resultados del último entrenamiento hecho con lab6a.m ====
XI = load('_XI.txt');
XIcv = load('_XIcv.txt');
XItest = load('_XItest.txt');
X = load('_X.txt');
Xcv = load('_Xcv.txt');
Xtest = load('_Xtest.txt');
y = load('_y.txt');
ycv = load('_ycv.txt');
ytest = load('_ytest.txt');
mu = load('_mu.txt');
sigma = load('_sigma.txt');
d = load('_d.txt');
alpha = load('_alpha.txt');
lambda = load('_lambda.txt');
num_iter = load('_num_iter.txt');
theta = load('_theta.txt');
J_historia = load('_J_historia.txt');
JI = load('_JI.txt');
indSel = load('_indSel.txt');
J_historiaSel = load('_J_historiaSel.txt');

% =========== RESULTADOS DEL ULTIMO ENTRENAMIENTO ========================
fprintf("\n-----------------------------------------\n");
fprintf("\nRESULTADOS DEL ULTIMO ENTRENAMIENTO\n");

fprintf('\nTheta encontrado por descenso por el gradiente: \n'); fflush(stdout);
fprintf('%10.6f\n', theta); fflush(stdout);


fprintf('\nAlpha=%13.6f\n',alpha);
fprintf('Numero de iteraciones=%7d\n',num_iter);
fprintf('lambda=%5.2f\n',lambda);
fprintf('Grado del polinomio=%d\n\n',d);

fprintf('# de iteracion    COSTO, J(theta)\n'); fflush(stdout);
fprintf("%7d%22.6f\n", [0  JI]');
fprintf("%7d%22.6f\n", [indSel'  J_historiaSel]');
fprintf("\n"); fflush(stdout);

h = prediccionesConjunto(X,theta);
Jtrain=costo(y, h, theta, 0);
fprintf("Error de entrenamiento:%12.6f",Jtrain);

hcv = prediccionesConjunto(Xcv,theta);
Jcv=costo(ycv, hcv, theta, 0);
fprintf("\nError de validacion cruzada:%12.6f\n",Jcv);  fflush(stdout);
fprintf("\n\nPresione enter para continuar: ");  fflush(stdout);
pause


% ===== PREDICCIONES PARA LOS 10 PRIMEROS EJEMPLOS DE ENTRENAMIENTO ===========
fprintf("\n\n-----------------------------------------\n");
fprintf("\n\nPREDICCIONES PARA LOS EJEMPLOS DE ENTRENAMIENTO\n");
h=prediccionesConjunto(X,theta);
fprintf("\n    y     h\n"); fflush(stdout);
fprintf("%5d%9.4f\n",[y(1:10) h(1:10)]');  fflush(stdout);
fprintf("   ...    ... \n\n");
fprintf([y_texto "\n\n"] );
fprintf([h_texto "\n\n"] );
fflush(stdout);
fprintf("Presione enter para continuar: ");  fflush(stdout);
pause

% ============ PREDICCIONES PARA NUEVOS EJEMPLOS ====================
fprintf("\n\n---------------------------------------------\n");
fprintf("\nPREDICCIONES PARA NUEVOS EJEMPLOS\n\n")
predicciones(theta, mu, sigma, d);
fflush(stdout);
fprintf("\nPresione enter para continuar: ")
pause

% ============== EXACTITUD Y ERROR DE PRUEBA ==================
fprintf("\n\n-----------------------------------------\n");
fprintf("\n\nEXACTITUD DEL MODELO APRENDIDO Y ERROR DE PRUEBA")
h = prediccionesConjunto(X,theta);
exactitudEntrenamiento=calcularExactitud(y, h);
fprintf('\n\nExactitud del entrenamiento:%7.2f%%\n', exactitudEntrenamiento);
fflush(stdout);

hcv = prediccionesConjunto(Xcv,theta);
exactitudcv=calcularExactitud(ycv, hcv);
fprintf('Exactitud de validacion cruzada: %7.2f%%\n', exactitudcv);
fflush(stdout);

htest = prediccionesConjunto(Xtest,theta);
exactitudtest=calcularExactitud(ytest, htest);
fprintf('Exactitud de prueba: %7.2f%%\n', exactitudtest);	 fflush(stdout);
Jtest=costo(ytest, htest, theta, 0);
fprintf("\nEl error de prueba es %12.6f\n",Jtest); fflush(stdout);

fprintf("\n\nPresione enter para continuar: ");  fflush(stdout);
pause

% =================== FRONTERA DE DECISION ============================
fprintf("\n\n-----------------------------------------\n");
fprintf("\nFRONTERA DE DECISION\n\n"); 
fflush(stdout);
fronteraDecision(XI, y, theta, mu, sigma, lambda, d)
fprintf("\n\nPresione enter para continuar: ");  fflush(stdout);
pause

% ======  CURVAS DE APRENDIZAJE =======
fprintf("\n\n-----------------------------------------\n");
fprintf("\n\nCURVAS DE APRENDIZAJE\n");
fprintf("\nGraficar las curvas de aprendizaje");
graficar=input("\n(puede tardar mas de 15 minutos) (s/n/<enter> )?:","s");
fflush(stdout);
if (graficar=="s")
	curvasAprendizaje(X, y, Xcv, ycv, alpha, num_iter, lambda);
endif
fprintf("\nPresione enter para continuar: ")
fprintf("\n\n")
clear