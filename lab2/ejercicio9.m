% Ejecución automática de los programa y funciones solicitados en el laboratorio
clc
clear all
close all

% Podría tener que cambiar los nombres de los programas
% por los que usted utilizó

a="ejercicio1.m";
fprintf("\n----------------------------------\n");
fprintf("%s\n",a);
if(exist(a))
	run(a)
	fprintf("Presione enter para continuar:\n") 
else
  	fprintf("No se encuentra el archivo %s\n",a)
endif
fflush(stdout);
pause

a="ejercicio2.m";
fprintf("\n----------------------------------\n");
fprintf("%s\n",a);
if(exist(a))
	run(a)
	fprintf("Presione enter para continuar:\n") 
else
  	fprintf("No se encuentra el archivo %s\n",a)
endif
fflush(stdout);
pause

a="ejercicio3.m";
fprintf("\n----------------------------------\n");
fprintf("%s\n",a);
if(exist(a))
	run(a)
	fprintf("Presione enter para continuar:\n") 
else
  	fprintf("No se encuentra el archivo %s\n",a)
endif
fflush(stdout);
pause

a="ejercicio4.m";
fprintf("\n----------------------------------\n");
fprintf("%s\n",a);
if(exist(a))
	run(a)
	fprintf("Presione enter para continuar:\n") 
else
  	fprintf("No se encuentra el archivo %s\n",a)
endif
fflush(stdout);
pause

a="ejercicio5.m";
fprintf("\n----------------------------------\n");
fprintf("%s\n",a);
if(exist(a))
  A=[3 4 ; 6 4 ; 7 9 ; 3 5; 8 4 ];
	E=feval( substr(a,1,length(a)-2), A)
	fprintf("Presione enter para continuar:\n")
else
  	fprintf("No se encuentra el archivo %s\n",a)
endif
fflush(stdout);
pause 


a="ejercicio6.m";
fprintf("\n----------------------------------\n");
fprintf("%s\n",a);
if(exist(a))
  A=[5 2 4; 1 3 2; 2 -1 -2; 5 3 1];
  B=[3 1; -2 4; -1 6; 1 1];
	E=feval( substr(a,1,length(a)-2), A, B )
	fprintf("Presione enter para continuar:\n")
else
  	fprintf("No se encuentra el archivo %s\n",a)
endif
fflush(stdout);
pause 

a="ejercicio7.m";
fprintf("\n----------------------------------\n");
fprintf("%s\n",a);
if(exist(a))
  A=[1 5 7 1; 7 4 3 2; 9 6 3 3; 1 2 3 4];
	E=feval( substr(a,1,length(a)-2), A )
	fprintf("Presione enter para continuar:\n")
else
  	fprintf("No se encuentra el archivo %s\n",a)
endif
fflush(stdout);
pause 

a="ejercicio8.m";
fprintf("\n----------------------------------\n");
fprintf("%s\n",a);
if(exist(a))
	A=[15 18 21 1; 24 27 30 2];
  B=[50 52 -1 3; 59 63 -3 4; -1 2 -3 5];
	E=feval( substr(a,1,length(a)-2), A, B )
	fprintf("Presione enter para continuar:\n")
else
  	fprintf("No se encuentra el archivo %s\n",a)
endif
fflush(stdout);
pause 

close all



















