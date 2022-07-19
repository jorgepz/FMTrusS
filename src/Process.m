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


# force states independent terms
ForceIndepTerm      = zeros( 2*nnodes,1+hiperdegree);
ForceIndepTerm(:,1) = - Fext  ;


Meqred = Meq;

virtualforces

for j=1:hiperdegree
  ForceIndepTerm(:,1+j) = -Meq(:,virtualforces(j)) ;
  Meqred(:,virtualforces(j) ) = [] ;
end

ForceIndepTerm
x = Meqred \ ForceIndepTerm

stop
supportreactions = zeros(nfixeddofs, hiperdegree+1) ;

supportreactions( isostaticsupports , : ) = x( 1:length(isostaticsupports) ,:)
if length(virtualforcessupports)>0
  aux = find( fixeddofs == virtualforcessupports) ;
  for j=1:hiperdegree
    supportreactions( aux(j),1+j ) = 1 ;
  end
end

fprintf('The support reactions in the real and virtual states are:\n');
supportreactions

Ns = zeros(nelems,hiperdegree+1) ;

%~ Ns(  isostaticforceselem-length(isostaticsupports) , : ) = x( isostaticforceselem, : ) ;
Ns(  isostaticforceselem- nfixeddofs , : ) = x( (length(isostaticsupports)+1):end, : ) ;
if length( virtualforceselements ) > 0
  for i=1:length(virtualforceselements)
    Ns(virtualforceselements,i+1) = 1 ;
  end
end

fprintf('The normal forces of the bars in the real and virtual states are:\n');
Ns

Kf = zeros( hiperdegree, hiperdegree) ;
Ff = zeros( hiperdegree,           1) ;

hiperdegree
for i=1:hiperdegree
  for j = 1:hiperdegree
    Kf(i,j) = sum( Ns(:,1+i).*Ns(:,1+j) ./ ( Youngs .* Areas ) .* Lengths ) ;
  end
  %
  Ff(i) = - sum( Ns(:,1) .* Ns(:,1+i) ./ ( Youngs .* Areas ) .* Lengths ) ;
end

Kf
Ff

X = Kf \ Ff


ResultReactions = supportreactions * [ 1; X]
ResultNormalForces = Ns * [ 1 ; X ]

Rext = zeros( 2*nnodes,1) ;
Rext(fixeddofs) = ResultReactions ;


Fextaux = zeros(2*nnodes,1);
Fextaux(unkndispdof) = 1 ;
xaux = Meqred \ - Fextaux ;
Nsaux = zeros( nelems ,1) ;
Nsaux( isostaticforceselem- nfixeddofs ) = xaux ( (length(isostaticsupports)+1):end )

disp = sum( ResultNormalForces .* Nsaux ./ ( Youngs .* Areas ) .* Lengths )
