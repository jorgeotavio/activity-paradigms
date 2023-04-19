ligacao(araripina, ouricuri, br316, 60) .
ligacao(ouricuri, salgueiro, br316, 114) .
ligacao(salgueiro, serratalhada, br232, 100) .
ligacao(serratalhada, custodia, br232, 77) .
ligacao(custodia, arcoverde, br232, 80) .
ligacao(riodejaneiro, riobonito, br101, 100) .
ligacao(riobonito, cabofrio, br101, 120) .
ligacao(cabofrio, buzios, br101, 40) .

% 1 - a
conectadas(C1,C2) :- ligacao(C1, C2, _, _) .
conectadas(C1,C2) :- ligacao(C1, C3, _, _),  conectadas(C3, C2).

% 2 - b
distancia(C1, C2, D) :- ligacao(C1, C2, _, D).
distancia(C1, C2, D) :- ligacao(C1, C3, _, D1),
                        distancia(C3, C2, D2),
                        D is D1 + D2.

% 2 - c
caminho(C1, C2, W) :-
    caminho(C1, C2, [C1], W).

caminho(C1, C2, Visitadas, [C1|Visitadas]) :-
    ligacao(C1, C2, _, _),
    write("Finalizando caminho em "),
    write(C2),
    nl.

caminho(C1, C2, Visitadas, W) :-
    ligacao(C1, Proxima, _, _),
    \+ member(Proxima, Visitadas),
    write("Indo de "),
    write(C1),
    write(" para "),
    write(Proxima),
    nl,
    caminho(Proxima, C2, [Proxima|Visitadas], W).
