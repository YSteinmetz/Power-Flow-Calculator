function [RptgenML_CReport1] = buildrgfiles
%BUILDRGFILES
 
%  Auto-generated by MATLAB on 21-Feb-2020 12:30:10
 
% Create RptgenML.CReport
RptgenML_CReport1 = RptgenML.CReport('isAutoSaveOnGenerate',true,...
'Format','pdf-fop',...
'Stylesheet','!fo-NoOptions',...
'FilenameName','resultados',...
'FilenameType','other');
% setedit(RptgenML_CReport1);
 
% Create rptgen.cml_variable
rptgen_cml_variable1 = rptgen.cml_variable('Variable','busdata',...
'Filename','C:\Users\yuri_\Documents\MATLAB\Fluxo de carga\Fluxo de carga vers�o comercial betaV0.21\output.mat',...
'Source','M',...
'CustomTitle','resultados',...
'TitleMode','manual');
setParent(rptgen_cml_variable1,RptgenML_CReport1);
 