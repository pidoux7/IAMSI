% -------------- EXERCICE 2 - Problème des 8 reines -------------- %


% Nombre de reines, taille de l'échiuier
#const n = 8.

% Création de l'échiuier de taille (n,n)
reines(1..n).

% Toutes les configurations possibles
1 { p(X, R) : reines(X) } 1 :- reines(R).

% Contrainte 1: deux reines ne peuvent se trouver sur la mˆeme ligne de l’ ́echiquier
:- p(R, R1), p(R, R2), R1 != R2, reines(R) , reines(R1) , reines(R2).

% Contrainte 2: contrainte qui interdit `a deux reines de se trouver sur la mˆeme colonne de l’echiquier.
:- p(R, R1), p(RR, R1), R != RR, reines(R) , reines(RR) , reines(R1).

% Contrainte 3: ontrainte correspondant aux prises en diagonale
:- p(R, R1), p(RR, R2), R1 < R2, |R-RR| == R2-R1, reines(R), reines(R1), reines(RR), reines(R2).


%Cas 1: case (1,1) ,déanoter le % avant de lancer

p(1, 1).

% 4 solutions
% Answer: 1
% p(1,1) reines(1) reines(2) reines(3) reines(4) reines(5) reines(6) reines(7) reines(8) p(2,7) p(3,5) p(4,8) p(5,2) p(6,4) p(7,6) p(8,3)
% Answer: 2
% p(1,1) reines(1) reines(2) reines(3) reines(4) reines(5) reines(6) reines(7) reines(8) p(2,6) p(3,8) p(4,3) p(5,7) p(6,4) p(7,2) p(8,5)
% Answer: 3
% p(1,1) reines(1) reines(2) reines(3) reines(4) reines(5) reines(6) reines(7) reines(8) p(2,5) p(3,8) p(4,6) p(5,3) p(6,7) p(7,2) p(8,4)
% Answer: 4
% p(1,1) reines(1) reines(2) reines(3) reines(4) reines(5) reines(6) reines(7) reines(8) p(2,7) p(3,4) p(4,6) p(5,8) p(6,2) p(7,5) p(8,3)


%Cas 2: pas case (4,4) , déanoter le % avant de lancer

% :- p(4, 4).

% 84 solutions
% exemple
% reines(1) reines(2) reines(3) reines(4) reines(5) reines(6) reines(7) reines(8) p(1,4) p(2,6) p(3,1) p(4,5) p(5,2) p(6,8) p(7,3) p(8,7)
