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

% add src folder to path
close all, if ~strcmp( getenv('TESTS_RUN'), 'yes'), clear all, end
addpath( [ pwd '/../src'] );
problem_name = 'example_3'

% section properties: vector with the cross-section areas
As = 2e-4 ;

% material properties: vector with young moduli values
Es = [ 200e9 ] ;

NodsCoord = [ 0            1 ;
              1/sqrt(3)    0 ;
              1/sqrt(3)+1  1 ;
              1            0 ] ;

% inode jnode material section
ElemConec = [ 1 2 1 1 ;
              1 4 1 1 ; ...
              2 3 1 1 ; ...
              2 4 1 1 ; ...
              4 3 1 1 ] ;

fixeddofs = [ 1 2 5 6 ] ;

NodalLoads = [ 2 0 -10e3 ; ...
               4 0 -10e3 ];

# Deformed scale factor
scalefactor = 1e3;

# row vector with the dofs related to supports which are replaced by virtual forces
virtualforcessupports = [ ] ;

# row vector with the truss elements which are replaced by virtual forces
virtualforceselements = [ 4 ] ;

# degree of freedom whose displacement must be determined (leave empty if none)
unkndispdof = 4 ;
% -----------------------------


Preprocess

%% 3- Process
% Equilibrium equations solved, flexibility matrix assembly and
% virtual forces determined.
Process

%% 4- Output
% Plot of truss structure with reactions, normal forces and external loads.
Plots
