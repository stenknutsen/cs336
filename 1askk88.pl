%!Sten Knutsen, Homework 1a  
%! ok here I am in the potato branch


%! RULE 1                              
biGender(X):-
        male(X),
        female(X).


%! RULE 2
grandMother(GM, GC):-
        female(GM),
        childOf(GC, Parent),
        childOf(Parent, GM).

%! RULE 3
person(P):- wifeOf(P,_).
person(P):- wifeOf(_,P).
person(P):- childOf(P,_).
person(P):- childOf(_,P).
person(P):- male(P).
person(P):- female(P).

%! helper predicate
greatGrandChild(GGC, GGP):-
        childOf(GGC, GC),
        childOf(GC, Parent),
        childOf(Parent, GGP).

%! helper predicate
grandChild(GC,GP):-
        childOf(GC,Parent),
        childOf(Parent,GP).

%! RULE 4
secondCousin(A,B):-
        greatGrandChild(A,GGP),
        greatGrandChild(B,GGP),
        grandChild(A,GP1),
	grandChild(B,GP2),
        GP1\=GP2.


%! helper predicate
sibling(A,B):-
        childOf(A,M),
        childOf(B,M),
        childOf(A,F),
        childOf(B,F),
        A\=B.

%! helper predicate
spouseOf(A,B):- wifeOf(A,B).
spouseOf(A,B):- wifeOf(B,A).

%! RULE 5
brotherInLaw(A,B):-
        male(A),
        sibling(B,Sib),
        spouseOf(Sib, A).

brotherInLaw(A,B):-
        male(A),
        spouseOf(A,Sib),
        sibling(Sib, Sib2),
        spouseOf(Sib2,B).

brotherInLaw(A,B):-
        male(A),
        sibling(A,Sib),
        spouseOf(Sib, B).

%! helper predicate
hasMaleChild(A,B):-
        childOf(Child,A),
        childOf(Child,B),
        A\=B,
        male(Child).

%! helper predicate
hasAtLeastOneChild(A,B):-
        childOf(Child,A),
        childOf(Child,B),
        A\=B.

%! RULE 6
allGirlCouple(A,B):-
        not(hasMaleChild(A,B)),
	spouseOf(A,B),
        hasAtLeastOneChild(A,B).

%! RULE 7 (errors)

%! biGender error
error1:-
    male(X),
    female(X).

%! child has only one parent error
error2:-
    childOf(Child,A),
    spouseOf(A,B),
    not(childOf(Child,B)).

%! both male marriage error
error3:-
    wifeOf(A,B),
    male(A),
    male(B).

%! both female marriage error
error4:-
	wifeOf(A,B),
	female(A),
	female(B).

%! polygynous marriage error
error5:-
    wifeOf(A,B),
    wifeOf(C,B),
    A\=C.


%! polyandrous marriage error
error6:-
    wifeOf(A,B),
    wifeOf(A,C),
    B\=C.

adding something at end
