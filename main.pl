ligacao(araripina, ouricuri, br316, 60) .
ligacao(ouricuri, salgueiro, br316, 114) .
ligacao(salgueiro, serratalhada, br232, 100) .
ligacao(serratalhada, custodia, br232, 77) .
ligacao(custodia, arcoverde, br232, 80) .

ligacao(riodejaneiro, riobonito, br101, 100) .
ligacao(riobonito, cabofrio, br101, 120) .
ligacao(cabofrio, buzios, br101, 40) .

conectadas(C1,C2) :- ligacao(C1, C2, _, _) .
conectadas(C1,C2) :- ligacao(C1, C3, _, _),  conectadas(C3, C2).

distancia(C1, C2, D) :- ligacao(C1, C2, _, D).
distancia(C1, C2, D) :- ligacao(C1, C3, _, D1),
                        distancia(C3, C2, D2),
                        D is D1 + D2.

