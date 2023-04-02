% --------------- EXERCICE 5 ---------------- %

maison(1..5).
nationalite(britannique; suedois; danois; norvegien; allemand).
boisson(the; cafe; lait; biere; eau).
cigarette(pallmall; dunhill; blend; bluemaster; princess).
animal(chien; oiseaux; chat; chevaux; poissons).
couleur(rouge; vert; blanc; jaune; bleu).

% Contraintes 

% A chaque personne est associée une certaine boisson
1 { boit(X,Y) : boisson(Y) } 1 :- nationalite(X).
:- boit(X,Y), boit(X1, Y), X != X1, nationalite(X;X1), boisson(Y).

% A chaque personne est associée un certain animal
1 { possede(X,Y) : animal(Y) } 1 :- nationalite(X).
:- possede(X,Y), possede(X1,Y), X != X1, nationalite(X;X1), animal(Y).

% A chaque personne est associée une certaine marque de cigarette
1 { fume(X,Y) : cigarette(Y) } 1 :- nationalite(X).
:- fume(X,Y), fume(X1,Y), X != X1, nationalite(X;X1), cigarette(Y).

% Chaque maison est de couleur différente
1 { maison(X,Y) : couleur(Y) } 1 :- maison(X).
:- maison(X,Y), maison(X1,Y), X != X1, maison(X;X1), couleur(Y).

% Une personne habite dans une certaine maison
1 { habite(X,Y) : maison(Y) } 1 :- nationalite(X).
:- habite(X,Y), habite(X1,Y), X != X1, nationalite(X;X1), maison(Y).

% prop 1 - Le britannique vit dans la maison rouge
habite(britannique, X):- maison(X), maison(X, rouge).

% prop 2- Le suédois garde un chien
possede(suedois, chien).

% prop 3- Le danois boit du thé
boit(danois, the).

% prop 4- La maison verte est à gauche de la maison blanche
maison(X, vert):- maison(X1, blanc), maison(X;X1), X == X1 - 1.

% prop 5- Le propriétaire de la maison verte boit du café
boit(X, cafe):- nationalite(X), habite(X, Y), maison(Y), maison(Y, vert).

% prop 6- La personne qui fume des Pall Mall possède des oiseaux
possede(X, oiseaux) :- fume(X, pallmall), nationalite(X).

% prop 7- Le propriétaire de la maison jaune fume des Dunhill
fume(X, dunhill):- nationalite(X), habite(X, Y), maison(Y), maison(Y, jaune).

% prop 8- La personne qui vit dans la maison au centre boit du lait
boit(X, lait):- nationalite(X), habite(X, 3).

% prop 9- Le norvégien vit dans la première maison
habite(norvegien, 1).

% prop 10- La personne qui fume des Blend vit à côté de celle qui possède des chats
|Y1-Y2| == 1 :- fume(X1, blend), possede(X2, chat), nationalite(X1;X2), habite(X1, Y1), habite(X2, Y2), maison(Y1;Y2).

% prop 11- La personne qui possède des chevaux vit à côté du fumeur de Dunhill
|Y1-Y2| == 1 :- possede(X1, chevaux), fume(X2, dunhill), nationalite(X1;X2), habite(X1, Y1), habite(X2, Y2), maison(Y1;Y2).

% prop 12- La personne qui fume des Bluemaster boit de la bière
boit(X, biere):- fume(X, bluemaster), nationalite(X).

% prop 13- L'allemand fume des Princess
fume(allemand, princess).

% prop 14- Le norvégien vit à côté de la maison bleue
|Y1-Y2| == 1 :- habite(norvegien, Y1), maison(Y2, bleu), maison(Y1;Y2).

% prop 15- La personne qui fume des Blend a un voisin qui boit de l'eau
|Y1-Y2| == 1 :- fume(X1, blend), boit(X2, eau), nationalite(X1;X2), habite(X1, Y1), habite(X2, Y2), maison(Y1;Y2).

#show possede/2.


%RESULTAT

% Une seule combinaison possible
%Answer: 1
%possede(suedois,chien) possede(britannique,oiseaux) possede(norvegien,chat) possede(danois,chevaux) possede(allemand,poissons)
%SATISFIABLE
