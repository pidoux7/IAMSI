%---------------------------------Moteur Sudoku--------------------------------%


#const po = 8.
#const chif = 9.

#show case/3.

% Création d'un échiquier 8x8
pos(0..n).
chiffre(1..chif).

% Générer toutes les grilles possibles, et un seul chiffre sur chaque position
1{case(I, J, C) : chiffre(C)}1 :- pos(I), pos(J).

% Ajout des trois contraintes du sudoku

% Pas de chiffres identique sur une même ligne
:- case(I, J, C), case(I, J2, C), J!=J2.

% Pas de chiffres identique sur une même colonne
:- case(I, J, C), case(I2, J, C), I!=I2.

% Pas de chiffres identique dans la même région
:- case(I, J, C), case(I2, J2, C), R1=I/3, R2=I2/3, R3=J/3, R4=J2/3,
   R1==R2, R3==R4, I!=I2.
   
   
% donnée

case(0,1,7).
case(0,3,6).
case(0,5,3).
case(0,7,1).
case(0,8,4).

case(1,0,8).
case(1,4,9).

case(2,1,6).
case(2,2,3).
case(2,3,2).
case(2,4,1).
case(2,6,8).

case(3,4,3).
case(3,7,5).
case(3,8,9).

case(4,0,6).
case(4,3,9).
case(4,6,4).
case(4,8,1).

case(5,0,9).
case(5,1,2).
case(5,3,4).
case(5,5,1).
case(5,8,8).

case(6,1,5).
case(6,3,8).
case(6,8,3).

case(7,0,4).
case(7,2,1).
case(7,3,3).
case(7,4,6).
case(7,5,2).
case(7,6,7).
case(7,7,8).

case(8,0,3).
case(8,2,6).
case(8,3,1).
case(8,6,9).
case(8,8,2).


%Résultat

% Il y a une unique solution:
% Answer: 1
%case(0,1,7) case(0,3,6) case(0,5,3) case(0,7,1) case(0,8,4) case(1,0,8) case(1,4,9) case(2,1,6) %case(2,2,3) case(2,3,2) case(2,4,1) case(2,6,8) case(3,4,3) case(3,7,5) case(3,8,9) case(4,0,6) %case(4,3,9) case(4,6,4) case(4,8,1) case(5,0,9) case(5,1,2) case(5,3,4) case(5,5,1) case(5,8,8) %case(6,1,5) case(6,3,8) case(6,8,3) case(7,0,4) case(7,2,1) case(7,3,3) case(7,4,6) case(7,5,2) %case(7,6,7) case(7,7,8) case(8,0,3) case(8,2,6) case(8,3,1) case(8,6,9) case(8,8,2)
%SATISFIABLE

