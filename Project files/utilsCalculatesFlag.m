function [flag]=utilsCalculatesFlag(DQ,DP,erro,busdata)
    flag = ~boolean(((2*sum(busdata(:,2) == 0))+sum(busdata(:,2) == 1))-(sum(DQ < erro)+sum(DP < erro)));
    %Enquanto alguma barra for maior que o erro a expressão lógica vai ser
    %verdadeira, quando todas forem menor que o erro ela será falso porém
    %como a expressão é negada então o resultado retornado é ao contrário.
end
