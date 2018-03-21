% REGRESION LINEAL EN MULTIPLES VARIABLES - PARTE C

clear 
close all

% Características y variable a predecir
[XI y]=leerDatos();
m=size(XI,1);

x1_texto="x1: Puntaje obtenido en prueba de razonamiento matematico(0.0-5.0)";
x2_texto="x2: Puntaje obtenido en prueba de razonamiento verbal(0.0-5.0)";
y_texto="y: Se le recomienda estudiar Ingenieria de Sistemas y Computacion?(1/0)";
h_texto="h: Prediccion de probabilidad de que le sea recomendable estudiar\nIngenieria de Sistemas y Computacion";

fprintf("\n\n\n\n------------------------------------------------------\n");
fprintf("REGRESION LOGISTICA - PARTE C\n")
fprintf("Prediccion de si es recomendable para una persona\n");
fprintf("estudiar Ingeniería de Sistemas y Computacion\n\n\n");
fprintf("EJEMPLOS PARA PRUEBA\n\n")

ced=input("Entre los tres ultimos digitos de la cedula de alguno de\nlos integrantes del grupo:\n");
ced = mod(ced,m-4)+1;

fprintf("\nDespues de ajustar correctamente alpha y el numero de iteraciones,\n")
fprintf("deben probar el modelo obtenido con los siguientes ejemplos:\n\n");
fprintf("   x1     x2\n"); fflush(stdout);
fprintf("%6.1f %6.1f\n",[XI(ced:ced+4,:)]');  fflush(stdout);
fprintf(["\n", x1_texto,"\n"])
fprintf([x2_texto,"\n"])

clear
