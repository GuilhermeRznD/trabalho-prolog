%MAIN

main :-
    statistics(cputime, T1),
    modelo(Solucao),
    imprime_lista(Solucao),
    fail.
main :-
    statistics(cputime, T2),
    write('\n\nFim da busca. Tempo total (cputime): '), write(T2), nl.

%MODELO

modelo([
    (Mochila1, Nome1, Mes1, Jogo1, Materia1, Suco1),
    (Mochila2, Nome2, Mes2, Jogo2, Materia2, Suco2),
    (Mochila3, Nome3, Mes3, Jogo3, Materia3, Suco3),
    (Mochila4, Nome4, Mes4, Jogo4, Materia4, Suco4),
    (Mochila5, Nome5, Mes5, Jogo5, Materia5, Suco5)
]) :-


%DOMINIO
    mochila(Mochila1), mochila(Mochila2), mochila(Mochila3), mochila(Mochila4), mochila(Mochila5),
    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4), nome(Nome5),
    mes(Mes1), mes(Mes2), mes(Mes3), mes(Mes4), mes(Mes5),
    jogo(Jogo1), jogo(Jogo2), jogo(Jogo3), jogo(Jogo4), jogo(Jogo5),
    materia(Materia1), materia(Materia2), materia(Materia3), materia(Materia4), materia(Materia5),
    suco(Suco1), suco(Suco2), suco(Suco3), suco(Suco4), suco(Suco5),

%VALORES DISTINTOS
    alldifferent([Mochila1, Mochila2, Mochila3, Mochila4, Mochila5]),
    alldifferent([Nome1, Nome2, Nome3, Nome4, Nome5]),
    alldifferent([Mes1, Mes2, Mes3, Mes4, Mes5]),
    alldifferent([Jogo1, Jogo2, Jogo3, Jogo4, Jogo5]),
    alldifferent([Materia1, Materia2, Materia3, Materia4, Materia5]),
    alldifferent([Suco1, Suco2, Suco3, Suco4, Suco5]),
    
