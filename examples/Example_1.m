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

% Example from chapter 2 of textbook https://gitlab.fing.edu.uy/jorgepz/libroResMat2/

% add src folder to path
clear all, close all, addpath( [ pwd '/../src'] );

problem_name = 'Example_1'

% section properties: vector with the cross-section areas
As = [.001 .01 ]' ;

% material properties: vector with young moduli values
Es = [ 210e9 ] ;

% coordinates (with origin in node B)
NodsCoord = [  0  0  ;
               10 10 ;
               10 0  ;
               20 0  ] ;

% connectiviy: i-node j-node material section
ElemConec = [ 1 2 1 1 ;
              3 2 1 2 ; ...
              4 2 1 1 ] ;

fixeddofs = [ 1 2 5 6 7 8 ] ;

% matrix with nodal info per row:
%             node fx fy
NodalLoads = [ 2 10e3 0 ];

# row vector with the dofs related to supports which are replaced by virtual forces
virtualforcessupports = [  ] ;

# row vector with the truss elements which are replaced by virtual forces
virtualforceselements = [ 3 ] ;

# degree of freedom whose displacement must be determined (leave empty if none)
unkndispdof = 3 ;
% -----------------------------


Preprocess

%% 3- Process
% Equilibrium equations solved, flexibility matrix assembly and
% virtual forces determined.
Process

%% 4- Output
% Plot of truss structure with reactions, normal forces and external loads.
Plots

% solution by hand with rounding errors as in the book
X_sol = -7071 ;      
disp_sol = 6.74e-4 ;

verif_boolean = ( abs( X - X_sol ) < abs(1e-3*X_sol) ) && ( abs( disp - disp_sol) < abs(1e-3*disp_sol)  )