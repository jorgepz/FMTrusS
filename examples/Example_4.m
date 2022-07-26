% Copyright 2022, Jorge M. Perez Zerpa. 
%
% This file is part of FMTS.
%
% FMTS is free software: you can redistribute it and/or modify 
% it under the terms of the GNU General Public License as published by 
% the Free Software Foundation, either version 3 of the License, or 
% (at your option) any later version. 
%
% FMTS is distributed in the hope that it will be useful, 
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with FMTS.  If not, see <https://www.gnu.org/licenses/>.

% Strength of Materials february 2021 exam. Exam available at https://eva.fing.edu.uy/pluginfile.php/8823/mod_folder/content/0/examen_2021_02_22_letra_y_solucion.pdf?forcedownload=1 for Universidad de la Republica students

clear all, close all, addpath( [ pwd '/../src'] );

l=5 ;

problem_name = 'exam_feb2021_SM2'

% section properties: vector with the cross-section areas
As = [  pi*( (0.04)^2 - ( .04- 2*0.004)^2)/4  ]' ;

% material properties: vector with young moduli values
Es = [ 210e9 ] ;

% nodal coordinates
NodsCoord = [ 0    l  ;
              l    l  ;
              2*l  l  ;
              3*l  l  ;
              l    0  ;
              2*l  0  ] ;

% inode jnode material section
ElemConec = [ 1 2  1 1 ;
              2 3  1 1 ; ...
              3 4  1 1 ; ...
              1 5  1 1 ; ...
              5 6  1 1 ; ...
              6 4  1 1 ; ...
              5 2  1 1 ; ...
              6 3  1 1 ; ...
              2 6  1 1 ; ...
              5 3  1 1 ] ;

fixeddofs = [ 1  10  11 12 ] ;

NodalLoads = [ 4 0 -50e3 ];

# row vector with the dofs related to supports which are replaced by virtual forces
virtualforcessupports = [ 1 ] ;

# row vector with the truss elements which are replaced by virtual forces
virtualforceselements = [ 9 ] ; 

# degree of freedom whose displacement must be determined (leave empty if none)
unkndispdof = 7 ;
% -----------------------------

Preprocess

%% 3- Process
Process

%% 4- Output
Plots

Ns_sol = zeros( 10,3) ;
Ns_sol( [ 3 5 6 8   10 ], 1 ) = [ 50e3; -50e3; -50e3*sqrt(2); -50e3; 50e3*sqrt(2) ] ;
Ns_sol( [ 1 2 5 8   10 ], 2 ) = [ -1; -1; -1; -1; 1*sqrt(2) ] ;
Ns_sol( [ 2 5 7 8 9 10 ], 3 ) = [ -1/sqrt(2); -1/sqrt(2); -1/sqrt(2); -1/sqrt(2); 1; 1 ] ;

disp_sol = 0.006072 ;

verif_boolean = ( norm( Ns - Ns_sol ) < 1e-6 ) && ( abs( disp - disp_sol ) < ( 1e-2*disp_sol ) )

% scalefactor = 10;
% FEMTrusS


