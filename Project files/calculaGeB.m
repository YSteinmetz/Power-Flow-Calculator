function [G,B] = calculaGeB(linedata,NB)
    G = zeros(NB,NB);
    B = zeros(NB,NB);
for aux = 1:NB
    
    
    G(linedata(aux,1),linedata(aux,2)) = -linedata(aux,3)/(linedata(aux,3)^2 + linedata(aux,4)^2);
    B(linedata(aux,1),linedata(aux,2)) = linedata(aux,4)/(linedata(aux,3)^2 + linedata(aux,4)^2);
    
    
    G(linedata(aux,2),linedata(aux,1)) = G(linedata(aux,1),linedata(aux,2));
    B(linedata(aux,2),linedata(aux,1)) = B(linedata(aux,1),linedata(aux,2));
    
    
    G(linedata(aux,1),linedata(aux,1)) = G(linedata(aux,1),linedata(aux,1)) +(linedata(aux,3)/(linedata(aux,3)^2 + linedata(aux,4)^2));
    G(linedata(aux,2),linedata(aux,2)) = G(linedata(aux,2),linedata(aux,2)) +(linedata(aux,3)/(linedata(aux,3)^2 + linedata(aux,4)^2));
    
    
    B(linedata(aux,1),linedata(aux,1)) = B(linedata(aux,1),linedata(aux,1)) -(linedata(aux,4)/(linedata(aux,3)^2 + linedata(aux,4)^2)) +(linedata(aux,5));
    B(linedata(aux,2),linedata(aux,2)) = B(linedata(aux,2),linedata(aux,2)) -(linedata(aux,4)/(linedata(aux,3)^2 + linedata(aux,4)^2)) +(linedata(aux,5));
end
end