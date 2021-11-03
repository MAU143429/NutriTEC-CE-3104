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
verbo([soy|S],S).
verbo([diagnosticado|S],S).
verbo([llevar|S],S).
verbo([han|S],S).
verbo([habia|S],S).
verbo([empezar|S],S).
verbo([corro|S],S).
verbo([gustaria|S],S).
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
verbo([realizar|S],S).

%---------------------Pronombres---------------------%

pronombre([yo|S], S).
pronombre([mi|S], S).
pronombre([me|S], S).
pronombre([mis|S], S).

%-------------------Preposiciones--------------------%

preposicion([y|S],S).
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

%-------------------Padecimientos--------------------%
padecimiento(diabetes,diabetes).
padecimiento(dislipidemia,dislipidemia).
padecimiento(hiperlipidemia,dislipidemia).
padecimiento(hipercolesterolemia,dislipidemia).
padecimiento(obesidad,obesidad).
padecimiento(sobrepeso,obesidad).
padecimiento(gordura,obesidad).
padecimiento(gordo,obesidad).
padecimiento(gorda,obesidad).
padecimiento(celiaquia,celiaquia).
padecimiento(celiaco,celiaquia).
padecimiento(celiaca,celiaquia).
padecimiento(ninguno,no).
padecimiento(no,no).

%-------------------Dietas--------------------%
tipo_dieta(keto,p1).
tipo_dieta(cetogenica,p1).
tipo_dieta(proteica,p2).
tipo_dieta(vegetariana,p3).
tipo_dieta(vegana,p4).
tipo_dieta(ninguno,p5).
tipo_dieta(no,p5).

%-------------------Calorias--------------------%
calorias(1000,principiante).
calorias(1100,principiante).
calorias(1200,principiante).
calorias(1300,principiante).
calorias(1400,principiante).
calorias(1500,principiante).
calorias(1600,intermedio).
calorias(1700,intermedio).
calorias(1800,intermedio).
calorias(1900,intermedio).
calorias(2000,intermedio).
calorias(2100,intermedio).
calorias(2200,intermedio).
calorias(2300,intermedio).
calorias(2400,intermedio).
calorias(2500,avanzado).
calorias(2600,avanzado).
calorias(2700,avanzado).
calorias(2800,avanzado).
calorias(2900,avanzado).
calorias(3000,avanzado).

%---------------Niveles por calorias------------------%
nivel_calorias('principiante',[1000,1100,1200,1300,1400,1500]).
nivel_calorias('intermedio',[1600,1700,1800,1900,2000,2100,2200,2300,2400]).
nivel_calorias('avanzado',[2500,2600,2700,2800,2900,3000]).

%------------Niveles por actividad fisica-------------%

nivel('principiante',[0,1,2]).
nivel('intermedio',[3,4]).
nivel('avanzado',[5,6,7]).

%-------relacion de la dieta con el padecimiento------%
relacion_dieta_padecimiento([no,ninguno],'no').
relacion_dieta_padecimiento([diabetes],'proteica').
relacion_dieta_padecimiento([celiaquia,celiaco,celiaca],'vegetariana').
relacion_dieta_padecimiento([dislipidemia,hiperlipidemia,hipercolesterolemia],'vegana').
relacion_dieta_padecimiento([obesidad,gordo,gorda,sobrepeso],'keto').

%---------------------Sintagmas----------------------%

%-------------------Sintagma verbal------------------%
sintagma_verbal(Oracion,S):- verbo(Oracion,Oracion1),verbo(Oracion1,Oracion2),preposicion(Oracion2,S).
sintagma_verbal(Oracion,S):- verbo(Oracion,Oracion1),verbo(Oracion1,S).
sintagma_verbal(Oracion,S):- verbo(Oracion,S).

%------------------Sintagma nominal------------------%
sintagma_nominal(Oracion,S):-pronombre(Oracion,S).

%---------------Lee el saludo en la oracion---------------%
saludo_inicial(Oracion,S):-saludo(Oracion,Oracion1),saludo(Oracion1,Oracion2),saludo(Oracion2,Oracion3),saludo(Oracion3,Oracion4),saludo(Oracion4,S).
saludo_inicial(Oracion,S):-saludo(Oracion,Oracion1),saludo(Oracion1,Oracion2),saludo(Oracion2,Oracion3),saludo(Oracion3,S).
saludo_inicial(Oracion,S):-saludo(Oracion,Oracion1),saludo(Oracion1,Oracion2),saludo(Oracion2,S).
saludo_inicial(Oracion,S):-saludo(Oracion,Oracion1),saludo(Oracion1,S).
saludo_inicial(Oracion,S):-saludo(Oracion,S).

%----------------Palabras de despedida---------------%
despedida([muchas|S],S).
despedida([gracias|S],S).
despedida([adios|S],S).
despedida([chao|S],S).
despedida([nutriTEC|S],S).

%---------------Lee la despedida en la oracion---------------%
despedida_final(Oracion,S):-despedida(Oracion,Oracion1),despedida(Oracion1,Oracion2),despedida(Oracion2,Oracion3),despedida(Oracion3,S).
despedida_final(Oracion,S):-despedida(Oracion,Oracion1),despedida(Oracion1,Oracion2),despedida(Oracion2,S).
despedida_final(Oracion,S):-despedida(Oracion,Oracion1),despedida(Oracion1,S).
despedida_final(Oracion,S):-despedida(Oracion,S).

%----------------Palabras para recibir en que lo ayuda nutritec---------------%
ayuda([estilo|S],S).
ayuda([vida|S],S).
ayuda([saludable|S],S).
ayuda([peso|S],S).
ayuda([normal|S],S).
ayuda([mejorar|S],S).
ayuda([salud|S],S).
ayuda([sobrepeso|S],S).
ayuda([diabetes|S],S).
ayuda([dislipidemia|S],S).
ayuda([hiperlipidemia|S],S).
ayuda([hipercolesterolemia|S],S).
ayuda([obesidad|S],S).
ayuda([gordura|S],S).
ayuda([gordo|S],S).
ayuda([gorda|S],S).
ayuda([celiaquia|S],S).
ayuda([celiaco|S],S).
ayuda([celiaca|S],S).
ayuda([celiaca|S],S).
ayuda([gracias|S],S).

%------------Analiza la oracion para leer en que ayuda al usuario-------------%

oracion_ayuda(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),preposicion(Oracion2,S).
oracion_ayuda(Oracion,S):-ayuda(Oracion,S).
oracion_ayuda(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),determinante(Oracion2,Oracion3),ayuda(Oracion3,Oracion4),preposicion(Oracion5,Oracion6),ayuda(Oracion6,Oracion7),ayuda(Oracion7,S).
oracion_ayuda(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),ayuda(Oracion2,Oracion3),pronombre(Oracion3,Oracion4),ayuda(Oracion4,S).
oracion_ayuda(Oracion,S):-sintagma_verbal(Oracion,Oracion1),preposicion(Oracion1,Oracion2),ayuda(Oracion2,Oracion3),ayuda(Oracion3,S).
oracion_ayuda(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),ayuda(Oracion2,S).
oracion_ayuda(Oracion,S):-sintagma_verbal(Oracion,Oracion1),ayuda(Oracion1,Oracion2),sintagma_nominal(Oracion2,Oracion3),ayuda(Oracion3,S).
oracion_ayuda(Oracion,S):-sintagma_verbal(Oracion,Oracion1),ayuda(Oracion1,Oracion2),preposicion(Oracion2,Oracion3),sintagma_verbal(Oracion3,Oracion4),determinante(Oracion4,Oracion5),ayuda(Oracion5,Oracion6),preposicion(Oracion6,Oracion7),ayuda(Oracion7,Oracion8),ayuda(Oracion8,S).
oracion_ayuda(Oracion,S):-sintagma_verbal(Oracion,Oracion1),ayuda(Oracion1,Oracion2),preposicion(Oracion2,Oracion3),sintagma_verbal(Oracion3,Oracion4),preposicion(Oracion4,Oracion5),determinante(Oracion6,Oracion7),ayuda(Oracion7,Oracion8),ayuda(Oracion8,S).
oracion_ayuda(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),determinante(Oracion2,Oracion3),ayuda(Oracion3,Oracion4),preposicion(Oracion4,Oracion5),ayuda(Oracion5,Oracion6),ayuda(Oracion6,S).
oracion_ayuda(Oracion,S):-sintagma_verbal(Oracion,Oracion1),determinante(Oracion1,Oracion2),ayuda(Oracion2,Oracion3),preposicion(Oracion3,Oracion4),ayuda(Oracion4,Oracion5),ayuda(Oracion5,S).
oracion_ayuda(Oracion,S):-sintagma_verbal(Oracion,Oracion1),ayuda(Oracion1,Oracion2),sintagma_verbal(Oracion2,Oracion3),ayuda(Oracion3,Oracion4),preposicion(Oracion4,Oracion5),sintagma_verbal(Oracion5,Oracion6),preposicion(Oracion6,Oracion7),determinante(Oracion7,Oracion8),ayuda(Oracion8,Oracion9),ayuda(Oracion9,S).


%-----------------------------------------------------------------------%

%----------------Responde con no----------------%
respuesta_no([no|[]],[]).
respuesta_no([no|_]).
respuesta_no([no|S],S).


%----------------Responde con si----------------%
respuesta_si([si|[]],[]).
respuesta_si([si|_]).
respuesta_si([si|S],S).


%------------Analiza la oracion para encontrar padecimiento-------------%
%busca si el padecimiento esta definido en el programa
encontrar_padecimiento(Padecimiento):- padecimiento(Padecimiento,_).

leer_padecimiento([P|[]]):-encontrar_padecimiento(P).
oracion([P|_],P):-encontrar_padecimiento(P).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),preposicion(Oracion2,S),leer_padecimiento(S).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,S),leer_padecimiento(S).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),determinante(Oracion2,S),leer_padecimiento(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,Oracion1),preposicion(Oracion1,S),leer_padecimiento(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,S),leer_padecimiento(S).
oracion(Oracion,S):-respuesta_si(Oracion,Oracion1),sintagma_nominal(Oracion1,Oracion2),sintagma_verbal(Oracion2,Oracion3),preposicion(Oracion3,S),leer_padecimiento(S).
oracion(Oracion,S):-respuesta_si(Oracion,Oracion1),sintagma_nominal(Oracion1,Oracion2),sintagma_verbal(Oracion2,Oracion3),determinante(Oracion3,S),leer_padecimiento(S).
oracion(Oracion,S):-respuesta_si(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),determinante(Oracion2,S),leer_padecimiento(S).
oracion(Oracion,S):-respuesta_si(Oracion,Oracion1),sintagma_verbal(Oracion1,S),leer_padecimiento(S).
oracion(Oracion,S):-respuesta_no(S).
%-----------------------------------------------------------------------%

%--------------Analiza la oracion para encontrar calorias---------------%
%busca si la cantidad de calorias esta definida en el programa
encontrar_cantidad_calorias(Calorias):- calorias(Calorias,_).

leer_cantidad_calorias([C|[]]):-encontrar_cantidad_calorias(C).
oracion([C|_],C):-encontrar_cantidad_calorias(C).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),determinante(Oracion2,S),leer_cantidad_calorias(S).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,S),leer_cantidad_calorias(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,Oracion1),preposicion(Oracion1,S),leer_cantidad_calorias(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,S),leer_cantidad_calorias(S).
oracion(Oracion,S):-respuesta_no(S).

%-----------------------------------------------------------------------%

%------------Analiza la oracion para encontrar tipo de dieta------------%
%busca si la dieta deseada esta definida en el programa
encontrar_tipo_dieta(Dieta):- tipo_dieta(Dieta,_).

palabra_dieta([dieta|S],S).

leer_tipo_dieta([D|[]]):-encontrar_tipo_dieta(D).
oracion([D|_],D):-encontrar_tipo_dieta(D).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),determinante(Oracion2,Oracion3),palabra_dieta(Oracion3,S),leer_tipo_dieta(S).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,S),leer_tipo_dieta(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,S),leer_tipo_dieta(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,Oracion1),determinante(Oracion1,S),leer_tipo_dieta(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,Oracion1),determinante(Oracion1,Oracion2),palabra_dieta(Oracion2,S),leer_tipo_dieta(S).
oracion(Oracion,S):-respuesta_no(S).
oracion(Oracion,S):-leer_tipo_dieta(S).



