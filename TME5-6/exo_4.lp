% ------------- EXERCICE 4 -------------- %

% Définition du nombre de couleurs
#const n = 4.

% Création des noeuds du graphes et des couleurs
noeud(1..7).
couleur(1..n).

% Définition des arêtes du graphe

arete(1,2).
arete(1,3).
arete(2,3).
arete(2,4).
arete(2,5).
arete(2,6).
arete(3,4).
arete(3,5).
arete(3,7).
arete(4,5).
arete(4,6).
arete(4,7).
arete(5,7).
arete(6,7).

% bilatéralité des arcs
arete(X,Y) :- arete(Y,X).

% une seule couleur par noeud
1 { coloration(X,Y) : couleur(Y) } 1 :- noeud(X).

% Deux noeuds adjacents ne peuvent avoir la même couleur
:- coloration(X,Y), coloration(X1,Y), arete(X,X1), noeud(X), noeud(X1), couleur(Y).


%Résultats 

%arete(1,2) arete(1,3) arete(2,3) arete(2,4) arete(2,5) arete(2,6) arete(3,4) arete(3,5) %arete(3,7) arete(4,5) arete(4,6) arete(4,7) arete(5,7) arete(6,7) noeud(1) noeud(2) noeud(3) %noeud(4) noeud(5) noeud(6) noeud(7) couleur(1) couleur(2) couleur(3) couleur(4) arete(2,1) %arete(3,1) arete(3,2) arete(4,2) arete(5,2) arete(6,2) arete(4,3) arete(5,3) arete(7,3) %arete(5,4) arete(6,4) arete(7,4) arete(7,5) arete(7,6) coloration(3,1) coloration(6,1) %coloration(1,2) coloration(5,2) coloration(2,3) coloration(7,3) coloration(4,4)
%SATISFIABLE

