%-----------Gramaticas de clausulas definidas---------%


%--------------------Determinantes--------------------%
% determinantes definidos
determinante([el|S],S).
determinante([la|S],S).
determinante([los|S],S).
determinante([las|S],S).
% determinantes indefinidos
determinante([un|S],S).
determinante([una|S],S).
determinante([unos|S],S).
determinante([unas|S],S).

determinante([mucho|S],S).
determinante([muchos|S],S).
determinante([mucha|S],S).
determinante([muchas|S],S).
determinante([como|S],S).

%------------------Palabras de saludo-----------------%

saludo([hola|S],S).
saludo([nutriTEC|S],S).
saludo([buenos|S],S).
saludo([dias|S],S).
saludo([buenas|S],S).
saludo([tardes|S],S).
saludo([noches|S],S).

%-----------------------Verbos------------------------%
% infinitivos se toman como verbos

verbo([deseo|S],S).
verbo([diagnosticado|S],S).
verbo([llevar|S],S).
verbo([han|S],S).
verbo([hab�a|S],S).
verbo([empezar|S],S).
verbo([corro|S],S).
verbo([gustar�a|S],S).
verbo([tengo|S],S).
verbo([llegar|S],S).
verbo([estoy|S],S).
verbo([realizo|S],S).
verbo([practico|S],S).
verbo([hago|S],S).
verbo([quiero|S],S).
verbo([hacer|S],S).
verbo([padezco|S],S).
verbo([padecer|S],S).

%---------------------Pronombres---------------------%

pronombre([yo|S])
pronombre([mi|S], S).
pronombre([me|S], S).
pronombre([mis|S], S).

%-------------------Preposiciones--------------------%

preposicion([a|S],S).
preposicion([bajo|S],S).
preposicion([cabe|S],S).
preposicion([con|S],S).
preposicion([de|S],S).
preposicion([desde|S],S).
preposicion([en|S],S).
preposicion([entre|S],S).
preposicion([hacia|S],S).
preposicion([hasta|S],S).
preposicion([para|S],S).
preposicion([por|S],S).
preposicion([segun|S],S).
preposicion([son|S],S).
preposicion([sobre|S],S).

%---------------------Sintagmas----------------------%

%-------------------Sintagma verbal------------------%
sintagma_verbal(Oracion,S):- verbo(Oracion,Oracion1),verbo(Oracion1,Oracion2),preposicion(Oracion2,S).
sintagma_verbal(Oracion,S):- verbo(Oracion,Oracion1),verbo(Oracion1,S).
sintagma_verbal(Oracion,S):- verbo(Oracion,S).

%------------------Sintagma nominal------------------%
sintagma_nominal(Oracion,S):-pronombre(Oracion,S).

%---------------Entradas en la oracion---------------%
entrada(Oracion,S):-saludo(Oracion,Oracion1),saludo(Oracion1,Oracion2),saludo(Oracion2,Oracion3),saludo(Oracion3,Oracion4),saludo(Oracion4,S).
entrada(Oracion,S):-saludo(Oracion,Oracion1),saludo(Oracion1,Oracion2),saludo(Oracion2,Oracion3),saludo(Oracion3,S).
entrada(Oracion,S):-saludo(Oracion,Oracion1),saludo(Oracion1,Oracion2),saludo(Oracion2,S).
entrada(Oracion,S):-saludo(Oracion,Oracion1),saludo(Oracion1,S).
entrada(Oracion,S):-saludo(Oracion,S).

%---------------Salidas en la oracion---------------%
salida(Oracion,S):-despedida(Oracion,Oracion1),despedida(Oracion1,Oracion2),despedida(Oracion2,Oracion3),despedida(Oracion3,S).
salida(Oracion,S):-despedida(Oracion,Oracion1),despedida(Oracion1,Oracion2),despedida(Oracion2,S).
salida(Oracion,S):-despedida(Oracion,Oracion1),despedida(Oracion1,S).
salida(Oracion,S):-despedida(Oracion,S).

%----------------Palabras de despedida---------------%
despedida([muchas|S],S).
despedida([gracias|S],S).
despedida([adios|S],S).
despedida([chao|S],S).
despedida([nutriTEC|S],S).

existeDeporte([Deporte|[]]):- existe_deporte(Deporte).

existePadecimiento([Padecimiento|[]]):- existe_padecimiento(Padecimiento).



%----------------Responde con no----------------%
respuesta_no([no|[]],[]).
respuesta_no([no|_]).


%----------------Responde con si----------------%
respuesta_si([si|[]],[]).
respuesta_si([si|_]).


% Oraciones de deporte
%
oracion([X|_],X):-existe_deporte(X).
oracion(Oracion,S):-entrada(Oracion,Oracion1), sintagma_nominal(Oracion1,Oracion2),sintagma_verbal(Oracion2,S),existeDeporte(S).
oracion(Oracion,S):-entrada(Oracion,Oracion1), sintagma_verbal(Oracion1,S),existeDeporte(S).

oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,S),existeDeporte(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,S),existeDeporte(S).






% Oraciones de padecimiento
%
oracion([X|_],X):-existe_padecimiento(X).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),preposicion(Oracion2,S),existePadecimiento(S).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,S),existePadecimiento(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,Oracion1),preposicion(Oracion1,S),existePadecimiento(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,S),existePadecimiento(S).







