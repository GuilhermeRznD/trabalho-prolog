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

%DEFINIÇÃO DE DOMÍNÍO