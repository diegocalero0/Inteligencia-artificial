function graficarDatos(XI, y)
  pos = find(y == 1);
  x1p = XI(pos, 1);
  x2p = XI(pos, 2);
  
  pos2 = find(y == 0);
  x1n = XI(pos2, 1);
  x2n = XI(pos2, 2);
  
  plot(x1p, x2p, 'r+', 'MarkerSize', 6);
  hold on
  plot(x1n, x2n, 'bo', 'MarkerSize', 6);
  title("Notas");
  xlabel("Razonamiento matemático");
  ylabel("Razonamiento verbal");
  
  
end