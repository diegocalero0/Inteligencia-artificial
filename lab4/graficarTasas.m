function [] = graficarTasas(X, y)
  
  title("Costo vs numero de iteracion para varias tasas de aprendizaje");
  xlabel("iteracion");
  ylabel("funcion costo");
  
  #{
  [theta arr] = descensoGradiente(X, y, 1000, 50); 
  hold off
  plot(arr);
  
  [theta arr] = descensoGradiente(X, y, 300, 50); 
  hold on
  plot(arr);
  
  [theta arr] = descensoGradiente(X, y, 100, 50); 
  hold on
  plot(arr);
  
  [theta arr] = descensoGradiente(X, y, 30, 50); 
  hold on
  plot(arr);
  
  [theta arr] = descensoGradiente(X, y, 10, 50); 
  hold on
  plot(arr);
  
  [theta arr] = descensoGradiente(X, y, 3, 50); 
  hold on
  plot(arr);
  
  [theta arr] = descensoGradiente(X, y, 1, 50); 
  hold on
  plot(arr);
  #}
  
  [theta arr] = descensoGradiente(X, y, 0.3, 50); 
  hold on
  plot(arr);
  
  [theta arr] = descensoGradiente(X, y, 0.1, 50); 
  hold on
  plot(arr);
  
  [theta arr] = descensoGradiente(X, y, 0.03, 50); 
  hold on
  plot(arr);
  
  [theta arr] = descensoGradiente(X, y, 0.01, 50); 
  hold on
  plot(arr);
  
  [theta arr] = descensoGradiente(X, y, 0.003, 50); 
  hold on
  plot(arr);
  
  [theta arr] = descensoGradiente(X, y, 0.001, 50); 
  hold on
  plot(arr);
  
  [theta arr] = descensoGradiente(X, y, 0.0003, 50); 
  hold on
  plot(arr);
  
  [theta arr] = descensoGradiente(X, y, 0.0001, 50); 
  hold on
  plot(arr);
  
  legend("alpha = 1000", "alpha = 300", "alpha = 100", "alpha = 30", "alpha = 10", "alpha = 3"
  , "alpha = 1"
  , "alpha = 0.3", "alpha = 0.1", "alpha = 0.03", "alpha = 0.01"
  , "alpha = 0.003", "alpha = 0.001", "alpha = 0.0003", "alpha = 0.0001");
  
endfunction