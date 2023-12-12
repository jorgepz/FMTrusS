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

clear all, close all, addpath( [ pwd '/../src'] );

l=1 ;

problem_name = 'example_only_supports'

% section properties: vector with the cross-section areas
As = [  1 ]' ;

% material properties: vector with young moduli values
Es = [ 1 ] ;

% nodal coordinates
NodsCoord = [ 0 0 ;
              l 0 ;
              0 l ] ;

% inode jnode material section
ElemConec = [ 1 2  1 1 ;
              1 3  1 1 ; ...
              2 3  1 1 ] ;

fixeddofs = [ 1*2  2*2-1   2*2  3*2-1  ] ;

NodalLoads = [ 3 0 -1 ; 
               1 1 0 ];

# row vector with the dofs related to supports which are replaced by virtual forces
virtualforcessupports = [ 3*2-1 ] ;

# row vector with the truss elements which are replaced by virtual forces
virtualforceselements = [  ] ; 

# degree of freedom whose displacement must be determined (leave empty if none)
unkndispdof = [] ;
% -----------------------------

Preprocess

%% 3- Process
Process

%% 4- Output
Plots
