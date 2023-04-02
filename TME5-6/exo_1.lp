%----------Exercice 1----------%

conges.
temps_libre :- conges.
sortie_cine :- temps_libre, conges.

% {conges, temps_libre, sortie_cine : satisfiable}

p :- not q.
q :- not r.

% {q}: satisfiable

p :- not q.
q :- not p.
r :- p.
r :- q.

% {p,r},{q,r} : satisfiable

p :- not q.
q :- not p.
r :- not r.
r :- p.

% {p,r}: satisfiable
