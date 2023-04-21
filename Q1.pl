ligacao(triunfo, santaCruz, pe, 15).
ligacao(santaCruz, serraTalhada, pe, 20).
ligacao(serraTalhada, belmonte, br, 65).
ligacao(belmonte, salgueiro, br,35).
ligacao(serraTalhada,floresta, pe, 100).
ligacao(floresta, petrolandia, pe, 65).
ligacao(petrolina,santaMaria,br,100).

volta(C_O,C_D,V,D) :- ligacao(C_D,C_O,V,D).

% 1 - a
conectada(C_O,C_D) :- ligacao(C_O, C_D, _, _) .
conectada(C_O,C_D) :- ligacao(C_O, C_T, _, _),  conectada(C_T, C_D).
conectada(C_O,C_D) :- ligacao(C_D, C_O, _, _) .
conectada(C_O,C_D) :- ligacao(C_D, C_T, _, _),  conectada(C_T, C_O).

% 2 - b
distancia(C_O, C_D, D) :- ligacao(C_O, C_D, _, D).
distancia(C_O, C_D, D) :- ligacao(C_O, C_T, _, D1),
                        distancia(C_T, C_D, D2),
                        D is D1 + D2.
distancia(C_O, C_D, D) :- ligacao(C_D, C_O, _, D).
distancia(C_O, C_D, D) :- ligacao(C_D, C_T, _, D1),
                        distancia(C_T, C_O, D2),
                        D is D1 + D2.

% 2 - c

caminho(C_O, C_D, Caminho) :-
    caminho_aux(C_O, C_D, [C_O], Caminho).

caminho_aux(C_D, C_D, Caminho, Caminho).
caminho_aux(C_T, C_D, CaminhoPercorrido, Caminho) :-
    ligacao(C_T, ProximaCidade, _, _),
    \+ member(ProximaCidade, CaminhoPercorrido),
    append(CaminhoPercorrido, [ProximaCidade], NovoCaminhoPercorrido),
    caminho_aux(ProximaCidade, C_D, NovoCaminhoPercorrido, Caminho).
caminho_aux(CidadeAtual, CidadeDestino, CaminhoPercorrido, Caminho) :-
    volta(CidadeAtual, ProximaCidade, _, _),
    \+ member(ProximaCidade, CaminhoPercorrido),
    append(CaminhoPercorrido, [ProximaCidade], NovoCaminhoPercorrido),
    caminho_aux(ProximaCidade, CidadeDestino, NovoCaminhoPercorrido, Caminho).
