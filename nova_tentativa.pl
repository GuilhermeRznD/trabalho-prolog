
% PREDICADO PRINCIPAL E IMPRESSÃO 

main :-
    write('Resolvendo o quebra-cabeça de lógica...'), nl,
    solucao(Solucao),
    write('Solução encontrada:'), nl,
    imprime_solucao_em_lista(Solucao),
    nl, fail.
main :-
    write('Fim da busca por soluções.').

imprime_solucao_em_lista(Solucao) :-
    nl,
    imprime_meninos(Solucao, 1).

imprime_meninos([], _).
imprime_meninos([(Mochila, Nome, Mes, Jogo, Materia, Suco)|Resto], Index) :-
    format('--- Menino #~w ---~n', [Index]),
    format('Mochila: ~w~n', [Mochila]),
    format('Nome:    ~w~n', [Nome]),
    format('Mês:     ~w~n', [Mes]),
    format('Jogo:    ~w~n', [Jogo]),
    format('Matéria: ~w~n', [Materia]),
    format('Suco:    ~w~n', [Suco]),
    nl,
    NextIndex is Index + 1,
    imprime_meninos(Resto, NextIndex).

% LÓGICA DO PROBLEMA 

solucao(Solucao) :-

    % ESTRUTURA DA SOLUÇÃO
    Solucao = [
        (Mochila_1, Nome_1, Mes_1, Jogo_1, Materia_1, Suco_1),
        (Mochila_2, Nome_2, Mes_2, Jogo_2, Materia_2, Suco_2),
        (Mochila_3, Nome_3, Mes_3, Jogo_3, Materia_3, Suco_3),
        (Mochila_4, Nome_4, Mes_4, Jogo_4, Materia_4, Suco_4),
        (Mochila_5, Nome_5, Mes_5, Jogo_5, Materia_5, Suco_5)
    ],

    % APLICAÇÃO DOS DOMÍNIOS
    mochila(Mochila_1), mochila(Mochila_2), mochila(Mochila_3), mochila(Mochila_4), mochila(Mochila_5),
    nome(Nome_1), nome(Nome_2), nome(Nome_3), nome(Nome_4), nome(Nome_5),
    mes(Mes_1), mes(Mes_2), mes(Mes_3), mes(Mes_4), mes(Mes_5),
    jogo(Jogo_1), jogo(Jogo_2), jogo(Jogo_3), jogo(Jogo_4), jogo(Jogo_5),
    materia(Materia_1), materia(Materia_2), materia(Materia_3), materia(Materia_4), materia(Materia_5),
    suco(Suco_1), suco(Suco_2), suco(Suco_3), suco(Suco_4), suco(Suco_5),

    % RESTRIÇÕES DE UNICIDADE
    alldifferent([Mochila_1, Mochila_2, Mochila_3, Mochila_4, Mochila_5]),
    alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),
    alldifferent([Mes_1, Mes_2, Mes_3, Mes_4, Mes_5]),
    alldifferent([Jogo_1, Jogo_2, Jogo_3, Jogo_4, Jogo_5]),
    alldifferent([Materia_1, Materia_2, Materia_3, Materia_4, Materia_5]),
    alldifferent([Suco_1, Suco_2, Suco_3, Suco_4, Suco_5]),

    % -- Regras de Posição Fixa e Associação Direta --
    Suco_3 = morango,
    Jogo_3 = jogo_da_forca,
    Suco_1 = limao,
    Nome_5 = lenin,
    (Nome_1 = otavio ; Nome_5 = otavio),
    (Jogo_1 = cubo_vermelho ; Jogo_5 = cubo_vermelho),
    member((_, joao, _, _, historia, _), Solucao),
    member((_, _, _, _, biologia, morango), Solucao),
    member((azul, _, janeiro, _, _, _), Solucao),
    member((_, _, _, prob_de_logica, _, uva), Solucao),
    member((_, _, dezembro, _, matematica, _), Solucao),
    member((_, _, _, _, matematica, maracuja), Solucao),

    % -- Relações de Vizinhança e Posição Relativa --
    ao_lado((_,_,setembro,_,_,_), (_,_,_,_,_,laranja), Solucao),
    ao_lado((_,will,_,_,_,_), (_,_,_,prob_de_logica,_,_), Solucao),
    a_esquerda_imediata((branca,_,_,_,_,_), (_,will,_,_,_,_), Solucao),
    ao_lado((_,_,_,jogo_da_forca,_,_), (_,_,_,tres_ou_mais,_,_), Solucao),
    a_direita((_,_,_,_,_,uva), (azul,_,_,_,_,_), Solucao),
    ao_lado((_,_,janeiro,_,_,_), (_,_,setembro,_,_,_), Solucao),
    a_esquerda_imediata((_,_,_,_,_,uva), (_,_,_,_,portugues,_), Solucao),
    a_esquerda((azul,_,_,_,_,_), (_,_,maio,_,_,_), Solucao),
    ao_lado((_,_,_,prob_de_logica,_,_), (amarela,_,_,_,_,_), Solucao),
    ao_lado((_,_,setembro,_,_,_), (_,_,_,cubo_vermelho,_,_), Solucao),
    ao_lado((_,_,_,jogo_da_forca,_,_), (vermelha,_,_,_,_,_), Solucao).

% PREDICADOS AUXILIARES (sem alterações)

% Garante que todos os elementos de uma lista são diferentes.
alldifferent([]).
alldifferent([H|T]) :- not(member(H,T)), alldifferent(T).

% X está ao lado de Y
ao_lado(X, Y, Solucao) :- nextto(X, Y, Solucao) ; nextto(Y, X, Solucao).

% X está em algum lugar à direita de Y
a_direita(X, Y, Solucao) :-
    nth1(IndexX, Solucao, X),
    nth1(IndexY, Solucao, Y),
    IndexX > IndexY.

% X está em algum lugar à esquerda de Y
a_esquerda(X, Y, Solucao) :-
    nth1(IndexX, Solucao, X),
    nth1(IndexY, Solucao, Y),
    IndexX < IndexY.

% X está imediatamente à esquerda de Y
a_esquerda_imediata(X, Y, Solucao) :- nextto(X, Y, Solucao).

% FATOS (DOMÍNIOS POSSÍVEIS) (sem alterações)

mochila(amarela). mochila(azul). mochila(branca). mochila(verde). mochila(vermelha).
nome(denis). nome(joao). nome(lenin). nome(otavio). nome(will).
mes(agosto). mes(dezembro). mes(janeiro). mes(maio). mes(setembro).
jogo(tres_ou_mais). jogo(caca_palavras). jogo(cubo_vermelho). jogo(jogo_da_forca). jogo(prob_de_logica).
materia(biologia). materia(geografia). materia(historia). materia(matematica). materia(portugues).
suco(laranja). suco(limao). suco(maracuja). suco(morango). suco(uva).
