ligacao(araripina, ouricuri, br316, 60) .
ligacao(ouricuri, salgueiro, br316, 114) .
ligacao(salgueiro, serratalhada, br232, 100) .
ligacao(serratalhada, custodia, br232, 77) .
ligacao(custodia, arcoverde, br232, 80) .
ligacao(riodejaneiro, riobonito, br101, 100) .
ligacao(riobonito, cabofrio, br101, 120) .
ligacao(cabofrio, buzios, br101, 40) .
retornar(CO,CD,V,D) :- ligacao(CD,CO,V,D).

% 1 - a
conectadas(C1,C2) :- ligacao(C1, C2, _, _) .
conectadas(C1,C2) :- ligacao(C1, C_T, _, _),  conectadas(C_T, C2).
conectadas(C1,C2) :- ligacao(C2, C1, _, _) .
conectadas(C1,C2) :- ligacao(C2, C_T, _, _),  conectadas(C_T, C1).

% 2 - b
distancia(C1, C2, D) :- ligacao(C1, C2, _, D).
distancia(C1, C2, D) :- ligacao(C1, C, _, D1),
                        distancia(C, C2, D2),
                        D is D1 + D2.
distancia(C1, C2, D) :- ligacao(C2, C1, _, D).
distancia(C1, C2, D) :- ligacao(C2, C, _, D1),
                        distancia(C, C1, D2),
                        D is D1 + D2.


% 2 - c
caminho(CO, CD, Caminho) :-
    caminho2(CO, CD, [CO], CaminhoInverso),
    reverse(CaminhoInverso, Caminho).

caminho2(CD, CD, Caminho, Caminho).
caminho2(CT, CD, CaminhoPercorrido, Caminho) :-
    ligacao(CT, ProximaCidade, _, _),
    \+ member(ProximaCidade, CaminhoPercorrido),
    caminho2(ProximaCidade, CD, [ProximaCidade|CaminhoPercorrido], Caminho).
caminho2(CidadeAtual, CidadeDestino, CaminhoPercorrido, Caminho) :-
    retornar(CidadeAtual, ProximaCidade, _, _),
    \+ member(ProximaCidade, CaminhoPercorrido),
    caminho2(ProximaCidade, CidadeDestino, [ProximaCidade|CaminhoPercorrido], Caminho).
