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


% --- compute lengths and inclination of undeformed elements ---
Lengths   =  sqrt ( sum( (  NodsCoord( ElemConec(:,2),:) - ...
                            NodsCoord( ElemConec(:,1),:) ).^2 , 2 ) )

Angles = atan2( ( NodsCoord( ElemConec(:,2),2) - NodsCoord( ElemConec(:,1),2) ) , ...
                ( NodsCoord( ElemConec(:,2),1) - NodsCoord( ElemConec(:,1),1) ) ) 

Areas   = As( ElemConec(:,4) ) ;
Youngs  = Es( ElemConec(:,3) ) ;

nnodes = size( NodsCoord,1);
nelems = size( ElemConec,1);

nfixeddofs = length(fixeddofs) ;

# computes the total number of force unknowns (element stress and reactions)
nforceunknowns = nfixeddofs + nelems ;
hiperdegree = nforceunknowns - 2*nnodes ;


% compute free dofs
freedofs = 1:(2*nnodes) ; freedofs(fixeddofs) = [] ;

# row vector with the indexes of the dofs of the supports left in the isostatic structure
isostaticsupports = 1:nfixeddofs ;
if length(virtualforcessupports)>0
  # deletes the entries corresponding to the supports which are replaced by virtual forces
  isostaticsupports( find( fixeddofs == virtualforcessupports) ) = [] ;
end

# assembles the vector of virtual force states, first the fixed dofs and after the truss elements normal forces.
if length( virtualforcessupports ) > 0
  virtualforces  = [ find( fixeddofs == virtualforcessupports) ...
  virtualforceselements+nfixeddofs ] ;
else
  virtualforces  = [ virtualforceselements+nfixeddofs ] ;
end

isostaticforceselem = (1:nelems) ;
isostaticforceselem( virtualforceselements ) = [] ;
isostaticforceselem = isostaticforceselem + nfixeddofs ;

# row vector with the dofs and elements present in the isostatic structure
isostaticforces = [ isostaticsupports isostaticforceselem ] ;



# Equilibrium matrix assembly
# each row contains the coefficients of each equilibrium equation for the nodes
# each column contains the coefficients corresponding to an unknown reaction
#   or normal force
Meq = zeros( 2*nnodes , nforceunknowns ) ;
for i=1:nfixeddofs
  Meq(fixeddofs(i),i) = 1.0 ;
end

# stress
for i=1:nelems

  ang = Angles(i);

  elemdofs = nodes2dofs ( ElemConec(i,1:2)' ,2) ;

  ca = cos(ang); sa = sin(ang);
  auxproj = [ -ca; -sa; ca; sa] ;

  Meq( elemdofs , i+nfixeddofs ) = Meq( elemdofs , i+nfixeddofs ) - auxproj ;
end

# assemble the external nodal loads vector
Fext = zeros(2*nnodes,1);
for i=1:size(NodalLoads,1)
  aux = nodes2dofs ( NodalLoads(i,1), 2 ) ;
  Fext( aux ) = Fext( aux ) + NodalLoads(i,2:3)' ;
end
