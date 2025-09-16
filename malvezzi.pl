%MAIN

main :-
    statistics(cputime, T1),
    modelo(Solucao),
    imprime_lista(Solucao),
    fail.
main :-
    statistics(cputime, T2),
    write('\n\nFim da busca. Tempo total (cputime): '), write(T2), nl.


%REGRAS AUXILIARES
%A ESQUERDA
    a_esquerda(pos1, pos2) :-
        pos1 < pos2.
        
%AO LADO
    ao_lado(pos1, pos2) :-
        pos2 is pos1 + 1.
    ao_lado(pos2, pos1) :-
        pos2 is pos1 + 1.

%EXATAMENTE A ESQUERDA
    exatamente_a_esquerda(pos1, pos2) :-
        pos2 is pos1 + 1.

%ALGUM LUGAR A DIREITA
    algum_lugar_a_direita(pos1, pos2) :-
        pos2 > pos1.


%DEFINICAO DOS DOMINIOS
%MOCHILAS
    mochila(amarela).
    mochila(azul).
    mochila(branca).
    mochila(verde).
    mochila(vermelha).

%NOMES
    nome(denis).
    nome(joao).
    nome(lenin).
    nome(otavio).
    nome(will).

%MES
    mes(agosto).
    mes(dezembro).
    mes(janeiro).
    mes(maio).
    mes(setembro).

%JOGO
    jogo(3_ou_mais).
    jogo(caca_palavras).
    jogo(cubo_vermelho).
    jogo(jogo_da_forca).
    jogo(prob_de_logica).

%MATERIA
    materia(biologia).
    materia(geografia).
    materia(historia).
    materia(matemarica).
    mateira(portugues).

%SUCO
    suco(laranja).
    suco(limao).
    suco(maracuja).
    suco(morango).
    suco(uva).


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


%RESTRICOES
% 1- O menino que nasceu no mês de setembro está ao lado de quem gosta de suco de laranja
nasceu(Nome1, setembro), ao_lado(Nome1, Nome2), gosta(Nome2, laranja),

% 2- joao gosta de historia
gosta(joao, historia),

% 3- O garoto da mochila azul está em algum lugar à esquerda de quem nasceu em maio
mochila(azul, a_esquerda(Mochila1, Mochila2), nasceu(Nome2, maio),

% 4- Will está ao lado do menino que gosta de prob de logica
nome(will), ao_lado(Nome1, will), gosta(Nome1, prob_de_logica),

% 5- O garoto da mochila branca está exatamente à esquerda de Will
mochila(branca), exatamente_a_esquerda(Mochila1, Mochila2), nome(will),

% 6- Na terceira posição está quem gosta de suco de morango
Suco3 == morango,

% 7- Quem gosta de suco de uva gosta de prob de logica
gosta(Nome1, uva), gosta(Nome1, prob_de_logica),

