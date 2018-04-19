function estadisticas(x2)
masDeTres =0;
menosDeTres=0;
PorcentajeTotal=0;
PuntajePromedio=0;
NumEstudiantesCuatroCincoOmas=0;

for j=1:length(x2)
  PuntajePromedio+=x2(j);
  if x2(j) >= 3.0
    masDeTres++;
  elseif x2(j) < 3.0
    menosDeTres++;
  endif
  
  if x2(j) >= 4.5
    NumEstudiantesCuatroCincoOmas++;
  endif  
endfor

fprintf('Porcentaje de estudiantes que obtuvieron 3.0 o mas:      %3.2f%%\n', ((masDeTres*100)/length(x2)));
fprintf('Porcentaje de estudiantes que obtuvieron menos de 3.0:     %3.2f%%\n',(menosDeTres*100)/length(x2));
fprintf('Porcentaje total:      %3.2f%%\n', ((masDeTres*100)/length(x2))+((menosDeTres*100)/length(x2)));
fprintf('Puntaje promedio:      %1.2f\n', (PuntajePromedio/length(x2)));
fprintf('Número de estudiantes que obtuvieron 4.5 o mas:      %04d\n',NumEstudiantesCuatroCincoOmas);

endfunction