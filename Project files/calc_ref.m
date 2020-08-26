function [busdata] = calc_ref(busdata,G,B,NB,maskDP,maskDQ)

Pk = zeros(NB,1);
Qk = zeros(NB,1);


for k = 1:NB
    for m = 1:NB
        Pk(k,1) = Pk(k,1) + busdata(k,3)*busdata(m,3)*((G(k,m)*cos(busdata(k,4)-busdata(m,4)))+ (B(k,m)*sin(busdata(k,4)-busdata(m,4))));
        Qk(k,1) = Qk(k,1) + busdata(k,3)*busdata(m,3)*((G(k,m)*sin(busdata(k,4)-busdata(m,4)))-(B(k,m)*cos(busdata(k,4)-busdata(m,4))));
    end
end
%
%maskLMinV = busdata(:,9)~=0;
%maskLMaxV = busdata(:,10)~=0;

%submaskULMax = Qk(maskLMaxV&maskDP&~maskDQ)>busdata(maskLMaxV&maskDP&~maskDQ,10);
%submaskULMin = Qk(maskLMinV&maskDP&~maskDQ)<busdata(maskLMinV&maskDP&~maskDQ,9);

%flag = boolean(sum(submaskULMax)+sum(submaskULMin));

%busdata((Qk > busdata(:,10)) & (maskDP & ~maskDQ),2) = 0;
%busdata((Qk < busdata(:,9)) & (maskDP & ~maskDQ),2) = 0;



maskPk = Pk > 0; %%bug aqui
maskQk = Qk > 0;
%Possível solução
%(Qk > busdata(:,10)) & (maskDP & ~maskDQ)
%(Qk < busdata(:,9)) & (maskDP & ~maskDQ)

busdata((~maskDP)&maskPk,7) = Pk((~maskDP)&maskPk);
busdata((~maskDP)&~maskPk,5) = -Pk((~maskDP)&~maskPk);

busdata((~maskDQ)&maskQk,8) = Qk((~maskDQ)&maskQk);
busdata((~maskDQ)&~maskQk,6) = -Qk((~maskDQ)&~maskQk);

end