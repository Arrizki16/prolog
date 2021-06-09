
% FACTS

male(jidan).
male(dani).
male(adit).
male(juni).
male(akbar).
male(riski).
male(jono).

female(bunga).
female(dwi).
female(astuti).
female(siti).
female(jia).
female(sri).

parent(dani,jidan).
parent(jia,jidan).
parent(juni,dani).
parent(dwi,dani).
parent(juni,bunga).
parent(dwi,bunga).
parent(juni,adit).
parent(dwi,adit).
parent(akbar,sri).
parent(astuti,sri).
parent(jono,riski).
parent(siti,riski).
parent(jono,juni).
parent(siti,juni).
parent(jono,astuti).
parent(siti,astuti).

wife(astuti,akbar).
wife(jia,dani).
wife(dwi,juni).
wife(siti,jono).

husband(dani,jia).
husband(juni,dwi).
husband(akbar,astuti).
husband(jono,siti).


% RULES
father(X,Y) :- 
    male(X),
    parent(X,Y).

mother(X,Y) :- 
    female(X),
    parent(X,Y).

grandfather(X,Y) :- 
    male(X),
    parent(X,Z),
    parent(Z,Y).

grandmother(X,Y) :-
    female(X),
    parent(X,Z),
    parent(Z,Y).

greatgrandfather(X,Y) :-
    male(X),
    parent(X,A),
    parent(A,B),
    parent(B,Y).

greatgrandmother(X,Y) :-
    female(X),
    parent(X,A),
    parent(A,B),
    parent(B,Y).

brother(X,Y) :-
    male(X),
    parent(Z,X),
    parent(Z,Y),
    X\==Y.

sister(X,Y) :-
    female(X),
    parent(Z,X),
    parent(Z,Y),
    X\==Y.

brother_of_grandparent(X,Y) :-
    male(X),
    parent(A,Y),
    parent(B,A),
    brother(X,B).

sister_of_grandparent(X,Y) :-
    female(X),
    parent(A,Y),
    parent(B,A),
    sister(X,B).

brother_in_law(X,Y) :-
    male(X),
    sister(Z,Y),
    husband(X,Z),
    parent(A,Z),
    parent(A,Y),
    Z\==Y.

sister_in_law(X,Y) :-
    female(X),
    brother(Z,Y),
    wife(X,Z),
    father(A,Z),
    father(A,Y),
    Z\==Y.

cousin(X,Y) :-
    parent(Z,Y),
    ( brother(W,Z) ; sister(W,Z) ),
    parent(W,X).

uncle(X,Y) :-
    male(X),
    ( father(Z,Y) ; mother(Z,Y) ),
    ( brother(X,Z) ; cousin(X,Z) ; brother_in_law(X,Z) ).

aunt(X,Y) :-
    female(X),
    ( father(Z,Y) ; mother(Z,Y) ),
    ( sister(X,Z) ; cousin(X,Z) ; sister_in_law(X,Z) ).

siblings(X,Y) :-
    father(Z,X),
    father(Z,Y),
    X@<Y.