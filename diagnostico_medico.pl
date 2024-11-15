% Sistema de Diagnostico Medico

doenca(gripe) :- sintoma(febre), sintoma(tosse), sintoma(cansaco).
doenca(infeccao_viral) :- sintoma(febre), sintoma(dor_de_garganta), sintoma(dor_muscular).
doenca(enxaqueca) :- sintoma(dor_de_cabeca), sintoma(sensibilidade_luz), sintoma(nauseas).
doenca(resfriado_comum) :- sintoma(coriza), sintoma(espirros), sintoma(dor_de_garganta).
doenca(faringite) :- sintoma(dor_de_garganta), sintoma(febre), sintoma(dificuldade_ao_engolir).

% Texto associado a cada sintoma
pergunta_texto(febre, "Voce esta com febre? (s/n) ").
pergunta_texto(tosse, "Voce esta com tosse? (s/n) ").
pergunta_texto(cansaco, "Voce esta se sentindo cansado? (s/n) ").
pergunta_texto(dor_de_garganta, "Voce esta com dor de garganta? (s/n) ").
pergunta_texto(dor_muscular, "Voce esta com dor muscular? (s/n) ").
pergunta_texto(dor_de_cabeca, "Voce esta com dor de cabeca? (s/n) ").
pergunta_texto(sensibilidade_luz, "Voce sente sensibilidade a luz? (s/n) ").
pergunta_texto(nauseas, "Voce esta com nauseas? (s/n) ").
pergunta_texto(coriza, "Voce esta com coriza? (s/n) ").
pergunta_texto(espirros, "Voce esta espirrando frequentemente? (s/n) ").
pergunta_texto(dificuldade_ao_engolir, "Voce sente dificuldade ao engolir? (s/n) ").

% Perguntar sintomas ao usuario e armazenar as respostas
coletar_respostas([], []).
coletar_respostas([Sintoma | OutrosSintomas], [(Sintoma, Resposta) | RespostasRestantes]) :-
    pergunta_texto(Sintoma, Pergunta),
    write(Pergunta),
    read(Resposta),
    coletar_respostas(OutrosSintomas, RespostasRestantes).

% Verificar se um sintoma foi confirmado
sintoma(Sintoma) :-
    respostas(Respostas),
    member((Sintoma, 's'), Respostas).

% Diagnostico
diagnostico :-
    (   doenca(Doenca), format("Diagnostico sugerido: ~w.~n", [Doenca]), !,
        write('Va ao medico caso os sintomas persistirem.'));
    (   write("Nao foi possivel identificar a doenca. Recomendamos consultar um medico."), nl).

% Funcao principal para diagnosticar o paciente
diagnosticar_paciente :-
    write("Bem-vindo ao Sistema da Clinica Vida Melhor!"), nl,
    write("Por favor, responda as perguntas a seguir para que possamos dar o seu diagnostico o quanto antes."), nl, nl,
    write("Sistema desenvolvido por: Aline Fernanda Hoffmann"), nl, nl,
    findall(Sintoma, pergunta_texto(Sintoma, _), Sintomas),
    coletar_respostas(Sintomas, Respostas),
    asserta(respostas(Respostas)),
    diagnostico,
    retract(respostas(_)).
