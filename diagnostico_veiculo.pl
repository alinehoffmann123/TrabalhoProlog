% Sistema do problema veicular

sintoma(motor_nao_liga).
sintoma(luzes_fracas).
sintoma(barulho_ao_frear).
sintoma(pedal_freio_macio).
sintoma(vazamento_oleo).
sintoma(aquecimento_motor).
sintoma(dificuldade_engrenar_marcha).

problema(bateria_fraca) :- motor_nao_liga, luzes_fracas.
problema(freio_desgastado) :- barulho_ao_frear, pedal_freio_macio.
problema(baixo_nivel_oleo) :- vazamento_oleo, aquecimento_motor.
problema(problema_transmissao) :- dificuldade_engrenar_marcha.
problema(sobreaquecimento_motor) :- aquecimento_motor.

solucao(bateria_fraca, 'Verifique a bateria e, se necessario, recarregue ou substitua.').
solucao(freio_desgastado, 'Verifique as pastilhas de freio e o sistema hidraulico.').
solucao(baixo_nivel_oleo, 'Verifique o nivel de oleo e procure por vazamentos.').
solucao(problema_transmissao, 'Leve o carro a um mecanico especializado em transmissao.').
solucao(sobreaquecimento_motor, 'Verifique o sistema de arrefecimento e o nivel de agua do radiador.').

perguntar(Sintoma) :-
    write('O veiculo apresenta o seguinte problema: '), write(Sintoma), write('? (s/n): '),
    read(Resposta), nl,
    (Resposta == s -> assert(Sintoma); assert(nao(Sintoma)), fail).

:- dynamic motor_nao_liga/0, luzes_fracas/0, barulho_ao_frear/0, pedal_freio_macio/0,
           vazamento_oleo/0, aquecimento_motor/0, dificuldade_engrenar_marcha/0, nao/1.

motor_nao_liga :- nao(motor_nao_liga), !, fail.
motor_nao_liga :- \+ nao(motor_nao_liga), !, perguntar(motor_nao_liga).
luzes_fracas :- nao(luzes_fracas), !, fail.
luzes_fracas :- \+ nao(luzes_fracas), !, perguntar(luzes_fracas).
barulho_ao_frear :- nao(barulho_ao_frear), !, fail.
barulho_ao_frear :- \+ nao(barulho_ao_frear), !, perguntar(barulho_ao_frear).
pedal_freio_macio :- nao(pedal_freio_macio), !, fail.
pedal_freio_macio :- \+ nao(pedal_freio_macio), !, perguntar(pedal_freio_macio).
vazamento_oleo :- nao(vazamento_oleo), !, fail.
vazamento_oleo :- \+ nao(vazamento_oleo), !, perguntar(vazamento_oleo).
aquecimento_motor :- nao(aquecimento_motor), !, fail.
aquecimento_motor :- \+ nao(aquecimento_motor), !, perguntar(aquecimento_motor).
dificuldade_engrenar_marcha :- nao(dificuldade_engrenar_marcha), !, fail.
dificuldade_engrenar_marcha :- \+ nao(dificuldade_engrenar_marcha), !, perguntar(dificuldade_engrenar_marcha).

problema :-
    problema(Problema), !,
    solucao(Problema, Solucao),
    write('O problema mais provavel e: '), write(Problema), nl,
    write('Recomendacao: '), write(Solucao), nl.
problema :-
    write('Nao foi possivel identificar o problema com base nos sintomas.'), nl,
    write('Recomendamos levar o veiculo a um mecanico especializado.'), nl.

decobrir_problema :-
    write('Bem-vindo ao sistema da AutoDiag!'), nl,
    write('Por favor, responda as perguntas a seguir sobre os problemas do seu veiculo, para descobrirmos o que ha de errado com seu veiculo.'), nl,nl,
    write('Sistema desenvolvido por: Aline Fernanda Hoffmann'), nl,
    retractall(nao(_)),
    problema.
