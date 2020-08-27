function [DP, DQ] = mathCalculatesMatrixDQandDQ(busdata,maskDP,maskDQ,NB,G,B)
    
Pkesp = busdata(:,7)-busdata(:,5);   %Pgerado - Pdemandado       
Qkesp = busdata(:,8)-busdata(:,6);    %Qgerado - Qdemandado

Pk = zeros(NB,1);
Qk = zeros(NB,1);

for k = 1:NB
    for m = 1:NB
        Pk(k,1) = Pk(k,1) + busdata(k,3)*busdata(m,3)*((G(k,m)*cos(busdata(k,4)-busdata(m,4)))+ (B(k,m)*sin(busdata(k,4)-busdata(m,4))));
        Qk(k,1) = Qk(k,1) + busdata(k,3)*busdata(m,3)*((G(k,m)*sin(busdata(k,4)-busdata(m,4)))-(B(k,m)*cos(busdata(k,4)-busdata(m,4))));
    end
end
    DP = Pkesp-Pk; %Calcula DELTAP
    DQ = Qkesp-Qk; %Calcula DELTAQ
    DP = DP(maskDP,1);
    DQ = DQ(maskDQ,1);
end