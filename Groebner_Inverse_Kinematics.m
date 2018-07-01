%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- name --
%   "Groebner_Inverse_Kinematics"
%       created by Yoshi de Laat (01/07/18)    
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- description -- 
%   Generates the inverse kinematic relations for a
%   3-DOF soft robot manipulator
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- instructions -- 
%   To be able to run this script the functions from the matlab file 
%   exchange for groebner basis from Ben Petschel must be downloaded from: 
%   https://nl.mathworks.com/matlabcentral/fileexchange/24478-groebner
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all

% Let a = cos(l*k) b = sin(l*k) c = cos(phi) d = sin(phi) to create a
% polynomal, which can be solved with the groebner basis.

f1 = 'k*x-c+a*c';                                   % x = 1/k * (1-a)c
f2 = 'k*y-d+a*d';                                   % y = 1/k * (1-a)c
f3 = 'k*z-b';                                       % z = 1/k * b

% Two extra equations to account for the two extra variables.

f4 = 'a^2+b^2-1';                                   % cos(lk)^2  + sin(lk)^2  = 1
f5 = 'c^2+d^2-1';                                   % cos(phi)^2 + sin(phi)^2 = 1

% Creat the groebner basis for the equation stated above.
equ = {'k*x-c+a*c','k*y-d+a*d','k*z-b','a^2+b^2-1','c^2+d^2-1'};
order = {'a','b','c','d','k','x','y','z'};

gi = groebner(equ,'lex',order);

% Isolating the important equations  from the groebner basis (the index
% number are only correct for this specific case) and substitute the
% original expressions for a, b, c and d back.
syms a b c d k x y z l phi

g1 = subs(str2sym(gi{1}),[a b c d],[cos(l*k) sin(l*k) cos(phi) sin(phi)]);
g4 = subs(str2sym(gi{4}),[a b c d],[cos(l*k) sin(l*k) cos(phi) sin(phi)]);
g9 = subs(str2sym(gi{9}),[a b c d],[cos(l*k) sin(l*k) cos(phi) sin(phi)]);

% Isolate generilized coordinates.
g4 = simplify(simplify(g4/k)==0);
l = isolate(g1 == 0, l);
k = isolate(g9/k == 0, k);

disp(k)
disp(l)
disp(g4)


