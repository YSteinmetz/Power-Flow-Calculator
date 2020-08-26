function guiabrenewtonD(busdata,linedata,basemva,var)
clc;
tic % começa a contar o tempo
erro = 0.003;

flag2 = 0;
while flag2 == 0    
NB = size(busdata);
NB = NB(1,1);
busdata = converteparapu(busdata,basemva); %converte as potências para PU

[G,B] = calculaGeB(linedata,NB);

[busdata,Qk,Pk,int,balapot]=newtonrD(busdata,NB,G,B,erro,linedata); %inicia o newton
[busdata] = calculaPpVOeQpPV(NB,busdata,G,B); %Calcula P para as barras VTHETA e calcula Q para as barras VTHETA e PV
[busdata,flag2]=calculalimite(busdata,NB,flag2,var); %Verifica se a barra PV virou uma PQ
if flag2 == 1 %se uma barra PV virou PQ
    flag2 = 0;%abaixa a bandeira e calcula o fluxo novamente
else
   flag2 = 1; %levanta a bandeira e sai do código
end

end
[busdata]=prepa_apresen_res_finais(busdata,Pk,Qk,NB);

fprintf('O total de interações é: %d \n\n',int);

fprintf('\n   Barra Nr     Barra Tipo      Tensão ....\n');
disp(busdata);

fprintf('\n Pkm Qkm Pmk Qmk ErroP ErroQ\n');
disp(balapot);
toc %para de contar o tempo 
clear;
end