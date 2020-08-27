function [DTHDV] = utilsGetMatrixDTHDV(busdata,maskDP,maskDQ,NB)

DTHDV=zeros(2*NB,1);
submask = [maskDP;maskDQ];

DTHDV(1:NB,1) = busdata(1:NB,4);
DTHDV(NB+1:2*NB,1) = busdata(1:NB,3);

DTHDV = DTHDV(submask,1);

end