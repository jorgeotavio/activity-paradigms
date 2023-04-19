mora(joao, petrolina).
mora(maria, recife).
mora(pedro, araripina).

chega(joao, 10).
chega(maria, 8).
chega(pedro, 12).

lanche(joao, 5).
lanche(maria, 8).
lanche(pedro, 3).

cursa(joao, si).
cursa(maria, adm).
cursa(pedro, si).

grade(adm, administracao_geral).
grade(adm, marketing).
grade(adm, contabilidade).
grade(si, banco_de_dados).
grade(si, mpoo).
grade(si, algoritmos).

dia(segunda, administracao_geral).
dia(terça, marketing).
dia(quarta, contabilidade).
dia(segunda, banco_de_dados).
dia(terça, mpoo).
dia(quarta, algoritmos).

ensina(administracao_geral, jose).
ensina(marketing, mariana).
ensina(contabilidade, amanda).
ensina(banco_de_dados, edson).
ensina(mpoo, rivaldo).
ensina(algoritmos, igor).

curso_sala(sala_s, adm).
curso_sala(laboratorio_b, si).

sala_aluno(Dia, Curso, S) :- dia(Dia, M),
                                grade(Curso, M),
                                curso_sala(S, Curso).

professor_do_dia(Aluno, Dia, P) :- cursa(Aluno, C),
                                           grade(C, M),
                                           dia(Dia, M),
                                           ensina(M, P).

alunos_curso(C, Alunos) :- cursa(Aluno, C),
                            \+ member(Aluno, Alunos),
                            alunos_curso(C, [Aluno | Alunos], Alunos).

% usando o findall
alunos_curso(C, Alunos) :- findall(X, cursa(X, C), Alunos).


% usando recurssão
alunos_curso_rec(C, Alunos) :-
    alunos_curso_rec(C, [], Alunos).

alunos_curso_rec(C, Acc, Alunos) :-
    (cursa(X, C), \+ member(X, Acc)) ->
        alunos_curso_rec(C, [X|Acc], Alunos)
    ;
        reverse(Acc, Alunos).


