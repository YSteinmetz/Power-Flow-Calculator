function [flag]=utilsCalculatesFlag(DQ,DP,erro,busdata)
    flag = ~boolean(((2*sum(busdata(:,2) == 0))+sum(busdata(:,2) == 1))-(sum(DQ < erro)+sum(DP < erro)));
    %Enquanto alguma barra for maior que o erro a express�o l�gica vai ser
    %verdadeira, quando todas forem menor que o erro ela ser� falso por�m
    %como a express�o � negada ent�o o resultado retornado � ao contr�rio.
end
