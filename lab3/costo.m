function [J] = costo(y,h)

m=length(y);
J=(1/(2*m))*(sum((h-y).^2));

end