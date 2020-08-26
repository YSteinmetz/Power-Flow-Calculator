function NOVAguiabrenewton(busdata,linedata,basemva,var)
clc;
tic % começa a contar o tempo


erro = 0.03;
maskDP = busdata(:,2) ~= 2;
maskDQ = busdata(:,2) == 0;

NB = size(busdata);
NB = NB(1,1);

[G,B] = calculaGeB(linedata,NB);
busdata(:,5:end) = busdata(:,5:end)/basemva;

flag = 1;

while(flag == 1)

[busdata,int] = Test2NOVAnewtonr(busdata,linedata,basemva,erro,maskDP,maskDQ,NB,G,B);
[busdata] = calc_ref(busdata,G,B,NB,maskDP,maskDQ);
flag = 0;

end


busdata(:,5:end) = busdata(:,5:end)*basemva;

fprintf('O total de interações é: %d \n\n',int);

fprintf('\n   Barra Nr     Barra Tipo      Tensão ....\n');

disp(busdata);


%fprintf('\n Pkm Qkm Pmk Qmk ErroP ErroQ\n');
%disp(balapot);

save('output','busdata');
%report(rgfiles.rpt)
%buildrgfiles
%open('resultados.pdf');


toc %para de contar o tempo 
clear;
end