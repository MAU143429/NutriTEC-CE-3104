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


%------------Niveles de actividad fisica-------------%
nivel(0,'principiante')
nivel(1,'principiante')
nivel(2,'principiante')
nivel(3,'intermedio')
nivel(4,'intermedio')
nivel(5,'avanzado')
nivel(6,'avanzado')
nivel(7,'avanzado')

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


%----------------Responde con no----------------%
respuesta_no([no|[]],[]).
respuesta_no([no|_]).


%----------------Responde con si----------------%
respuesta_si([si|[]],[]).
respuesta_si([si|_]).


%------------Analiza la oracion para encontrar padecimiento-------------%

leer_padecimiento([P|[]]):- encontrar_padecimiento(P).
oracion([P|_],P):- encontrar_padecimiento(P).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),preposicion(Oracion2,S),leer_padecimiento(S).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,S),leer_padecimiento(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,Oracion1),preposicion(Oracion1,S),leer_padecimiento(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,S),leer_padecimiento(S).
%-----------------------------------------------------------------------%


%--------------Analiza la oracion para encontrar calorias---------------%

leer_cantidad_calorias([C|[]]):- encontrar_cantidad_calorias(C).
oracion([C|_],C):- encontrar_cantidad_calorias(C).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),preposicion(Oracion2,S),leer_cantidad_calorias(S).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,S),leer_cantidad_calorias(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,Oracion1),preposicion(Oracion1,S),leer_cantidad_calorias(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,S),leer_cantidad_calorias(S).
%-----------------------------------------------------------------------%



