function [XN, XNcv, XNtest, mu, sigma] = normalizarConjuntos(XP, XPcv,XPtest)
  XN = XP;
  XNcv = XPcv;
  XNtest = XPtest;
  mu=mean(XP);
  sigma=std(XP);
  m=size(XP,1);
  for i=1:m;
    XN(i,:) = (XP(i,:) - mu)./sigma;
  endfor;

  m=size(XPcv,1);
  for i=1:m;
    XNcv(i,:) = (XPcv(i,:) - mu)./sigma;
  endfor;

  m=size(XPtest,1);
  for i=1:m;
    XNtest(i,:) = (XPtest(i,:) - mu)./sigma;
  endfor;
endfunction