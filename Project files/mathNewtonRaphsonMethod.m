function [busdata,int]=mathNewtonRaphsonMethod(busdata,linedata,basemva,erro,maskDP,maskDQ,NB,G,B)




flag = 0;
int = 1; % contador do números de interações
while flag == 0
    

    [DP, DQ] = mathCalculatesMatrixDQandDQ(busdata,maskDP,maskDQ,NB,G,B);
    
    [flag]= utilsCalculatesFlag(DQ,DP,erro,busdata);
   
    if(flag == 1)
        break;
    end
    
    [J] = mathCalculatesJacobian(busdata,G,B,NB,maskDP,maskDQ);
    
    [DTHDV] = utilsGetMatrixDTHDV(busdata,maskDP,maskDQ,NB);
    
    DPDQ = [DP;DQ];
    
    DTHDV = DTHDV + inv(J)*DPDQ;
    
    [busdata]=utilsGetResults(busdata,DTHDV,maskDP,maskDQ);
    
   int = int + 1;
   
    
end
end
