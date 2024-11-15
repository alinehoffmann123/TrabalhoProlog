% Sistema de Livraria

:- dynamic genero/1, interesse/1.

livro('Orgulho e Preconceito', romance, relacoes, 'Um classico que explora as complexidades do amor e das barreiras sociais na Inglaterra do seculo XIX.').
livro('A Culpa e das Estrelas', romance, relacoes, 'A comovente jornada de dois jovens lidando com o cancer enquanto descobrem o amor verdadeiro.').
livro('Crepusculo', fantasia, aventura, 'Uma historia em que humanos, vampiros e lobisomens se entrelacam em uma narrativa de amor e misterio.').
livro('Outlander', romance, aventura, 'Uma enfermeira da Segunda Guerra Mundial e misteriosamente transportada para o passado, onde vive um intenso amor e grandes aventuras.').
livro('Jogos Vorazes', ficcao, aventura, 'Em uma sociedade futurista e opressiva, jovens sao forcados a lutar ate a morte em um evento cruel e mortal.').
livro('Divergente', ficcao, aventura, 'Beatrice descobre os segredos ocultos de uma sociedade dividida enquanto luta para definir sua identidade e sua liberdade.').
livro('Romeu e Julieta', romance, relacoes, 'A eterna historia de amor e tragedia entre dois jovens que pertencem a familias inimigas.').
livro('Os Instrumentos Mortais', fantasia, aventura, 'Clary Fray se ve envolvida em um mundo secreto de cacadores de sombras, monstros e magia antiga.').
livro('A Selecao', romance, aventura, 'Em um futuro distopico, jovens competem pela chance de se casar com o principe e ser coroada rainha.').
livro('O Morro dos Ventos Uivantes', romance, relacoes, 'Uma narrativa intensa e sombria sobre amor, vinganca e os traumas passados de duas familias.').

iniciar :-
    write('Ola! Seja bem-vindo ao nosso sistema BookRecommender!'), nl,
    write('Estamos prontos para te ajudar a escolher o proximo livro baseado no que voce gosta!'), nl, nl,
    write('Desenvolvido por: Aline Fernanda Hoffmann.'), nl,nl,
    
    write('Primeiro, qual genero voce mais aprecia? Oferecemos as opcoes: '), nl,
    write('romance, ficcao, fantasia.'), nl,
    read(Genero), assert(genero(Genero)),
    write('Agora, qual e o seu interesse principal? Escolha entre: '), nl,
    write('relacoes, aventura.'), nl,
    read(Interesse), assert(interesse(Interesse)),
    
    (livro(Titulo, Genero, Interesse, Sinopse) -> 
        format('Aqui esta a nossa recomendacao para voce: ~w.~nResumo: ~w~n', [Titulo, Sinopse])
    ; 
        (livro(TituloGenero, Genero, _, SinopseGenero) -> 
            format('Infelizmente, nao encontramos um livro que se encaixe perfeitamente nas suas escolhas.')
        ;
            write('Desculpe, mas nao temos um livro que corresponda exatamente as suas preferencias.')
        )
    ),
    limpar_preferencias.

limpar_preferencias :-
    retractall(genero(_)),
    retractall(interesse(_)).
