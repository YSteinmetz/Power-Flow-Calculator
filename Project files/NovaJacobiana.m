function [J] = NovaJacobiana(busdata,G,B,NB,maskDP,maskDQ)

H = zeros(NB,NB);     %Linhas e Colunas de H devem ter tamanho NPQ + NPV
N = zeros(NB,NB);         %Linhas de N deve ter tamanho NPQ + NPV e Colunas tamanho NPQ
M = zeros(NB,NB);         %Linhas de M deve ter tamanho NPQ e Colunas NPQ + NPV
L = zeros(NB,NB);    
bd = busdata;
% Calculando as submatrizes

for k = 1:NB
    
   H(k,k)= -bd(k,3)*bd(k,3)*B(k,k);
   N(k,k)= bd(k,3)*G(k,k);
   M(k,k)= -bd(k,3)*bd(k,3)*G(k,k);
   L(k,k) = -bd(k,3)*B(k,k);
   
   
    for m = 1:NB
        if k ~= m
            
           H(k,m) = bd(k,3)*bd(m,3)*((G(k,m)*sin(bd(k,4)-bd(m,4))-B(k,m)*cos(bd(k,4)-bd(m,4))));
           N(k,m) = bd(k,3)*((G(k,m)*cos(bd(k,4)-bd(m,4))+B(k,m)*sin(bd(k,4)-bd(m,4))));
           M(k,m) = -bd(k,3)*bd(m,3)*((G(k,m)*cos(bd(k,4)-bd(m,4))+B(k,m)*sin(bd(k,4)-bd(m,4))));
           L(k,m) = bd(k,3)*((G(k,m)*sin(bd(k,4)-bd(m,4))-B(k,m)*cos(bd(k,4)-bd(m,4))));
            
        end
      
        H(k,k) = H(k,k) - bd(k,3)*bd(m,3)*((G(k,m)*sin(bd(k,4)-bd(m,4))-B(k,m)*cos(bd(k,4)-bd(m,4))));
        N(k,k) = N(k,k) + bd(m,3)*((G(k,m)*cos(bd(k,4)-bd(m,4))+B(k,m)*sin(bd(k,4)-bd(m,4))));
        M(k,k) = M(k,k)+ bd(k,3)*bd(m,3)*((G(k,m)*cos(bd(k,4)-bd(m,4))+B(k,m)*sin(bd(k,4)-bd(m,4))));
        L(k,k) = L(k,k) + bd(m,3)*((G(k,m)*sin(bd(k,4)-bd(m,4))-B(k,m)*cos(bd(k,4)-bd(m,4))));
           
    end
end

H = H(maskDP,maskDP);
N = N(maskDP,maskDQ);
M = M(maskDQ,maskDP);
L = L(maskDQ,maskDQ);



V = [H;M];
I = [N;L];
J = [V,I];
end
