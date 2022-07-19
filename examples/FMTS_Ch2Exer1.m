
% Example from chapter 2 of textbook https://gitlab.fing.edu.uy/jorgepz/libroResMat2/

% add src folder to path
clear all, close all, addpath( [ pwd '/../src'] );

% section properties: vector with the cross-section areas
De = .1 ; Di = De - .005 ; 
As = pi * ( De^2 - Di^2 ) / 4.0 ;

% material properties: vector with young moduli values
Es = [ 210e9 ] ;

% coordinates (with origin in node B)
NodsCoord = [  0 4 ;
               0 0 ;
               4 0 ] ;

% connectiviy: i-node j-node material section
ElemConec = [ 1 2 1 1 ;
              2 3 1 1 ; ...
              1 3 1 1 ] ;

fixeddofs = [ 3 4 5 6 ] ;

% matrix with nodal info per row:
%             node fx fy
NodalLoads = [ 1 50e3 0 ];

# Deformed scale factor
scalefactor = 1e3;

# row vector with the dofs related to supports which are replaced by virtual forces
virtualforcessupports = [ 4 ] ;

# row vector with the truss elements which are replaced by virtual forces
virtualforceselements = [  ] ;

# degree of freedom whose displacement must be determined (leave empty if none)
unkndispdof = 1 ;
% -----------------------------


Preprocess

%% 3- Process
% Equilibrium equations solved, flexibility matrix assembly and
% virtual forces determined.
Process

%% 4- Output
% Plot of truss structure with reactions, normal forces and external loads.
Plots
