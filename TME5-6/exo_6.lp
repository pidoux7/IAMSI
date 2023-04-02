% ----------- EXERCICE 6 - Organisation de championnat ----------- %

% Nombre d'équipes participantes
#const ne = 3.

% Nombre de semaines (durée du championnat)
#const ns = 3.

% Nombre de jours de matchs (2 matchs par semaine)
#const nj = 2 * ns.

% Génération des équipes, semaines et jours de matchs
equipe(1..ne).
semaine(1..ns).
jour(mercredi;dimanche).

#show match/4.

% tous les matchs
1 { match(X, Y, S, J) : semaine(S), jour(J) } 1 :- equipe(X), equipe(Y), X != Y.

% pas plus d'un match par jour par equipe
:- match(X, Y, S, J), match(X, YY, S, J), equipe(X;Y;YY), semaine(S), jour(J), Y!=YY.
:- match(X, Y, S, J), match(YY, X, S, J), equipe(X;Y;YY), semaine(S), jour(J).
:- match(Y, X, S, J), match(YY, X, S, J), equipe(X;Y;YY), semaine(S), jour(J), Y!=YY.

% Deux matchs par jour max
:- match(X, Y, S, J), match(X1, YY, S, J), match(X2, YYY, S, J), X<X1, X1<X2, semaine(S), jour(J).


% Résultats :  exemple
% Answer: 1
% match(3,1,1,mercredi) match(1,2,2,mercredi) match(1,3,3,mercredi) match(2,1,2,dimanche) match(2,3,3,dimanche) match(3,2,1,dimanche)
%SATISFIABLE
