% Sistema de Analise Criminal

:- dynamic impressao_digital/2.
:- dynamic motivo/2.
:- dynamic testemunha/2.
:- dynamic relacao/2.

boas_vindas :-
    write('Bem-vindo ao Sistema Especialista de Analise Criminal!'), nl,
    write('Informe as evidencias e informacoes disponiveis, e o sistema sugerira suspeitos ou cenarios.'), nl, nl,
    write('Sistema desenvolvido por: Aline Fernanda Hoffmann.'), nl, nl.

impressao_digital(jose, lugar_crime).
motivo(jose, financeiro).
testemunha(ana, visto_discutindo).
relacao(jose, intima).

suspeito(Nome) :-
    impressao_digital(Nome, lugar_crime),
    motivo(Nome, financeiro).

teoria(crime_passional) :-
    testemunha(_, visto_discutindo),
    relacao(_, intima).

perguntar_evidencias :-
    write('Informe as evidencias: '), nl,
    write('1. Impressoes digitais? (Digite "sim" para adicionar ou "nao" para pular): '), nl,
    read(Resposta1),
    (   Resposta1 = 'sim' -> adicionar_impressao; true),
    write('2. Motivo suspeito? (Digite "sim" para adicionar ou "nao" para pular): '), nl,
    read(Resposta2),
    (   Resposta2 = 'sim' -> adicionar_motivo; true),
    write('3. Testemunha ocular? (Digite "sim" para adicionar ou "nao" para pular): '), nl,
    read(Resposta3),
    (   Resposta3 = 'sim' -> adicionar_testemunha; true).

adicionar_impressao :-
    write('Digite o nome do suspeito: '), read(Nome),
    write('Digite o local onde a impressao foi encontrada: '), read(Local),
    asserta(impressao_digital(Nome, Local)).

adicionar_motivo :-
    write('Digite o nome do suspeito: '), read(Nome),
    write('Digite o motivo (financeiro, vinganca, etc.): '), read(Motivo),
    asserta(motivo(Nome, Motivo)).

adicionar_testemunha :-
    write('Digite o nome da testemunha: '), read(Testemunha),
    write('Digite o que a testemunha viu: '), read(Detalhe),
    asserta(testemunha(Testemunha, Detalhe)).

consultar :-
    write('Deseja consultar suspeitos ou teorias? (Digite "suspeitos" ou "teorias"): '),
    read(Escolha),
    (   Escolha = 'suspeitos' -> consultar_suspeitos;
        Escolha = 'teorias' -> consultar_teorias;
        write('Escolha invalida.'), nl
    ).

consultar_suspeitos :-
    write('Suspeitos identificados: '), nl,
    findall(Suspeito, suspeito(Suspeito), Suspeitos),
    (   Suspeitos \= [] ->
        write(Suspeitos), nl;
        write('Nenhum suspeito identificado com as evidencias fornecidas.'), nl
    ).

consultar_teorias :-
    write('Teorias sugeridas: '), nl,
    findall(Teoria, teoria(Teoria), Teorias),
    (   Teorias \= [] ->
        write(Teorias), nl;
        write('Nenhuma teoria sugerida com as evidencias fornecidas.'), nl
    ).

limpar :-
    retractall(impressao_digital(_, _)),
    retractall(motivo(_, _)),
    retractall(testemunha(_, _)),
    retractall(relacao(_, _)).

analisar_caso :-
    boas_vindas,
    perguntar_evidencias,
    consultar,
    write('Deseja limpar a base de evidencias? (sim/nao): '), nl,
    read(Resposta),
    (   Resposta = 'sim' -> limpar, write('Base limpa!'), nl; true).
