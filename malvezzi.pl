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
mochila(azul), a_esquerda(Mochila1, Mochila2), nasceu(Nome2, maio),

% 4- Will está ao lado do menino que gosta de prob de logica
nome(will), ao_lado(Nome1, will), gosta(Nome1, prob_de_logica),

% 5- O garoto da mochila branca está exatamente à esquerda de Will
mochila(branca), exatamente_a_esquerda(Mochila1, Mochila2), nome(will),

% 6- Na terceira posição está quem gosta de suco de morango
Suco3 == morango,

% 7- Quem gosta de suco de uva gosta de prob de logica
gosta(Nome1, uva), gosta(Nome1, prob_de_logica),

% 8- O garoto que gosta do jogo da forca está ao lado do que gosta do 3 ou mais
jogo(jogo_da_forca), ao_lado(Jogo1, Jogo2), jogo('3_ou_mais'),

% 9- O menino que gosta de suco de uva está em algum lugar à direita do garoto da mochila azul
suco(uva), mochila(azul), algum_lugar_a_direita(Mochila1, Mochila2),

% 10- O garoto que gosta de biologia gosta de suco de morango
gosta(Nome1, biologia), gosta(Nome1, morango),

% 11- O menino que nasceu em janeiro está ao lado de quem nasceu em setembro
nasceu(Nome1, janeiro), ao_lado(Nome1, Nome2), nasceu(Nome2, setembro),

% 12- Quem gosta de suco de uva está exatamente à esquerda de quem gosta de portugues
gosta(Nome1, uva), gosta(Nome2, portugues), exatamente_a_esquerda(Nome1, Nome2),

% 13- O menino que gosta de matematica nasceu em dezembro
gosta(Nome1, matematica), nasceu(Nome1, dezembro),

% 14- Quem gosta de prob de logica está ao lado do menino da mochila amarela
gosta(Nome1, prob_de_logica), mochila(amarela), ao_lado(Nome1, Mochila1),

% 15- dono da mochila azul nasceu em janeiro
mochila(azul), nasceu(Nome1, janeiro),

% 16- O garoto que nasceu em setembro está ao lado de quem gosta do jogo cubo vermelho
nasceu(Nome1, setembro), ao_lado(Nome1, Nome2), jogo(cubo_vermelho),

% 17- Na primeira posição está quem gosta de suco de limao
Suco1 == limao,

% 18- Quem gosta de matematica gosta de suco de maracuja
gosta(Nome1, matematica), gosta(Nome1, maracuja),

% 19- Lenin está na quinta posição
nome(lenin), Pos == 5,

% 20- Em uma das pontas está o menino que adora jogar cubo vermelho
jogo(cubo_vermelho), (Pos == 1; Pos == 5),

% 21- Quem gosta do jogo da forca está ao lado do dono da mochila vermelha
gosta(jogo_da_forca), mochila(vermelha), ao_lado(Jogo1, Mochila),

% 22- Otavio está em uma das pontas
nome(otavio), (Pos == 1; Pos == 5),

% 23- Na terceira posição está o menino que gosta do jogo da forca
Jogo3 == jogo_da_forca.


