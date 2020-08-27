function [busdata]=utilsGetResults(busdata,DTHDV,maskDP,maskDQ)

busdata(maskDP,4)=DTHDV(1:sum(maskDP),1);
busdata(maskDQ,3)=DTHDV(sum(maskDP)+1:sum(maskDP)+sum(maskDQ),1);

end