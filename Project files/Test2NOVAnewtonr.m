function [busdata,int]=Test2NOVAnewtonr(busdata,linedata,basemva,erro,maskDP,maskDQ,NB,G,B)




flag = 0;
int = 1; % contador do números de interações
while flag == 0
    

    [DP, DQ] = NOVAcalculadpdq(busdata,maskDP,maskDQ,NB,G,B);
    
    [flag]=NOVAcalculaflag(DQ,DP,erro,busdata);
   
    if(flag == 1)
        break;
    end
    
    [J] = NovaJacobiana(busdata,G,B,NB,maskDP,maskDQ);
    
    [DTHDV] = NOVAmoveDTHDV(busdata,maskDP,maskDQ,NB);
    
    DPDQ = [DP;DQ];
    
    DTHDV = DTHDV + inv(J)*DPDQ;
    
    [busdata]=NOVAatualizaBUSDATA(busdata,DTHDV,maskDP,maskDQ);
    
   int = int + 1;
   
    
end
end
