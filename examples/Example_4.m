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

% ejercicio examen febrero 2021

clear all, close all

l=5 ;

problem_name = 'exam_fev2021_SM2'

% section properties: vector with the cross-section areas
As = [ ( pi*.04^2/4  pi*(0.04 - 2*0.004)^2/4)  ]' ;

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

