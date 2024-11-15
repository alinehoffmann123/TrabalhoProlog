% Sistema de Treino

boas_vindas :-
    write('Bem-vindo ao sistema de sugestao de treinos de academia!'), nl,
    write('Aqui voce pode obter planos de treino personalizados baseados em seu objetivo, experiencia e disponibilidade de tempo.'), nl,
    write('Por favor, siga as instrucoes para escolher as opcoes de treino.'), nl, nl,
    write('Sistema desenvolvido por: Aline Fernanda Hoffmann.'), nl, nl.

treino(hipertrofia) :- objetivo(ganhar_massa), experiencia(intermediario).
treino(perda_de_peso) :- objetivo(emagrecer), experiencia(iniciante), disponibilidade(tempo_limitado).
treino(condicionamento) :- objetivo(condicionamento), experiencia(iniciante), disponibilidade(tempo_moderado).
treino(hipertrofia_avancado) :- objetivo(ganhar_massa), experiencia(avancado).
treino(perda_de_peso_avancado) :- objetivo(emagrecer), experiencia(avancado), disponibilidade(tempo_amplo).
treino(perda_de_peso) :- objetivo(emagrecer), experiencia(avancado), disponibilidade(tempo_limitado). % Nova regra para o caso avancado e tempo limitado

% Exemplos de planos de treino detalhados
plano(hipertrofia) :-
    write('Plano de Hipertrofia: '), nl,
    write('1. Supino reto: 4 series de 6-8 repeticoes.'), nl,
    write('2. Agachamento: 4 series de 6-8 repeticoes.'), nl,
    write('3. Triceps no puxador: 3 series de 8-10 repeticoes.'), nl,nl.

plano(perda_de_peso) :-
    write('Plano para Perda de Peso: '), nl,
    write('1. Corrida: 20 minutos em ritmo moderado.'), nl,
    write('2. Agachamento com peso corporal: 3 series de 15 repeticoes.'), nl, nl.

plano(condicionamento) :-
    write('Plano para Condicionamento Fisico: '), nl,
    write('1. Pular corda: 15 minutos.'), nl,
    write('2. Burpees: 3 series de 10 repeticoes.'), nl, nl.

plano(hipertrofia_avancado) :-
    write('Plano Avancado para Hipertrofia: '), nl,
    write('1. Supino reto: 4 series de 4-6 repeticoes.'), nl,
    write('2. Agachamento pesado: 5 series de 4-6 repeticoes.'), nl,
    write('3. Levantamento terra: 4 series de 4-6 repeticoes.'), nl, nl.

plano(perda_de_peso_avancado) :-
    write('Plano Avancado para Perda de Peso: '), nl,
    write('1. HIIT (treino intervalado de alta intensidade): 30 minutos.'), nl,
    write('2. Agachamento com barra: 4 series de 10 repeticoes.'), nl, nl.

% Perguntas ao usuario
perguntar_objetivo :-
    write('Qual e o seu objetivo? (ganhar_massa, emagrecer, condicionamento): '),
    read(Objetivo),
    asserta(objetivo(Objetivo)).

perguntar_experiencia :-
    write('Qual o seu nivel de experiencia? (iniciante, intermediario, avancado): '),
    read(Experiencia),
    asserta(experiencia(Experiencia)).

perguntar_disponibilidade :-
    write('Qual a sua disponibilidade de tempo? Temos: '), nl,
    write('(tempo_limitado, tempo_moderado, tempo_amplo) '), nl,nl,
    read(Disponibilidade),
    asserta(disponibilidade(Disponibilidade)).

sugerir_treino :-
    boas_vindas, 
    perguntar_objetivo,
    perguntar_experiencia,
    perguntar_disponibilidade,
    treino(Treino),
    plano(Treino),
    adicionar_exercicio.

adicionar_exercicio :-
    write('Deseja adicionar mais exercicios ao plano de treino? '), nl,
    write('(Digite "sim" para adicionar ou "nao" para finalizar)'),
    read(Resposta),
    (   Resposta = 'sim' ->
        adicionar_exercicio_pessoal,
        adicionar_exercicio; 
        write('Plano de treino finalizado. Bom treino!'), nl
    ).

adicionar_exercicio_pessoal :-
    write('Digite o nome do exercicio que deseja adicionar: '),
    read(Exercicio),
    write('Digite o numero de series: '),
    read(Series),
    write('Digite o numero de repeticoes por serie: '),
    read(Repeticoes),
    format('Exercicio: ~w | Series: ~w | Repeticoes: ~w adicionados ao seu plano de treino.~n', [Exercicio, Series, Repeticoes]).

limpar :-
    retractall(objetivo(_)),
    retractall(experiencia(_)),
    retractall(disponibilidade(_)).
