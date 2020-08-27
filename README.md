<!DOCTYPE html>
<html>
<head>
</head>
  <body>
    <h1><?php $x = 1;
    echo "Testing php" .$x. "/n";
?></h1>
    <h1>Instructions to use</h1>
    <p> To use this program, run the GUINEWTON file, and will pop up an interface to load the data file and select the method to evaluate the power flow.</p>
        <h2>Input type: </h2>
    <p>Open the dadossis.m for more details</p>
    <p>The input must have this format<p>
    <pre>
    basemva=100;

% ********************************************************************** %
%                             Dados do Sistema
% ********************************************************************** %

%%% Dados de barra do sistema (PQ = 0,swing = 2, PV = 1)
%%%
%        Barra Barra  Tensão  Ângulo   ---Carga----    -------Geração----     Inj.CAP
%        No    Tipo    Mag.    Graus    MW    Mvar      MW  Mvar  Qmin Qmax    Mvar
busdata=
%        [1       2     1.0     0.0     500    200       0.0  0.0   -300 400      0   
%         2       1     1.0     0.0     0.0    0.0     500.0  0.0   -200 300      0   
%         3       0     1.0     0.0     0.0    0.0       0.0  0.0     0   0       0    
%         4       0     1.0     0.0     0.0    0.0       0.0  0.0     0   0       0    
%         5       0     1.0     0.0     800    300       0.0  0.0     0   0     22.72  
%         ];
        

% ********************************************************************** %
%                             Dados de linha
% ********************************************************************** %
%         Barra  Barra    R      X     1/2 B   
%         De     Para    p.u.   p.u.   p.u.   tap   tmin tmax
linedata=
%         [ 1      3      0.0    0.02   0.0     1     0.9  1.1
%           3      4      0.0    0.04   0.0     1     0.0  0.0
%           3      5      0.0    0.04   0.0     1     0.0  0.0
%           4      5      0.0    0.04   0.0     1     0.0  0.0
%           4      2      0.0    0.02   0.0     1     0.9  1.1
%          ];
          </pre>
    <h1> How to contribute to this project: </h1>
    <p> I need help to organize the archives with a better software architeture, to translate the project to english and display the results in a file in PDF. </p>
    
   <h1> Known bugs:</h1>
    
   <ul>
    <li>  In a few cases principally with 5x5 system that doesn't have a PQ bar the program can't evaluate the power flow. </li>
    <li> The program can't generate a new PDF file with the newest results. </li>
    </ul>
   
    
    
  </body>
  </html>
  
